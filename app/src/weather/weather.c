/*
 * SPDX-FileCopyrightText: 2024-2025 SiFli Technologies(Nanjing) Co., Ltd
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "rtthread.h"
#include "rtdevice.h"
#include "xiaozhi_client_public.h"
#include "lwip/api.h"
#include "lwip/dns.h"
#include <webclient.h>
#include <cJSON.h>
#include "ulog.h"
#include "bts2_app_inc.h"
#include "ntp.h"
#include "weather.h"
#include "littlevgl2rtt.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "lv_image_dsc.h"

static volatile int g_weather_sync_in_progress = 0;  // 天气同步进行标志
static volatile int g_ntp_sync_in_progress = 0;      // NTP同步进行标志

extern const lv_image_dsc_t w0;   // 晴
extern const lv_image_dsc_t w1;   // 多云
extern const lv_image_dsc_t w2;   // 阴
extern const lv_image_dsc_t w3;   // 阵雨
extern const lv_image_dsc_t w4;   // 雷阵雨
extern const lv_image_dsc_t w5;   // 雷阵雨伴有冰雹
extern const lv_image_dsc_t w6;   // 雨夹雪
extern const lv_image_dsc_t w7;   // 小雨
extern const lv_image_dsc_t w8;   // 中雨
extern const lv_image_dsc_t w9;   // 大雨
extern const lv_image_dsc_t w10;  // 暴雨
extern const lv_image_dsc_t w11;  // 大暴雨
extern const lv_image_dsc_t w12;  // 特大暴雨
extern const lv_image_dsc_t w13;  // 阵雪
extern const lv_image_dsc_t w14;  // 小雪
extern const lv_image_dsc_t w15;  // 中雪
extern const lv_image_dsc_t w16;  // 大雪
extern const lv_image_dsc_t w17;  // 暴雪
extern const lv_image_dsc_t w18;  // 雾
extern const lv_image_dsc_t w19;  // 冻雨
extern const lv_image_dsc_t w20;  // 沙尘暴
extern const lv_image_dsc_t w21;  // 小到中雨
extern const lv_image_dsc_t w22;  // 中到大雨
extern const lv_image_dsc_t w23;  // 大到暴雨
extern const lv_image_dsc_t w24;  // 暴雨到大暴雨
extern const lv_image_dsc_t w25;  // 大暴雨到特大暴雨
extern const lv_image_dsc_t w26;  // 小到中雪
extern const lv_image_dsc_t w27;  // 中到大雪
extern const lv_image_dsc_t w28;  // 大到暴雪
extern const lv_image_dsc_t w29;  // 浮尘
extern const lv_image_dsc_t w30;  // 扬沙
extern const lv_image_dsc_t w31;  // 强沙尘暴
extern const lv_image_dsc_t w32;  // 浓雾
extern const lv_image_dsc_t w33;  // 龙卷风
extern const lv_image_dsc_t w34;  // 弱高吹雪
extern const lv_image_dsc_t w35;  // 轻雾
extern const lv_image_dsc_t w36;  // 霾
extern const lv_image_dsc_t w37;  // 小雨转中雨
extern const lv_image_dsc_t w38;  // 中雨转大雨
extern const lv_image_dsc_t w99;  // 未知天气


// 天气API配置 - 心知天气免费版
#define WEATHER_API_KEY "SO23_Gmly2oK3kMf4" // 请替换为你的API密钥
#define WEATHER_API_HOST "api.seniverse.com"
#define WEATHER_API_URI                                                        \
    "/v3/weather/now.json?key=%s&location=%s&language=%s&unit=c"
#define WEATHER_LOCATION "ip"      // 默认城市，可以是城市名或经纬度
#define WEATHER_LANGUAGE "zh-Hans" // 中文简体
#define WEATHER_HEADER_BUFSZ 1024
#define WEATHER_RESP_BUFSZ 1024
#define WEATHER_URL_LEN_MAX 512


rt_device_t g_rtc_device = RT_NULL;
date_time_t g_current_time = {0};
weather_info_t g_current_weather = {0};


// 周几的字符串数组
static const char *weekday_names[] = {"周日", "周一", "周二", "周三",
                                      "周四", "周五", "周六"};
static const char *full_weekday_names[] = {"星期日", "星期一", "星期二", "星期三",
                                           "星期四", "星期五", "星期六"};

// 新增：月份的中文字符串数组
static const char *month_names[] = {"",     "一月",   "二月",  "三月", "四月",
                                    "五月", "六月",   "七月",  "八月", "九月",
                                    "十月", "十一月", "十二月"};
static const uint32_t lunar_info[] = {
    0x04bd8, 0x04ae0, 0x0a570, 0x054d5, 0x0d260, 0x0d950, 0x16554, 0x056a0, 0x09ad0, 0x055d2,
    0x04ae0, 0x0a5b6, 0x0a4d0, 0x0d250, 0x1d255, 0x0b540, 0x0d6a0, 0x0ada2, 0x095b0, 0x14977,
    0x04970, 0x0a4b0, 0x0b4b5, 0x06a50, 0x06d40, 0x1ab54, 0x02b60, 0x09570, 0x052f2, 0x04970,
    0x06566, 0x0d4a0, 0x0ea50, 0x06e95, 0x05ad0, 0x02b60, 0x186e3, 0x092e0, 0x1c8d7, 0x0c950,
    0x0d4a0, 0x1d8a6, 0x0b550, 0x056a0, 0x1a5b4, 0x025d0, 0x092d0, 0x0d2b2, 0x0a950, 0x0b557,
    0x06ca0, 0x0b550, 0x15355, 0x04da0, 0x0a5d0, 0x14573, 0x052d0, 0x0a9a8, 0x0e950, 0x06aa0,
    0x0aea6, 0x0ab50, 0x04b60, 0x0aae4, 0x0a570, 0x05260, 0x0f263, 0x0d950, 0x05b57, 0x056a0,
    0x096d0, 0x04dd5, 0x04ad0, 0x0a4d0, 0x0d4d4, 0x0d250, 0x0d558, 0x0b540, 0x0b5a0, 0x195a6,
    0x095b0, 0x049b0, 0x0a974, 0x0a4b0, 0x0b27a, 0x06a50, 0x06d40, 0x0af46, 0x0ab60, 0x09570,
    0x04af5, 0x04970, 0x064b0, 0x074a3, 0x0ea50, 0x06b58, 0x05ac0, 0x0ab60, 0x096d5, 0x092e0,
    0x0c960, 0x0d954, 0x0d4a0, 0x0da50, 0x07552, 0x056a0, 0x0abb7, 0x025d0, 0x092d0, 0x0cab5,
    0x0a950, 0x0b4a0, 0x0baa4, 0x0ad50, 0x055d9, 0x04ba0, 0x0a5b0, 0x15176, 0x052b0, 0x0a930,
    0x07954, 0x06aa0, 0x0ad50, 0x05b52, 0x04b60, 0x0a6e6, 0x0a4e0, 0x0d260, 0x0ea65, 0x0d530,
    0x05aa0, 0x076a3, 0x096d0, 0x04bd7, 0x04ad0, 0x0a4d0, 0x1d0b6, 0x0d250, 0x0d520, 0x0dd45,
    0x0b5a0, 0x056d0, 0x055b2, 0x049b0, 0x0a577, 0x0a4b0, 0x0aa50, 0x1b255, 0x06d20, 0x0ada0,
    0x14b63
};
static const char *lunar_month_names[] = {"正月", "二月", "三月", "四月", "五月", "六月",
                                          "七月", "八月", "九月", "十月", "十一月", "十二月"};
static const char *lunar_day_names[] = {
    "初一", "初二", "初三", "初四", "初五", "初六", "初七", "初八", "初九", "初十",
    "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十",
    "廿一", "廿二", "廿三", "廿四", "廿五", "廿六", "廿七", "廿八", "廿九", "三十"};
static const char *heavenly_stems[] = {"甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"};
static const char *earthly_branches[] = {"子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"};
// 添加NTP服务器列表
static const char *ntp_servers[] = {"ntp.aliyun.com", "time.windows.com",
                                    "pool.ntp.org", "cn.pool.ntp.org"};


// 前向声明
extern BOOL g_pan_connected;


/**
 * @brief 获取周几的中文字符串
 */
const char *xiaozhi_time_get_weekday_str(int weekday)
{
    if (weekday >= 0 && weekday <= 6)
    {
        return weekday_names[weekday];
    }
    return "未知";
}

static const char *xiaozhi_time_get_full_weekday_str(int weekday)
{
    if (weekday >= 0 && weekday <= 6)
    {
        return full_weekday_names[weekday];
    }
    return "星期一";
}

static int is_gregorian_leap_year(int year)
{
    return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
}

static int gregorian_days_in_month(int year, int month)
{
    static const int days_per_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    if (month == 2 && is_gregorian_leap_year(year))
    {
        return 29;
    }

    return days_per_month[month - 1];
}

static int gregorian_days_since_1900(int year, int month, int day)
{
    int days = 0;
    int y;
    int m;

    for (y = 1900; y < year; ++y)
    {
        days += is_gregorian_leap_year(y) ? 366 : 365;
    }

    for (m = 1; m < month; ++m)
    {
        days += gregorian_days_in_month(year, m);
    }

    return days + day - 1;
}

static int lunar_leap_month(int year)
{
    return lunar_info[year - 1900] & 0x0f;
}

static int lunar_leap_days(int year)
{
    if (lunar_leap_month(year))
    {
        return (lunar_info[year - 1900] & 0x10000) ? 30 : 29;
    }

    return 0;
}

static int lunar_month_days(int year, int month)
{
    return (lunar_info[year - 1900] & (0x10000 >> month)) ? 30 : 29;
}

static int lunar_year_days(int year)
{
    int sum = 348;
    uint32_t info = lunar_info[year - 1900];
    uint32_t bit;

    for (bit = 0x8000; bit > 0x8; bit >>= 1)
    {
        if (info & bit)
        {
            ++sum;
        }
    }

    return sum + lunar_leap_days(year);
}

static int format_lunar_text(int solar_year,
                             int solar_month,
                             int solar_day,
                             char *buffer,
                             size_t buffer_size)
{
    int offset;
    int lunar_year = 1900;
    int lunar_month = 1;
    int lunar_day = 1;
    int leap_month;
    int is_leap = 0;

    if (!buffer || buffer_size == 0)
    {
        return -RT_EINVAL;
    }

    if (solar_year < 1900 || solar_year >= 1900 + (int)(sizeof(lunar_info) / sizeof(lunar_info[0])))
    {
        rt_snprintf(buffer, buffer_size, "--");
        return -RT_ERROR;
    }

    offset = gregorian_days_since_1900(solar_year, solar_month, solar_day) -
             gregorian_days_since_1900(1900, 1, 31);
    if (offset < 0)
    {
        rt_snprintf(buffer, buffer_size, "--");
        return -RT_ERROR;
    }

    while (lunar_year < 1900 + (int)(sizeof(lunar_info) / sizeof(lunar_info[0])))
    {
        int year_days = lunar_year_days(lunar_year);
        if (offset < year_days)
        {
            break;
        }
        offset -= year_days;
        ++lunar_year;
    }

    leap_month = lunar_leap_month(lunar_year);
    while (lunar_month <= 12)
    {
        int month_days;

        if (leap_month > 0 && lunar_month == leap_month + 1 && !is_leap)
        {
            --lunar_month;
            is_leap = 1;
            month_days = lunar_leap_days(lunar_year);
        }
        else
        {
            month_days = lunar_month_days(lunar_year, lunar_month);
        }

        if (offset < month_days)
        {
            break;
        }

        offset -= month_days;

        if (is_leap && lunar_month == leap_month)
        {
            is_leap = 0;
        }

        ++lunar_month;
    }

    lunar_day = offset + 1;
    rt_snprintf(buffer,
                buffer_size,
                "%s%s年 %s%s",
                heavenly_stems[(lunar_year - 4) % 10],
                earthly_branches[(lunar_year - 4) % 12],
                is_leap ? "闰" : "",
                lunar_month_names[lunar_month - 1]);
    rt_snprintf(buffer + rt_strlen(buffer),
                buffer_size - rt_strlen(buffer),
                "%s",
                lunar_day_names[lunar_day - 1]);

    return RT_EOK;
}

/**
 * @brief 格式化时间和日期字符串
 */
void xiaozhi_time_format_strings(date_time_t *time_info)
{
    if (!time_info)
        return;

    // 安全检查，确保值在合理范围内
    if (time_info->year < 1900 || time_info->year > 2100)
    {
        LOG_W("Invalid year: %d, using default", time_info->year);
        time_info->year = 2024;
    }
    if (time_info->month < 1 || time_info->month > 12)
    {
        time_info->month = 1;
    }
    if (time_info->day < 1 || time_info->day > 31)
    {
        time_info->day = 1;
    }
    if (time_info->hour < 0 || time_info->hour > 23)
    {
        time_info->hour = 0;
    }
    if (time_info->minute < 0 || time_info->minute > 59)
    {
        time_info->minute = 0;
    }
    if (time_info->second < 0 || time_info->second > 59)
    {
        time_info->second = 0;
    }
    if (time_info->weekday < 0 || time_info->weekday > 6)
    {
        time_info->weekday = 0;
    }

    // 格式化日期字符串: "2024年12月25日 周三"
    rt_snprintf(time_info->date_str, sizeof(time_info->date_str),
                "%04d年%02d月%02d日 %s", time_info->year, time_info->month,
                time_info->day,
                xiaozhi_time_get_weekday_str(time_info->weekday));

    // 格式化时间字符串: "14:30:25"
    rt_snprintf(time_info->time_str, sizeof(time_info->time_str),
                "%02d:%02d:%02d", time_info->hour, time_info->minute,
                time_info->second);


}





/**
 * @brief 获取当前时间信息
 */
int xiaozhi_time_get_current(date_time_t *time_info)
{
    if (!time_info)
        return -RT_ERROR;

    time_t now;
    struct tm *tm_info;

    // 直接获取系统时间，不做任何额外处理
    now = time(RT_NULL);

    // 直接使用localtime，依赖系统已设置的时区
    tm_info = localtime(&now);
    if (!tm_info)
    {
        // 如果localtime失败，尝试gmtime + 手动加8小时
        tm_info = gmtime(&now);
        if (tm_info)
        {
            // 手动加8小时转换为北京时间
            tm_info->tm_hour += 8;
            if (tm_info->tm_hour >= 24)
            {
                tm_info->tm_hour -= 24;
                tm_info->tm_mday += 1;
                // 简化处理，不考虑月末情况
            }
        }
        else
        {
            // 完全失败，使用默认值
            rt_kprintf("Time conversion failed, using defaults\n");
            time_info->year = 2024;
            time_info->month = 1;
            time_info->day = 1;
            time_info->hour = 12;
            time_info->minute = 0;
            time_info->second = 0;
            time_info->weekday = 1;
            xiaozhi_time_format_strings(time_info);
            return RT_EOK;
        }
    }

    // 填充时间结构体
    time_info->year = tm_info->tm_year + 1900;
    time_info->month = tm_info->tm_mon + 1;
    time_info->day = tm_info->tm_mday;
    time_info->hour = tm_info->tm_hour;
    time_info->minute = tm_info->tm_min;
    time_info->second = tm_info->tm_sec;
    time_info->weekday = tm_info->tm_wday;

    // 格式化字符串
    xiaozhi_time_format_strings(time_info);

    return RT_EOK;
}


// DNS查找回调函数
static void weather_dns_found_callback(const char *name, const ip_addr_t *ipaddr, void *callback_arg)
{
    if (ipaddr != NULL) {
        LOG_I("DNS lookup succeeded, IP: %s\n", ipaddr_ntoa(ipaddr));
    }
}

// 检查网络连接状态
static int weather_check_internet_access(const char *hostname)
{
    ip_addr_t addr = {0};
    err_t err = dns_gethostbyname(hostname, &addr, weather_dns_found_callback, NULL);
    
    if (err != ERR_OK && err != ERR_INPROGRESS) {
        LOG_E("Could not find %s, please check PAN connection\n", hostname);
        return 0;
    }
    
    return 1;
}





int xiaozhi_weather_get(weather_info_t *weather_info)
{
    if (!weather_info)
        return -RT_ERROR;



        // 检查是否有同步正在进行中，避免并发调用
    if (g_weather_sync_in_progress) {
        LOG_W("Weather sync already in progress, skipping...");
        return -RT_EBUSY;
    }

    // 设置同步进行标志
    g_weather_sync_in_progress = 1;


    if (!g_pan_connected)
    {
        LOG_W("PAN not connected, cannot get weather");
            // 清除同步进行标志
        g_weather_sync_in_progress = 0;
        return -RT_ERROR;
    }



    int ret = -RT_ERROR;
    struct webclient_session *session = RT_NULL;
    char *weather_url = RT_NULL;
    char *buffer = RT_NULL;
    int resp_status;
    int content_length = -1, bytes_read = 0;
    int content_pos = 0;


    // 分配URL缓冲区
    weather_url = rt_calloc(1, WEATHER_URL_LEN_MAX);
    if (weather_url == RT_NULL)
    {
        LOG_E("No memory for weather_url!");
        goto __exit;
    }

    // 拼接GET网址
    rt_snprintf(weather_url, WEATHER_URL_LEN_MAX, "http://%s" WEATHER_API_URI,
                WEATHER_API_HOST, WEATHER_API_KEY, WEATHER_LOCATION,
                WEATHER_LANGUAGE);


    // 创建会话
    session = webclient_session_create(WEATHER_HEADER_BUFSZ);
    if (session == RT_NULL)
    {
        LOG_E("No memory for weather session!");
        goto __exit;
    }

    // 发送GET请求
    if ((resp_status = webclient_get(session, weather_url)) != 200)
    {
        LOG_E("Weather API request failed, response(%d) error.", resp_status);
        goto __exit;
    }

    // 分配接收缓冲区
    buffer = rt_calloc(1, WEATHER_RESP_BUFSZ);
    if (buffer == RT_NULL)
    {
        LOG_E("No memory for weather response buffer!");
        goto __exit;
    }

    // 读取响应内容
    content_length = webclient_content_length_get(session);
    if (content_length > 0)
    {
        do
        {
            bytes_read =
                webclient_read(session, buffer + content_pos,
                               content_length - content_pos >
                                       WEATHER_RESP_BUFSZ - content_pos - 1
                                   ? WEATHER_RESP_BUFSZ - content_pos - 1
                                   : content_length - content_pos);
            if (bytes_read <= 0)
            {
                break;
            }
            content_pos += bytes_read;
        } while (content_pos < content_length &&
                 content_pos < WEATHER_RESP_BUFSZ - 1);

        buffer[content_pos] = '\0'; // 确保字符串结束


        // 解析JSON响应
        cJSON *root = cJSON_Parse(buffer);
        if (!root)
        {
            LOG_E("Failed to parse weather JSON: %s", cJSON_GetErrorPtr());
            goto __exit;
        }

        // 解析results数组
        cJSON *results = cJSON_GetObjectItem(root, "results");
        if (!results || !cJSON_IsArray(results) ||
            cJSON_GetArraySize(results) == 0)
        {
            LOG_E("Invalid weather response: no results array");
            cJSON_Delete(root);
            goto __exit;
        }

        // 获取第一个结果
        cJSON *result = cJSON_GetArrayItem(results, 0);
        if (!result)
        {
            LOG_E("Invalid weather response: empty results");
            cJSON_Delete(root);
            goto __exit;
        }

        // 解析location信息
        cJSON *location = cJSON_GetObjectItem(result, "location");
        if (location)
        {
            cJSON *name = cJSON_GetObjectItem(location, "name");
            if (name && cJSON_IsString(name))
            {
                strncpy(weather_info->location, name->valuestring,
                        sizeof(weather_info->location) - 1);
                weather_info->location[sizeof(weather_info->location) - 1] =
                    '\0';
            }
        }

        // 解析now信息
        cJSON *now = cJSON_GetObjectItem(result, "now");
        if (!now)
        {
            LOG_E("Invalid weather response: no now object");
            cJSON_Delete(root);
            goto __exit;
        }

        // 解析天气现象文字
        cJSON *text = cJSON_GetObjectItem(now, "text");
        if (text && cJSON_IsString(text))
        {
            strncpy(weather_info->text, text->valuestring,
                    sizeof(weather_info->text) - 1);
            weather_info->text[sizeof(weather_info->text) - 1] = '\0';
        }

        // 解析天气现象代码
        cJSON *code = cJSON_GetObjectItem(now, "code");
        if (code && cJSON_IsString(code))
        {
            strncpy(weather_info->code, code->valuestring,
                    sizeof(weather_info->code) - 1);
            weather_info->code[sizeof(weather_info->code) - 1] = '\0';
        }

        // 解析温度
        cJSON *temperature = cJSON_GetObjectItem(now, "temperature");
        if (temperature && cJSON_IsString(temperature))
        {
            weather_info->temperature = atoi(temperature->valuestring);
        }

        // 记录更新时间
        weather_info->last_update = time(RT_NULL);

        cJSON_Delete(root);
        LOG_E("天气数据同步成功");
        
        ret = RT_EOK;
    }
    else
    {
        LOG_E("No weather content received");
    }

__exit:
    if (weather_url != RT_NULL)
    {
        rt_free(weather_url);
    }

    if (session != RT_NULL)
    {
        LOCK_TCPIP_CORE();
        webclient_close(session);
        UNLOCK_TCPIP_CORE();
    }

    if (buffer != RT_NULL)
    {
        rt_free(buffer);
    }

    if (ret != RT_EOK)
    {
        LOG_E("天气同步失败\n");
    }
    // 清除同步进行标志
    g_weather_sync_in_progress = 0;

    return ret;
}

static void update_home_status_meta(void)
{
    extern lv_obj_t *home_meta_label;

    if (home_meta_label)
    {
        char meta_text[96];
        char temp_text[16];

        if (g_current_weather.last_update > 0)
        {
            snprintf(temp_text, sizeof(temp_text), "%d°C",
                     g_current_weather.temperature);
        }
        else
        {
            snprintf(temp_text, sizeof(temp_text), "--°C");
        }

        snprintf(meta_text, sizeof(meta_text), "%04d/%02d/%02d\n%s %s",
                 g_current_time.year, g_current_time.month, g_current_time.day,
                 g_current_time.weekday_str[0] ? g_current_time.weekday_str : "星期一",
                 temp_text);
        lv_label_set_text(home_meta_label, meta_text);
    }
}

void time_ui_update_callback(void)
{
    static int last_year = -1;
    static int last_month = -1;
    static int last_day = -1;
    static int last_bt_connected = -1;
    static int last_pan_connected = -1;
    static int last_weekday = -1;

    static int last_hour_tens = -1;
    static int last_hour_units = -1;
    static int last_minute_tens = -1;
    static int last_minute_units = -1;
    static int last_home_hour = -1;
    static int last_home_minute = -1;
    static int last_standby_hour = -1;
    static int last_standby_minute = -1;
    static int last_standby_second = -1;
    static int last_second = -1;//秒
    char lunar_text[32];

    // 获取最新时间
    if (xiaozhi_time_get_current(&g_current_time) != RT_EOK)
    {
        return;
    }

    // 更新待机界面的时间显示
    extern lv_obj_t *hour_tens_img;
    extern lv_obj_t *hour_units_img;
    extern lv_obj_t *minute_tens_img;
    extern lv_obj_t *minute_units_img;
    extern lv_obj_t *ui_Label_second;
    extern lv_obj_t *home_time_label;
    extern lv_obj_t *standby_time_label;
    // 根据小时和分钟更新数字图片
    // 更新小时显示
    int hour_tens = g_current_time.hour / 10;
    int hour_units = g_current_time.hour % 10;
    
    // 更新分钟显示
    int minute_tens = g_current_time.minute / 10;
    int minute_units = g_current_time.minute % 10;
    
    // 根据数字更新对应的图片资源
    extern const lv_image_dsc_t img_0, img_1, img_2, img_3, img_4, img_5, img_6, img_7, img_8, img_9;
    const lv_image_dsc_t* hour_tens_img_src[] = {&img_0, &img_1, &img_2, &img_3, &img_4, &img_5, &img_6, &img_7, &img_8, &img_9};
    const lv_image_dsc_t* hour_units_img_src[] = {&img_0, &img_1, &img_2, &img_3, &img_4, &img_5, &img_6, &img_7, &img_8, &img_9};
    const lv_image_dsc_t* minute_tens_img_src[] = {&img_0, &img_1, &img_2, &img_3, &img_4, &img_5, &img_6, &img_7, &img_8, &img_9};
    const lv_image_dsc_t* minute_units_img_src[] = {&img_0, &img_1, &img_2, &img_3, &img_4, &img_5, &img_6, &img_7, &img_8, &img_9};
    
        // 只在小时十位数变化时更新
    if (hour_tens != last_hour_tens) {
        if (hour_tens_img) lv_img_set_src(hour_tens_img, hour_tens_img_src[hour_tens]);
        last_hour_tens = hour_tens;
    }
    
    // 只在小时个位数变化时更新
    if (hour_units != last_hour_units) {
        if (hour_units_img) lv_img_set_src(hour_units_img, hour_units_img_src[hour_units]);
        last_hour_units = hour_units;
    }
    
    // 只在分钟十位数变化时更新
    if (minute_tens != last_minute_tens) {
        if (minute_tens_img) lv_img_set_src(minute_tens_img, minute_tens_img_src[minute_tens]);
        last_minute_tens = minute_tens;
    }
    
    // 只在分钟个位数变化时更新
    if (minute_units != last_minute_units) {
        if (minute_units_img) lv_img_set_src(minute_units_img, minute_units_img_src[minute_units]);
        last_minute_units = minute_units;
    }

    if (home_time_label &&
        (g_current_time.hour != last_home_hour ||
         g_current_time.minute != last_home_minute)) {
        char time_text[8];
        snprintf(time_text, sizeof(time_text), "%02d:%02d",
                 g_current_time.hour, g_current_time.minute);
        lv_label_set_text(home_time_label, time_text);
        last_home_hour = g_current_time.hour;
        last_home_minute = g_current_time.minute;
    }

    if (standby_time_label &&
        (g_current_time.hour != last_standby_hour ||
         g_current_time.minute != last_standby_minute)) {
        char standby_time_text[8];
        snprintf(standby_time_text, sizeof(standby_time_text), "%02d:%02d",
                 g_current_time.hour, g_current_time.minute);
        lv_label_set_text(standby_time_label, standby_time_text);
        lv_obj_invalidate(standby_time_label);
        rt_kprintf("[standby_dbg] label set to %s label=%p parent=%p active=%p\n",
                   standby_time_text,
                   standby_time_label,
                   lv_obj_get_parent(standby_time_label),
                   lv_screen_active());
        last_standby_hour = g_current_time.hour;
        last_standby_minute = g_current_time.minute;
    }



    // 更新待机界面秒
    extern lv_obj_t *ui_Label_lunar;
    extern lv_obj_t *ui_Label_day;
    extern lv_obj_t *ui_Label_year;
     if (g_current_time.second != last_second) {
        if (ui_Label_second &&
            !lv_obj_has_flag(ui_Label_second, LV_OBJ_FLAG_HIDDEN)) {
            char second_text[8];
            snprintf(second_text, sizeof(second_text), "%02d", g_current_time.second);
            lv_label_set_text(ui_Label_second, second_text);
            lv_obj_invalidate(ui_Label_second);
        }
        last_standby_second = g_current_time.second;
        last_second = g_current_time.second;
    }

  // 更新年份显示
    if (g_current_time.year != last_year ||
        g_current_time.month != last_month ||
        g_current_time.day != last_day) {
        if (ui_Label_year) {
            char year_text[16];
            snprintf(year_text, sizeof(year_text), "%04d/%02d/%02d",
                     g_current_time.year, g_current_time.month, g_current_time.day);
            lv_label_set_text(ui_Label_year, year_text);
        }

        if (ui_Label_lunar) {
            if (format_lunar_text(g_current_time.year,
                                  g_current_time.month,
                                  g_current_time.day,
                                  lunar_text,
                                  sizeof(lunar_text)) == RT_EOK) {
                lv_label_set_text(ui_Label_lunar, lunar_text);
            } else {
                lv_label_set_text(ui_Label_lunar, "--");
            }
        }

        if (ui_Label_day) {
            lv_label_set_text(ui_Label_day,
                              xiaozhi_time_get_full_weekday_str(g_current_time.weekday));
        }

        last_year = g_current_time.year;
        last_month = g_current_time.month;
        last_day = g_current_time.day;
        last_weekday = g_current_time.weekday;
    } else if (g_current_time.weekday != last_weekday) {
        if (ui_Label_day) {
            lv_label_set_text(ui_Label_day,
                              xiaozhi_time_get_full_weekday_str(g_current_time.weekday));
        }
        last_weekday = g_current_time.weekday;
    }

   // 更新蓝牙和网络图标（仅在状态变化时更新）
    extern lv_obj_t *bluetooth_icon;
    extern lv_obj_t *network_icon;
    extern const lv_image_dsc_t ble_icon_img;
    extern const lv_image_dsc_t ble_icon_img_close;
    extern const lv_image_dsc_t network_icon_img;
    extern const lv_image_dsc_t network_icon_img_close;
    
    // 检查蓝牙连接状态变化
    extern bt_app_t g_bt_app_env; 
    if (g_bt_app_env.bt_connected != last_bt_connected) {
        if (bluetooth_icon) {
            if (g_bt_app_env.bt_connected) {
                lv_img_set_src(bluetooth_icon, &ble_icon_img);
            } else {
                lv_img_set_src(bluetooth_icon, &ble_icon_img_close);
            }
        }
        last_bt_connected = g_bt_app_env.bt_connected;
    }

    //网络图标
    extern BOOL g_pan_connected;
    if (g_pan_connected != last_pan_connected) {
        if (network_icon) {
            if (g_pan_connected) {
                lv_img_set_src(network_icon, &network_icon_img);
            } else {
                lv_img_set_src(network_icon, &network_icon_img_close);
            }
        }
        last_pan_connected = g_pan_connected;
    }

    update_home_status_meta();

}


void weather_ui_update_callback(void)
{
         // 更新天气信息
    extern lv_obj_t *ui_Label_ip;  // 新UI中的温度标签
    extern lv_obj_t *last_time;    // 新UI中的时间标签
    extern lv_obj_t *weather_icon; // 新UI中的天气图标
    
    // 更新温度显示 (使用新UI中的ui_Label_ip对象)
    if (ui_Label_ip) {
        char temp_text[32];
        const char *weather_text = g_current_weather.text[0] ? g_current_weather.text : "--";

        if (g_current_weather.last_update > 0 || g_current_weather.text[0]) {
            snprintf(temp_text, sizeof(temp_text), "%d°C %s",
                     g_current_weather.temperature, weather_text);
        } else {
            snprintf(temp_text, sizeof(temp_text), "--°C --");
        }
        lv_label_set_text(ui_Label_ip, temp_text);
    }
    
    // 更新天气图标 (根据天气代码更新图标)
 if (weather_icon) {
        // 根据天气代码选择相应的图标
        
        if (strcmp(g_current_weather.code, "0") == 0) {
            // 晴（国内城市白天晴） Sunny
            LV_IMAGE_DECLARE(w0);
            lv_img_set_src(weather_icon, &w0);
            } else if (strcmp(g_current_weather.code, "1") == 0) {
            // 晴（国内城市夜晚晴） Clear
            LV_IMAGE_DECLARE(w1);
            lv_img_set_src(weather_icon, &w1);
            } else if (strcmp(g_current_weather.code, "2") == 0) {
            // 晴（国外城市白天晴） Fair
            LV_IMAGE_DECLARE(w2);
            lv_img_set_src(weather_icon, &w2);
            } else if (strcmp(g_current_weather.code, "3") == 0) {
            // 晴（国外城市夜晚晴） Fair
            LV_IMAGE_DECLARE(w3);
            lv_img_set_src(weather_icon, &w3);
            } else if (strcmp(g_current_weather.code, "4") == 0) {
            // 多云 Cloudy
            LV_IMAGE_DECLARE(w4);
            lv_img_set_src(weather_icon, &w4);
            } else if (strcmp(g_current_weather.code, "5") == 0) {
            // 晴间多云 Partly Cloudy
            LV_IMAGE_DECLARE(w5);
            lv_img_set_src(weather_icon, &w5);
            } else if (strcmp(g_current_weather.code, "6") == 0) {
            // 晴间多云 Partly Cloudy
            LV_IMAGE_DECLARE(w6);
            lv_img_set_src(weather_icon, &w6);
            } else if (strcmp(g_current_weather.code, "7") == 0) {
            // 大部多云 Mostly Cloudy
            LV_IMAGE_DECLARE(w7);
            lv_img_set_src(weather_icon, &w7);
            } else if (strcmp(g_current_weather.code, "8") == 0) {
            // 大部多云 Mostly Cloudy
            LV_IMAGE_DECLARE(w8);
            lv_img_set_src(weather_icon, &w8);
            } else if (strcmp(g_current_weather.code, "9") == 0) {
            // 阴 Overcast
            LV_IMAGE_DECLARE(w9);
            lv_img_set_src(weather_icon, &w9);
            } else if (strcmp(g_current_weather.code, "10") == 0) {
            // 阵雨 Shower
            LV_IMAGE_DECLARE(w10);
            lv_img_set_src(weather_icon, &w10);
            } else if (strcmp(g_current_weather.code, "11") == 0) {
            // 雷阵雨 Thundershower
            LV_IMAGE_DECLARE(w11);
            lv_img_set_src(weather_icon, &w11);
            } else if (strcmp(g_current_weather.code, "12") == 0) {
            // 雷阵雨伴有冰雹 Thundershower with Hail
            LV_IMAGE_DECLARE(w12);
            lv_img_set_src(weather_icon, &w12);
            } else if (strcmp(g_current_weather.code, "13") == 0) {
            // 小雨 Light Rain
            LV_IMAGE_DECLARE(w13);
            lv_img_set_src(weather_icon, &w13);
            } else if (strcmp(g_current_weather.code, "14") == 0) {
            // 中雨 Moderate Rain
            LV_IMAGE_DECLARE(w14);
            lv_img_set_src(weather_icon, &w14);
            } else if (strcmp(g_current_weather.code, "15") == 0) {
            // 大雨 Heavy Rain
            LV_IMAGE_DECLARE(w15);
            lv_img_set_src(weather_icon, &w15);
            } else if (strcmp(g_current_weather.code, "16") == 0) {
            // 暴雨 Storm
            LV_IMAGE_DECLARE(w16);
            lv_img_set_src(weather_icon, &w16);
            } else if (strcmp(g_current_weather.code, "17") == 0) {
            // 大暴雨 Heavy Storm
            LV_IMAGE_DECLARE(w17);
            lv_img_set_src(weather_icon, &w17);
            } else if (strcmp(g_current_weather.code, "18") == 0) {
            // 特大暴雨 Severe Storm
            LV_IMAGE_DECLARE(w18);
            lv_img_set_src(weather_icon, &w18);
            } else if (strcmp(g_current_weather.code, "19") == 0) {
            // 冻雨 Ice Rain
            LV_IMAGE_DECLARE(w19);
            lv_img_set_src(weather_icon, &w19);
            } else if (strcmp(g_current_weather.code, "20") == 0) {
            // 雨夹雪 Sleet
            LV_IMAGE_DECLARE(w20);
            lv_img_set_src(weather_icon, &w20);
            } else if (strcmp(g_current_weather.code, "21") == 0) {
            // 阵雪 Snow Flurry
            LV_IMAGE_DECLARE(w21);
            lv_img_set_src(weather_icon, &w21);
            } else if (strcmp(g_current_weather.code, "22") == 0) {
            // 小雪 Light Snow
            LV_IMAGE_DECLARE(w22);
            lv_img_set_src(weather_icon, &w22);
            } else if (strcmp(g_current_weather.code, "23") == 0) {
            // 中雪 Moderate Snow
            LV_IMAGE_DECLARE(w23);
            lv_img_set_src(weather_icon, &w23);
            } else if (strcmp(g_current_weather.code, "24") == 0) {
            // 大雪 Heavy Snow
            LV_IMAGE_DECLARE(w24);
            lv_img_set_src(weather_icon, &w24);
            } else if (strcmp(g_current_weather.code, "25") == 0) {
            // 暴雪 Snowstorm
            LV_IMAGE_DECLARE(w25);
            lv_img_set_src(weather_icon, &w25);
            } else if (strcmp(g_current_weather.code, "26") == 0) {
            // 浮尘 Dust
            LV_IMAGE_DECLARE(w26);
            lv_img_set_src(weather_icon, &w26);
            } else if (strcmp(g_current_weather.code, "27") == 0) {
            // 扬沙 Sand
            LV_IMAGE_DECLARE(w27);
            lv_img_set_src(weather_icon, &w27);
            } else if (strcmp(g_current_weather.code, "28") == 0) {
            // 沙尘暴 Duststorm
            LV_IMAGE_DECLARE(w28);
            lv_img_set_src(weather_icon, &w28);
            } else if (strcmp(g_current_weather.code, "29") == 0) {
            // 强沙尘暴 Sandstorm
            LV_IMAGE_DECLARE(w29);
            lv_img_set_src(weather_icon, &w29);
            } else if (strcmp(g_current_weather.code, "30") == 0) {
            // 雾 Foggy
            LV_IMAGE_DECLARE(w30);
            lv_img_set_src(weather_icon, &w30);
            } else if (strcmp(g_current_weather.code, "31") == 0) {
            // 霾 Haze
            LV_IMAGE_DECLARE(w31);
            lv_img_set_src(weather_icon, &w31);
            } else if (strcmp(g_current_weather.code, "32") == 0) {
            // 风 Windy
            LV_IMAGE_DECLARE(w32);
            lv_img_set_src(weather_icon, &w32);
            } else if (strcmp(g_current_weather.code, "33") == 0) {
            // 大风 Blustery
            LV_IMAGE_DECLARE(w33);
            lv_img_set_src(weather_icon, &w33);
            } else if (strcmp(g_current_weather.code, "34") == 0) {
            // 飓风 Hurricane
            LV_IMAGE_DECLARE(w34);
            lv_img_set_src(weather_icon, &w34);
            } else if (strcmp(g_current_weather.code, "35") == 0) {
            // 热带风暴 Tropical Storm
            LV_IMAGE_DECLARE(w35);
            lv_img_set_src(weather_icon, &w35);
            } else if (strcmp(g_current_weather.code, "36") == 0) {
            // 龙卷风 Tornado
            LV_IMAGE_DECLARE(w36);
            lv_img_set_src(weather_icon, &w36);
            } else if (strcmp(g_current_weather.code, "37") == 0) {
            // 冷 Cold
            LV_IMAGE_DECLARE(w37);
            lv_img_set_src(weather_icon, &w37);
            } else if (strcmp(g_current_weather.code, "38") == 0) {
            // 热 Hot
            LV_IMAGE_DECLARE(w38);
            lv_img_set_src(weather_icon, &w38);
            } else {
            // 未知 Unknown
            LV_IMAGE_DECLARE(w99);
            lv_img_set_src(weather_icon, &w99);
        }
        
    }
    
    // 更新上次更新时间显示 (使用新UI中的last_time对象)
    if (last_time && g_current_weather.last_update > 0) {
        struct tm *last_update_tm = localtime(&g_current_weather.last_update);
        if (last_update_tm) {
            char last_update_text[20];
            snprintf(last_update_text, sizeof(last_update_text), "更新 %02d:%02d",
                     last_update_tm->tm_hour, last_update_tm->tm_min);
            lv_label_set_text(last_time, last_update_text);
            LOG_I("last_update_text:%s",last_update_text);
        }
    }

    update_home_status_meta();
}



/**
 * @brief NTP时间同步（蓝牙对时） 写入RTC
 */
int xiaozhi_ntp_sync(void)
{
    // 检查是否有同步正在进行中，避免并发调用
    if (g_ntp_sync_in_progress) {
        LOG_W("NTP sync already in progress, skipping...");
        return -RT_EBUSY;
    }

    // 设置同步进行标志
    g_ntp_sync_in_progress = 1;

    if (!g_pan_connected)
    {
        LOG_W("PAN not connected, cannot sync time");
        // 清除同步进行标志
        g_ntp_sync_in_progress = 0;
        return -RT_ERROR;
    }


    time_t cur_time = 0;
    int sync_success = 0;

    // 尝试多个NTP服务器
    for (int i = 0; i < sizeof(ntp_servers) / sizeof(ntp_servers[0]); i++)
    {
        rt_kprintf("Trying NTP server: %s\n", ntp_servers[i]);

#ifdef PKG_USING_NETUTILS
        // 获取服务时间并设置rtc时间
        cur_time = ntp_sync_to_rtc(ntp_servers[i]);
        if (cur_time > 1000000000)// 基本的时间有效性检查（大约是2001年之后）
        { 
            sync_success = 1;
            
        }
#else
        // 如果没有NTP支持，使用系统时间
        LOG_W("NTP client not available, using system time");
        cur_time = time(RT_NULL);
        if (cur_time > 1000000000)
        { // 基本的时间有效性检查
            sync_success = 1;
        }
#endif

        if (sync_success)
        {
            // 验证RTC时间是否正确设置
            time_t verify_time = 0;
            rt_err_t result = rt_device_control(
                g_rtc_device, RT_DEVICE_CTRL_RTC_GET_TIME, &verify_time);
            if (result == RT_EOK)
            {
                LOG_I("RTC time verification successful: %ld", (long)verify_time);
                // 检查设置的时间和获取的时间是否一致
                if (verify_time == cur_time) {
                    LOG_I("RTC time matches NTP time");
                } else {
                    LOG_W("RTC time mismatch. NTP: %ld, RTC: %ld", (long)cur_time, (long)verify_time);
                }
            }
            else
            {
                LOG_E("Failed to verify RTC time: %d", result);
            }
            // 清除同步进行标志
            g_ntp_sync_in_progress = 0;
            return RT_EOK;
        }

        rt_thread_mdelay(1000); // 等待1秒再尝试下一个服务器
    }
    // 清除同步进行标志
    g_ntp_sync_in_progress = 0;
    return -RT_ERROR;
}

void xiaozhi_time_weather(void)//获取最新时间和天气
{


    int retry_count = 0;
    const int max_retries = 5;
    rt_err_t ntp_result = RT_ERROR;
    
    while (1) {
        if (!g_pan_connected) 
        {
            LOG_W("PAN disconnected during xiaozhi_time_weather");
            return;

        }
        ntp_result = xiaozhi_ntp_sync();//同步网络服务时间
        if (ntp_result == RT_EOK) 
        {
            update_xiaozhi_ui_time(NULL);//更新界面时间显示
            LOG_I("Time synchronization successful, next sync in 30min");
            break;
        } 
        else 
        {
            retry_count++;
            LOG_W("Initial time synchronization failed, retrying... attempt %d", retry_count);
            if (retry_count < max_retries) 
            {
                rt_thread_mdelay(3000); // 等待3秒后重试
            } 
            else 
            {
                break;
            }
            
        }
    }

    if (ntp_result != RT_EOK) {
        LOG_W("Time synchronization failed after %d attempts, will retry in 5 minutes", max_retries);
    }

    // 获取天气信息带重试机制
    retry_count = 0;
    rt_err_t weather_result = RT_ERROR;
    
    while (1) {
        if (!g_pan_connected) 
        {
           LOG_W("PAN disconnected during time synchronization");
            retry_count++;
            LOG_W("Failed to get weather information, attempt %d of %d", retry_count, max_retries);
            if (retry_count < max_retries) {
                rt_thread_mdelay(3000); // 等待3秒后重试
                continue;
            }
            else
            {
                LOG_W("Failed to get weather information after %d attempts", max_retries);
            }
        }
        
        weather_result = xiaozhi_weather_get(&g_current_weather);
        if (weather_result == RT_EOK) 
        {
            update_xiaozhi_ui_weather(NULL);//获取成功则更新一次
            LOG_W("xiaozhi_weather_get successful");
            break;
        } 
        else 
        {
            retry_count++;
            LOG_W("Failed to get weather information, attempt %d of %d", retry_count, max_retries);
            if (retry_count < max_retries) 
            {
                rt_thread_mdelay(3000); // 等待3秒后重试
            }
            else 
            {
                break;
            }
            
        }
    }
    
    if (weather_result != RT_EOK) {
        LOG_W("Failed to get weather information after %d attempts, will retry in 5 minutes", max_retries);
    }

}
      

//初始化rtc设备
int xiaozhi_time_weather_init(void)
{


        // 查找RTC设备
        g_rtc_device = rt_device_find("rtc");
        if (g_rtc_device == RT_NULL)
        {
            return -RT_ENOMEM;
            LOG_W("RTC device not found, using system time only");
        }
        else
        {
            rt_device_open(g_rtc_device, RT_DEVICE_OFLAG_RDWR);
        }

    

    return RT_EOK;
}
