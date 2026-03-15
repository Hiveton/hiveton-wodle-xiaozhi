#include <stdint.h>
#include "rtthread.h"
#include "bf0_hal.h"
#include "drv_io.h"
#include "littlevgl2rtt.h"
#include "lv_tiny_ttf.h"
#include "string.h"
#include "xiaozhi_client_public.h"
#include "bf0_pm.h"
#include "gui_app_pm.h"
#include "drv_gpio.h"
#include "lv_timer.h"
#include "lv_display.h"
#include "lv_obj_pos.h"
#include "ulog.h"
#include "drv_flash.h"
#include "xiaozhi_websocket.h"
#include "bts2_app_inc.h"
#include "ble_connection_manager.h"
#include "bt_connection_manager.h"
#include "bt_env.h"
#include "./mcp/mcp_api.h"
#include "lv_seqimg.h"
#include "xiaozhi_ui.h"
#include "../weather/weather.h"
#include "xiaozhi_audio.h"
#include "../kws/app_recorder_process.h"
#include "../board/board_hardware.h"
#include "xiaozhi_screen.h"
#include "ui/home/home_screen.h"
#include "ui/home/standby_screen.h"
#include "charge.h"
#include "bt_pan_ota.h"

#define UPDATE_REAL_WEATHER_AND_TIME 11
#define LCD_DEVICE_NAME "lcd"
#define TOUCH_NAME "touch"
#define SCALE_DPX(val) LV_DPX((val) * g_scale)
#define IDLE_TIME_LIMIT  (20000)
#define SHOW_TEXT_LEN 120
#define CONT_IDLE           0x01
#define CONT_HIDDEN         0x02
#define CONT_DEFAULT_STATUS     (CONT_IDLE | CONT_HIDDEN)
#define USING_TOUCH_SWITCH  1
#define USING_BTN_SWITCH    0
#define ANIM_TIMEOUT        300
#define BRT_TB_SIZE     (sizeof(brigtness_tb)/sizeof(brigtness_tb[0]))
#define BASE_WIDTH 390
#define BASE_HEIGHT 450
// 默认oled电池图标尺寸
#define OUTLINE_W 58
#define OUTLINE_H 33
// LCD_USING_ST7789电池图标尺寸
#define OUTLINE_W_ST7789 40
#define OUTLINE_H_ST7789 20





// 定义UI消息类型
typedef enum {
    UI_MSG_CHAT_STATUS,
    UI_MSG_CHAT_OUTPUT,
    UI_MSG_UPDATE_EMOJI,
    UI_MSG_UPDATE_BLE,
    UI_MSG_TTS_OUTPUT,
    UI_MSG_TTS_SWITCH_PART,
    UI_MSG_BUTTON_PRESSED,
    UI_MSG_BUTTON_RELEASED,
    UI_MSG_TIME_UPDATE,
    UI_MSG_WEATHER_UPDATE,
    UI_MSG_STANDBY_EMOJI,
    UI_MSG_SWITCH_TO_STANDBY,
    UI_MSG_SWITCH_TO_HOME,
    UI_MSG_SWITCH_TO_MAIN,
    UI_MSG_UPDATE_WEATHER_AND_TIME,
    UI_MSG_STANDBY_CHAT_OUTPUT,
    UI_MSG_VOLUME_UPDATE,  //更新下拉菜单里面的音量进度条
    UI_MSG_BRIGHTNESS_UPDATE,  //更新下拉菜单里面的亮度进度条
    UI_MSG_CHARGE_STATUS_CHANGED,
    UI_MSG_SHOW_UPDATE_CONFIRM,
    UI_MSG_UPDATE_LATEST_VERSION,
    UI_MSG_CONFIRM_BUTTON_EVENT,
    UI_MSG_REINIT_AUDIO,
    UI_MSG_TRIGGER_ACTIVITY,
    UI_MSG_START_SLEEP_TIMER

} ui_msg_type_t;

#define UI_MSG_TEXT_MAX 512

// 定义UI消息结构
typedef struct {
    ui_msg_type_t type;
    union {
        char text[UI_MSG_TEXT_MAX];
        int int_value;
        uint8_t u8_value;
        BOOL bool_value;
    } payload;
} ui_msg_t;
rt_mq_t ui_msg_queue = RT_NULL;


static lv_obj_t* wakeup_switch = NULL;
static lv_obj_t* interrupt_switch = NULL;
static lv_timer_t* standby_update_timer = NULL;
static rt_timer_t bg_update_timer = NULL;
static rt_timer_t g_split_text_timer = RT_NULL;
static lv_obj_t *g_label_for_second_part = NULL;
static uint8_t cont_status = CONT_DEFAULT_STATUS;
static uint32_t anim_tick = 0;
static rt_device_t lcd_device;
static lv_obj_t* charging_icon = NULL;
static lv_obj_t* standby_charging_icon = NULL;
static volatile uint8_t g_charge_status_isr_pending = 0;
static volatile uint8_t g_charge_status_isr_value = 0;
static xiaozhi_home_screen_refs_t g_home_screen_refs;
static xiaozhi_home_screen_refs_t g_standby_screen_refs;


lv_obj_t *cont = NULL;
lv_timer_t *ui_sleep_timer = NULL;
rt_mailbox_t g_ui_task_mb =RT_NULL;
rt_timer_t update_time_ui_timer = RT_NULL;
rt_timer_t update_weather_ui_timer = RT_NULL;
rt_tick_t last_listen_tick = 0;
uint8_t vad_enable = 1;      //0是支持打断，1是不支持打断
uint8_t last_charge_status = 0; // 上次充电状态
lv_obj_t *g_screen_before_low_battery = NULL; //记录低电量关机前的页面

#if defined (KWS_ENABLE_DEFAULT) && KWS_ENABLE_DEFAULT
uint8_t aec_enabled = 1;
#else
uint8_t aec_enabled = 1;
#endif
#if defined(__CC_ARM) || defined(__CLANG_ARM)
L2_RET_BSS_SECT_BEGIN(g_second_part) //6000地址
static char g_second_part[512];
L2_RET_BSS_SECT_END
#else
static char g_second_part[512] L2_RET_BSS_SECT(g_second_part);
#endif

extern date_time_t g_current_time;
extern rt_mailbox_t g_bt_app_mb;
extern const unsigned char droid_sans_fallback_font[];
extern const int droid_sans_fallback_font_size;
extern bool shutdown_state;
extern lv_obj_t *shutdown_screen; 
extern lv_obj_t *sleep_screen;
extern lv_obj_t *low_battery_shutdown_screen;
extern lv_obj_t *low_battery_warning_screen;
extern lv_obj_t *g_startup_screen;
extern bool g_skip_startup; 
extern bool lowpower_shutdown_state;
extern bool g_low_power_mode;

static struct rt_semaphore update_ui_sema;

/*Create style with the new font*/
static lv_style_t style;
static lv_style_t style2;

static lv_style_t style_battery;

static lv_obj_t* volume_slider = NULL;
static lv_obj_t* brightness_lines = NULL;

static lv_obj_t* update_switch = NULL;
/*缩放因子*/
static float g_scale = 1.0f;

/*字体资源*/
extern const unsigned char xiaozhi_font[];
extern const int xiaozhi_font_size;
extern BOOL g_pan_connected;

/*对话界面ble图片资源*/
extern const lv_image_dsc_t ble; // ble
extern const lv_image_dsc_t ble_close;

/*充电图标 */
extern const lv_image_dsc_t cdian2; 

/*对话画面*/
lv_obj_t *main_container;
static lv_obj_t *header_row;
static lv_obj_t *spacer;
static lv_obj_t *img_container;

static lv_obj_t *global_label1;
static lv_obj_t *global_label2;

static lv_obj_t *seqimg;
static lv_obj_t *global_img_ble;

lv_font_t *font_medium;
static lv_font_t *home_time_font = NULL;
static lv_font_t *home_meta_font = NULL;
static lv_font_t *home_label_font = NULL;
static lv_font_t *home_status_font = NULL;
static lv_font_t *standby_clock_font = NULL;
static lv_font_t *standby_date_font = NULL;
static lv_font_t *standby_info_font = NULL;
static lv_font_t *standby_weather_font = NULL;


/*待机画面*/
extern const lv_image_dsc_t ble_icon_img; // 蓝牙图标
extern const lv_image_dsc_t ble_icon_img_close;
extern const lv_image_dsc_t network_icon_img; // 网络图标
extern const lv_image_dsc_t network_icon_img_close;
extern const lv_image_dsc_t sunny;// 天气图标
extern const lv_image_dsc_t strip;//天气栏
extern const lv_image_dsc_t funny2; // 表情图标
extern const lv_image_dsc_t sleepy2; // 表情图标
extern const lv_image_dsc_t cool_gif;
extern const lv_image_dsc_t calendar;//日历
extern const lv_image_dsc_t second;
extern const lv_image_dsc_t img_0;  // 数字图片资源
extern const lv_image_dsc_t img_1;
extern const lv_image_dsc_t img_2;
extern const lv_image_dsc_t img_3;
extern const lv_image_dsc_t img_4;
extern const lv_image_dsc_t img_5;
extern const lv_image_dsc_t img_6;
extern const lv_image_dsc_t img_7;
extern const lv_image_dsc_t img_8;
extern const lv_image_dsc_t img_9;

lv_obj_t *hour_tens_img;     // 小时十位数图片
lv_obj_t *hour_units_img;    // 小时个位数图片
lv_obj_t *minute_tens_img;   // 分钟十位数图片
lv_obj_t *minute_units_img;  // 分钟个位数图片
lv_obj_t *temperature_label = NULL;  // 温度标签
lv_obj_t *last_update_label = NULL;  // 上次更新时间标签
lv_obj_t *battery_arc = NULL;           // 电池圆环显示
lv_obj_t *battery_percent_label = NULL; // 电池电量百分比标签
lv_obj_t *bluetooth_icon = NULL;//蓝牙图标
lv_obj_t *img_emoji = NULL;//表情图标
lv_obj_t *network_icon = NULL;//网络图标

lv_obj_t *weather_bgimg;//天气背景图片
lv_obj_t *weather_icon;//天气图标
lv_obj_t *ui_Image_calendar;//日历图标
lv_obj_t *home_screen = NULL;//首页
lv_obj_t *standby_screen = NULL;//待机界面
lv_obj_t *home_time_label = NULL;//首页顶部时间
lv_obj_t *standby_time_label = NULL;//待机页面大时间
lv_obj_t *home_meta_label = NULL;//首页顶部日期天气
lv_obj_t *ui_Label_ip = NULL;//地址和温度标签
lv_obj_t *last_time = NULL;//上次更新天气图标
lv_obj_t *ui_Label_year =NULL;//年份
lv_obj_t *ui_Label_lunar = NULL;//农历
lv_obj_t *ui_Label_day = NULL;//日期
lv_obj_t *ui_Label_second =NULL;//秒
lv_obj_t *ui_Image_second = NULL;//秒的图片
lv_obj_t * ui_Arc2 = NULL;//电池容器
lv_obj_t * ui_Label3 = NULL;


// xiaozhi2
extern rt_mailbox_t g_button_event_mb;
extern xiaozhi_ws_t g_xz_ws;
extern xz_audio_t xz_audio;
extern rt_mailbox_t g_battery_mb;
xz_audio_t *thiz = &xz_audio;


// 全局变量存储当前电池电量
static int g_battery_level = 60;        // 默认为满电
static lv_obj_t *g_battery_fill = NULL;  // 电池填充对象
static lv_obj_t *g_battery_label = NULL; // 电量标签
static void set_charge_icon(void);
static void ui_restart_sleep_timer(rt_uint32_t timeout_ms);

static void apply_home_screen_status_refs(void)
{
    battery_percent_label = g_home_screen_refs.battery_percent_label;
    bluetooth_icon = g_home_screen_refs.bluetooth_icon;
    network_icon = g_home_screen_refs.network_icon;
    standby_charging_icon = g_home_screen_refs.standby_charging_icon;
    weather_icon = g_home_screen_refs.weather_icon;
}

static void apply_standby_screen_status_refs(void)
{
    battery_percent_label = g_standby_screen_refs.battery_percent_label;
    bluetooth_icon = g_standby_screen_refs.bluetooth_icon;
    network_icon = g_standby_screen_refs.network_icon;
    standby_charging_icon = g_standby_screen_refs.standby_charging_icon;
    weather_icon = g_standby_screen_refs.weather_icon;
}

static void refresh_non_dialog_screen_status(void)
{
    if (battery_percent_label)
    {
        lv_label_set_text_fmt(battery_percent_label, "%d%%", g_battery_level);
    }

    set_charge_icon();
    time_ui_update_callback();
    weather_ui_update_callback();
}

static void report_user_activity(void)
{
#ifdef BSP_USING_PM
    lv_display_trigger_activity(NULL);
#endif

    if (lv_screen_active() == home_screen)
    {
        ui_restart_sleep_timer(30000);
    }
}

static void home_screen_activity_event_handler(struct _lv_event_t *e)
{
    if (lv_event_get_code(e) != LV_EVENT_PRESSED)
    {
        return;
    }

    if (lv_event_get_target_obj(e) != home_screen)
    {
        return;
    }

    report_user_activity();
}

static void home_tile_event_handler(struct _lv_event_t *e)
{
    xiaozhi_home_tile_t tile_id;

    if (lv_event_get_code(e) != LV_EVENT_CLICKED)
    {
        return;
    }

    tile_id = (xiaozhi_home_tile_t)(uintptr_t)lv_event_get_user_data(e);
    report_user_activity();

    if (tile_id == XIAOZHI_HOME_TILE_AI)
    {
        if (g_kws_running)
        {
            g_kws_force_exit = 1;
        }
        ui_switch_to_xiaozhi_screen();
    }
}

// 更新确认弹框
lv_obj_t *update_confirm_popup = NULL;
static lv_obj_t *update_confirm_label = NULL;
lv_obj_t *update_button = NULL;
lv_obj_t *cancel_button = NULL;
// 最新版本标签
static lv_obj_t *latest_version_label = NULL;
char latest_version[32] = {0};

// 缩放因子计算
float get_scale_factor(void)
{
    lv_disp_t *disp = lv_disp_get_default();
    lv_coord_t scr_width = lv_disp_get_hor_res(disp);
    lv_coord_t scr_height = lv_disp_get_ver_res(disp);

    float scale_x = (float)scr_width / 390;  // BASE_WIDTH = 390
    float scale_y = (float)scr_height / 450; // BASE_HEIGHT = 450

    return (scale_x < scale_y) ? scale_x : scale_y;
}

static rt_err_t charger_event_callback(rt_device_t dev, rt_size_t size)
{
   rt_kprintf("charger event callback\n");
    if (size == RT_CHARGE_EVENT_DETECT)
    {
        /* 由于中断回调不能直接malloc 内存，所以只能通过全局变量的方式保存状态 */
        rt_uint8_t status = rt_pin_read(CHARGE_DETECT_PIN);
        g_charge_status_isr_value = status;
        g_charge_status_isr_pending = 1;
    }
    return RT_EOK;
}
static void set_charge_icon()
{
    rt_uint8_t current_charge_status;
    rt_err_t err = rt_charge_get_detect_status(&current_charge_status);
    if (err == RT_EOK) 
    {
        bool should_show_charging = current_charge_status && (g_battery_level < 100);

        if (charging_icon)
        {
            if (should_show_charging)
                lv_obj_clear_flag(charging_icon, LV_OBJ_FLAG_HIDDEN);
            else
                lv_obj_add_flag(charging_icon, LV_OBJ_FLAG_HIDDEN);
        }

        if (standby_charging_icon)
        {
            if (should_show_charging)
                lv_obj_clear_flag(standby_charging_icon, LV_OBJ_FLAG_HIDDEN);
            else
                lv_obj_add_flag(standby_charging_icon, LV_OBJ_FLAG_HIDDEN);
        }
    } 
    else 
    {
       rt_kprintf("Failed to get charge detect status\n");
    }
}
void ctrl_wakeup(bool is_wakeup)
{
    if (wakeup_switch != NULL) 
    {
        if(is_wakeup)
        {
            lv_obj_add_state(wakeup_switch, LV_STATE_CHECKED);
            aec_enabled = 1;
        }
        else
        {
            lv_obj_clear_state(wakeup_switch, LV_STATE_CHECKED);
            aec_enabled = 0;
        }
    }
}

void ctrl_interrupt(bool is_interrupt)
{
    if (interrupt_switch != NULL) 
    {
        if(!is_interrupt)
        {
            lv_obj_add_state(interrupt_switch, LV_STATE_CHECKED);
            vad_enable = 1; //1是不打断
        }
        else
        {
            lv_obj_clear_state(interrupt_switch, LV_STATE_CHECKED);
            vad_enable = 0;
        }
    }
}
void xz_set_lcd_brightness(uint16_t level)
{
    rt_device_t bl_device = rt_device_find("lcd");
    RT_ASSERT(bl_device);

    int ret = rt_device_open(bl_device, RT_DEVICE_OFLAG_RDWR);
    if (ret == RT_EOK || ret == -RT_EBUSY)
    {
        rt_device_control(bl_device, RTGRAPHIC_CTRL_SET_BRIGHTNESS, &level);
    }
    if (bl_device != NULL && ret == RT_EOK)
        rt_device_close(bl_device);
}
// 亮度表需要按照从小到大排序
static const uint16_t brigtness_tb[] = 
{
    LCD_BRIGHTNESS_MIN,
    LCD_BRIGHTNESS_MID,
    LCD_BRIGHTNESS_MAX,
};

static void ui_msg_init(ui_msg_t *msg, ui_msg_type_t type)
{
    memset(msg, 0, sizeof(*msg));
    msg->type = type;
}

static void ui_msg_set_text(ui_msg_t *msg, const char *text)
{
    if (text == RT_NULL)
    {
        msg->payload.text[0] = '\0';
        return;
    }

    strncpy(msg->payload.text, text, UI_MSG_TEXT_MAX - 1);
    msg->payload.text[UI_MSG_TEXT_MAX - 1] = '\0';
}

static rt_err_t ui_msg_send(const ui_msg_t *msg)
{
    if (ui_msg_queue == RT_NULL)
    {
        return -RT_ERROR;
    }

    return rt_mq_send(ui_msg_queue, (void *)msg, sizeof(ui_msg_t));
}

static void ui_restart_sleep_timer(rt_uint32_t timeout_ms)
{
    if (ui_sleep_timer != NULL)
    {
        lv_timer_delete(ui_sleep_timer);
        ui_sleep_timer = NULL;
    }

    if (g_pan_connected && timeout_ms > 0)
    {
        ui_sleep_timer = lv_timer_create(ui_sleep_callback, timeout_ms, NULL);
    }
}


void ui_sleep_callback(lv_timer_t *timer)
{
    lv_obj_t *current_screen = lv_screen_active();

    if (current_screen == home_screen)
    {
        ui_sleep_timer = NULL;
        if (timer != NULL)
        {
            lv_timer_delete(timer);
        }
        ui_swith_to_standby_screen();
        return;
    }

    rt_kprintf("in dai_ji,so xiu mian");
    if(thiz->vad_enabled)
    {
        thiz->vad_enabled = false;
        rt_kprintf("in PM,so vad_close\n");
        xz_aec_mic_close(thiz);
    }
    if(aec_enabled) 
    {
        kws_demo();
    } 
    show_sleep_countdown_and_sleep();
    ui_sleep_timer = NULL;
    if (timer != NULL)
    {
        lv_timer_delete(timer);
    }
}

void ui_update_real_weather_and_time(void);

static void standby_update_callback(lv_timer_t *timer)
{
    ui_update_real_weather_and_time();
    
    // 删除定时器（一次性使用）
    lv_timer_delete(timer);
    standby_update_timer = NULL;
}

static void switch_cont_anim(bool hidden);
static void contdown_anim_ready_cb(struct _lv_anim_t* anim)
{
    switch_cont_anim(true);
    cont_status |= CONT_HIDDEN;
    cont_status &= (uint8_t)(~CONT_IDLE);
    LOG_I("%s",__func__);

}

static void countdown_anim(void)
{
    lv_anim_t a;
    lv_anim_init(&a);
    lv_anim_delete(cont, NULL);
    lv_anim_set_var(&a, cont);
    lv_anim_set_values(&a, 0, 100);
    lv_anim_set_duration(&a, 3000);
    lv_anim_set_ready_cb(&a, contdown_anim_ready_cb);
    lv_anim_start(&a);
    LOG_I("%s",__func__);
}

static void countdown_anim_del(void)
{
    lv_anim_delete(cont, NULL);
}


static void enable_indev(bool enable)
{
    lv_indev_t *i = lv_indev_get_next(NULL);
    while (i)
    {
        if ((lv_indev_get_type(i) != LV_INDEV_TYPE_POINTER))
        {
            if (!enable)
            {
                lv_indev_reset(i, NULL);
            }
            lv_indev_enable(i, enable);
        }
        i = lv_indev_get_next(i);
    }
}

static void switch_cont_anim_ready_cb(struct lv_anim_t* anim)
{
    lv_obj_t* obj = anim->var;
    if(lv_obj_get_y(obj) + lv_obj_get_height(obj) > 0)
    {
        countdown_anim();
    }
    cont_status |= CONT_IDLE;
    anim_tick = 0;
    enable_indev(true);

    LOG_I("%s:status %d",__func__, cont_status);
}

static void switch_cont_anim(bool hidden)
{
    LOG_I("%s:hidden %d",__func__, hidden);
    lv_anim_t a;
    lv_anim_init(&a);
    lv_anim_set_var(&a, cont);
    lv_anim_del(cont, NULL);
    enable_indev(false);

    if (hidden)
    {
        lv_anim_set_values(&a, lv_obj_get_y(cont), -lv_obj_get_height(cont));
        lv_anim_set_ready_cb(&a, switch_cont_anim_ready_cb);
    }
    else
    {
        lv_anim_set_values(&a, lv_obj_get_y(cont), 0);
        lv_anim_set_ready_cb(&a, switch_cont_anim_ready_cb);
    }
    lv_anim_set_duration(&a, 200);
    lv_anim_set_exec_cb(&a, (lv_anim_exec_xcb_t)lv_obj_set_y);

    lv_anim_start(&a);
    anim_tick = lv_tick_get();
}

static void switch_anim_timeout_check(void)
{
    if(anim_tick && (anim_tick + ANIM_TIMEOUT < lv_tick_get()) && 0 == (cont_status & CONT_IDLE))
    {
        LOG_I("%s:to set hidden %d",__func__, cont_status & CONT_HIDDEN);
        if(cont_status & CONT_HIDDEN)
        {
            switch_cont_anim(true);
        }
        else 
        {
            switch_cont_anim(false);
        }
    }
}


static void header_row_event_handler(struct _lv_event_t* e)
{
    lv_event_code_t code = lv_event_get_code(e);
    if(code == LV_EVENT_SHORT_CLICKED)
    {
        if(0 == (cont_status & CONT_IDLE)) return;
        if(cont_status & CONT_HIDDEN)
        {
            switch_cont_anim(false);
            cont_status &= (uint8_t)~CONT_HIDDEN;
        }
        else 
        {
            switch_cont_anim(true);
            cont_status |= CONT_HIDDEN;
        }
        cont_status &= (uint8_t)(~CONT_IDLE);
    }
}

static lv_obj_t* create_tip_label(lv_obj_t* parent, const char* tips, uint8_t row, uint8_t col)
{
    lv_obj_t* obj = lv_obj_create(parent);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_EVENT_BUBBLE);
    lv_obj_remove_style_all(obj);
    lv_obj_set_grid_cell(obj, LV_GRID_ALIGN_STRETCH, col, 1,
        LV_GRID_ALIGN_STRETCH, row, 1);
    lv_obj_set_style_bg_opa(obj, 0, 0);
    lv_obj_set_scrollbar_mode(obj, LV_SCROLLBAR_MODE_OFF);

    lv_obj_t* label = lv_label_create(obj);
    lv_obj_add_style(label, &style, 0);
    lv_label_set_text(label, tips ? tips : "");
    lv_obj_center(label);
    return label;
}

static lv_obj_t* create_switch(lv_obj_t* parent,lv_event_cb_t cb, uint8_t row, uint8_t col, uint8_t checked)
{
    lv_obj_t* sw = lv_switch_create(parent);
    lv_obj_add_flag(sw, LV_OBJ_FLAG_EVENT_BUBBLE);
    lv_obj_add_event_cb(sw, cb, LV_EVENT_VALUE_CHANGED, NULL);
    lv_obj_set_grid_cell(sw, LV_GRID_ALIGN_STRETCH, col, 1,
        LV_GRID_ALIGN_STRETCH, row, 1);
    lv_obj_set_style_radius(sw, 200, 0);    //to avoid memory malloc failed
    if(checked)
        lv_obj_add_state(sw, LV_STATE_CHECKED);
    return sw;
}

static lv_obj_t* create_slider(lv_obj_t* parent, lv_event_cb_t cb, uint8_t row, uint8_t col, int32_t min, int32_t max, uint8_t val)
{
    lv_obj_t* slider = lv_slider_create(parent);
    lv_obj_set_grid_cell(slider, LV_GRID_ALIGN_STRETCH, col, 2,
        LV_GRID_ALIGN_STRETCH, row, 1);
    lv_obj_add_event_cb(slider, cb, LV_EVENT_VALUE_CHANGED, NULL);
    lv_slider_set_range(slider, min, max);
    lv_slider_set_value(slider, val, LV_ANIM_OFF);
    lv_obj_add_flag(slider, LV_OBJ_FLAG_EVENT_BUBBLE);
    return slider;
}

static lv_obj_t* create_lines(lv_obj_t* parent, lv_event_cb_t cb, uint8_t row, uint8_t col, uint16_t cnt, uint16_t val)
{
#define COL_PAD_ALL_PCT     10

    lv_obj_t* obj = lv_obj_create(parent);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_EVENT_BUBBLE);
    lv_obj_remove_style_all(obj);
    lv_obj_set_grid_cell(obj, LV_GRID_ALIGN_STRETCH, col, 2,
        LV_GRID_ALIGN_STRETCH, row, 1);
    lv_obj_set_style_bg_opa(obj, 0, 0);
    lv_obj_set_scrollbar_mode(obj, LV_SCROLLBAR_MODE_OFF);
    lv_obj_set_layout(obj, LV_LAYOUT_FLEX);
    lv_obj_set_flex_flow(obj, LV_FLEX_FLOW_ROW);
    lv_obj_set_flex_align(obj,
        LV_FLEX_ALIGN_SPACE_BETWEEN,
        LV_FLEX_ALIGN_CENTER,
        LV_FLEX_ALIGN_CENTER);

    lv_obj_t* btn;
    for (uint32_t i = 0; i < cnt; i++)
    {
        btn = lv_btn_create(obj);
        lv_obj_remove_style_all(btn);
        lv_obj_set_style_bg_opa(btn, LV_OPA_COVER, 0);
        if (brigtness_tb[i] <= val)
            lv_obj_set_style_bg_color(btn, lv_palette_main(LV_PALETTE_LIGHT_GREEN), 0);
        else
            lv_obj_set_style_bg_color(btn, lv_palette_main(LV_PALETTE_GREY), 0);
        lv_obj_set_size(btn, LV_PCT((100 - COL_PAD_ALL_PCT)/cnt), LV_PCT(80));
        lv_obj_add_flag(btn, LV_OBJ_FLAG_EVENT_BUBBLE);
        lv_obj_add_event_cb(btn, cb, LV_EVENT_SHORT_CLICKED, (void *)i);
        lv_obj_set_ext_click_area(btn, LV_DPX(8));
        lv_obj_set_user_data(btn, obj);
    }
    return obj;
}

static lv_obj_t* create_button(lv_obj_t* parent, lv_event_cb_t cb, const char* text, uint8_t row, uint8_t col)
{
    lv_obj_t* btn = lv_btn_create(parent);
    lv_obj_add_event_cb(btn, cb, LV_EVENT_CLICKED, NULL);
    lv_obj_set_grid_cell(btn, LV_GRID_ALIGN_STRETCH, col, 2,
        LV_GRID_ALIGN_STRETCH, row, 1);
    
    // 设置按钮内边距，确保文本不会贴边
    lv_obj_set_style_pad_all(btn, 10, 0);
    lv_obj_set_style_pad_top(btn, 15, 0);
    lv_obj_set_style_pad_bottom(btn, 15, 0);
    
         // 设置默认按钮颜色
    lv_obj_set_style_bg_color(btn, lv_color_hex(0x1976D2), LV_PART_MAIN | LV_STATE_DEFAULT);
    lv_obj_set_style_bg_opa(btn, LV_OPA_COVER, LV_PART_MAIN | LV_STATE_DEFAULT);

    lv_obj_t* label = lv_label_create(btn);
    lv_obj_add_style(label, &style, 0);
    lv_label_set_text(label, text);
    lv_obj_set_style_text_align(label, LV_TEXT_ALIGN_CENTER, 0);
    lv_label_set_long_mode(label, LV_LABEL_LONG_WRAP);  // 允许文本换行
    lv_obj_set_width(label, LV_PCT(100));  // 设置标签宽度为100%，以便换行生效
    
    // 将标签居中放置在按钮内
    lv_obj_center(label);
    
    return btn;
}
static void cont_event_handler(struct lv_event_t* e)
{
    lv_obj_t* cont = lv_event_get_current_target_obj(e);
    lv_event_code_t code = lv_event_get_code(e);
    static uint32_t press_tick = 0;
    static lv_point_t press_pos = {0};

    if (lv_obj_get_y(cont) != 0) return;

    if (code == LV_EVENT_RELEASED || code == LV_EVENT_PRESS_LOST)
    {
        uint32_t release_tick = lv_tick_get();
        lv_point_t release_pos;
        lv_indev_get_point(lv_indev_get_act(), &release_pos);
        int32_t dx = release_pos.x - press_pos.x;
        int32_t dy = release_pos.y - press_pos.y;
        if(release_tick - press_tick < 500 &&  dy < 0 && abs(dy) > 50) 
        {
            switch_cont_anim(true);
            cont_status |= CONT_HIDDEN;
            cont_status &= ~CONT_IDLE;
        }
        else
        {
            countdown_anim();
        }
    }
    else if(code == LV_EVENT_PRESSED)
    {
        countdown_anim_del();

        press_tick = lv_tick_get();
        lv_indev_get_point(lv_indev_get_act(), &press_pos);

    }
}

static void vad_switch_event_handler(struct _lv_event_t* e)
{
    lv_obj_t * obj = lv_event_get_current_target(e);
//    vad_set_enable(lv_obj_has_state(obj, LV_STATE_CHECKED));
//    send_xz_config_msg_to_main();
    vad_enable = !vad_enable; // 取反
    rt_kprintf("vad_status: %d\n", vad_enable);
}

static void aec_switch_event_handler(struct _lv_event_t* e)
{
    lv_obj_t * obj = lv_event_get_current_target(e);
//    aec_set_enable(lv_obj_has_state(obj, LV_STATE_CHECKED));
//    send_xz_config_msg_to_main();
    aec_enabled = !aec_enabled; // 取反
    rt_kprintf("aec_status: %d\n", aec_enabled);
}

static void slider_event_handler(struct _lv_event_t* e)
{
    lv_obj_t* slider = lv_event_get_current_target_obj(e);
    audio_server_set_private_volume(AUDIO_TYPE_LOCAL_MUSIC, lv_slider_get_value(slider)); // 设置音量 
}

static void line_event_handler(struct _lv_event_t* e)
{
    uint32_t idx = (uint32_t)lv_event_get_user_data(e);
    lv_obj_t* obj = lv_event_get_current_target_obj(e);
    lv_obj_t* parent = (lv_obj_t *)lv_obj_get_user_data(obj);
    uint32_t cnt = lv_obj_get_child_count(parent);
    lv_obj_t* child;
    uint16_t i = 0;
    while(i < cnt)
    {
         child = lv_obj_get_child(parent, i);
         if (i <= idx)
         {
             lv_obj_set_style_bg_color(child, lv_palette_main(LV_PALETTE_LIGHT_GREEN), 0); 
         }
         else
         {
             lv_obj_set_style_bg_color(child, lv_palette_main(LV_PALETTE_GREY), 0);
         }
         i++;
    }
    rt_kprintf("set brightness %d", brigtness_tb[idx]);
    xz_set_lcd_brightness(brigtness_tb[idx]);
}

void xiaozhi_ui_update_confirm_popup(ui_msg_type_t type, BOOL needs_update);

static void update_switch_event_handler(struct _lv_event_t* e)
{
    // 获取按钮和标签对象
    lv_obj_t* btn = lv_event_get_target(e);
    lv_obj_t* label = lv_obj_get_child(btn, 0);

        // 添加空指针检查
    if (btn == RT_NULL || label == RT_NULL) {
        LOG_E("Button or label is NULL");
        return;
    }

    // 获取按钮当前的文本
    const char* current_text = lv_label_get_text(label);
    
    // 如果当前是"检查更新状态，执行检查更新操作
    if (strcmp(current_text, "检查更新") == 0) {
        lv_obj_set_style_bg_color(update_switch, lv_color_hex(0x90EE90), LV_PART_MAIN | LV_STATE_DEFAULT);
        // 调用OTA检查版本函数
        // 构建动态URL
        char* chip_id = get_client_id();
        char* dynamic_ota_url = build_ota_query_url(chip_id);
        int result = dfu_pan_query_latest_version(
            dynamic_ota_url, VERSION, latest_version, sizeof(latest_version));
        // 根据返回值判断是否有更新
        BOOL needs_update = (result > 0) ? RT_TRUE : RT_FALSE;
        LOG_D("OTA check result: %d", result);
        //发送消息，显示弹框，根据是否需要更新显示按钮
        xiaozhi_ui_update_confirm_popup(UI_MSG_SHOW_UPDATE_CONFIRM, needs_update);

        
    }
   
}
// 添加弹框按钮事件处理函数
static void update_confirm_button_event_handler(lv_event_t *e)
{
    lv_obj_t *btn = lv_event_get_target(e);
    lv_event_code_t code = lv_event_get_code(e);
    
    if (code == LV_EVENT_CLICKED) {
        // 获取按钮上的标签文本
        lv_obj_t *label = lv_obj_get_child(btn, 0);
        const char *button_text = lv_label_get_text(label);
        
        if (strcmp(button_text, "更新") == 0) {
            // 用户点击更新按钮
            LOG_I("User confirmed OTA update");
            
            // 隐藏弹框
            if (update_confirm_popup) {
                lv_obj_add_flag(update_confirm_popup, LV_OBJ_FLAG_HIDDEN);
            }
            // 在这里设置更新标志位
            if (dfu_pan_set_update_flags() != 0)
            {
                LOG_E("Failed to mark versions for update");
                return;
            }

            // 执行OTA更新流程
            // 检查是否有需要更新的文件
            BOOL needs_update = RT_FALSE;
            for (int i = 0; i < MAX_FIRMWARE_FILES; i++)
            {
                struct firmware_file_info temp_version;
                if (dfu_pan_get_firmware_file_info(i, &temp_version) == 0 &&
                    temp_version.needs_update)
                {
                    needs_update = RT_TRUE;
                    break;
                }
            }
            
            if (!needs_update) {
                LOG_I("No firmware files need update.");
                xiaozhi_ui_chat_output("没有需要更新的固件");
                xiaozhi_ui_standby_chat_output("无需更新");
                return;
            }
            
            LOG_I("System will reboot to OTA mode...");
            
            // 延迟一段时间确保消息显示
            rt_thread_mdelay(2000);
            
            // 重启系统
            HAL_PMU_Reboot();
        }
        else if (strcmp(button_text, "取消") == 0) {
            // 用户点击取消按钮
            LOG_I("User cancelled OTA update");
            //将下滑菜单按钮恢复颜色
            lv_obj_set_style_bg_color(update_switch, lv_color_hex(0x1976D2), LV_PART_MAIN);

            // 隐藏弹框
            if (update_confirm_popup) {
                lv_obj_add_flag(update_confirm_popup, LV_OBJ_FLAG_HIDDEN);
            }
        }
    }
}

rt_err_t xiaozhi_ui_obj_init()
{
    // 如果是低电量模式，只创建基本的屏幕，不创建对话界面
    if (!g_skip_startup) {
        rt_kprintf("Low battery mode: skipping normal UI initialization\n");
        
        // 只创建一个基本的黑屏，其他什么都不做
        lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x000000), LV_PART_MAIN | LV_STATE_DEFAULT);
        
        return RT_EOK;
    }
    
    // 获取屏幕分辨率
    lv_coord_t scr_width = lv_disp_get_hor_res(NULL);
    lv_coord_t scr_height = lv_disp_get_ver_res(NULL);
   
    {
        xiaozhi_home_screen_config_t home_config;
        xiaozhi_home_screen_refs_t home_refs;
        xiaozhi_home_screen_config_t standby_config;
        xiaozhi_home_screen_refs_t standby_refs;

        home_config.scale = g_scale;
        home_config.battery_level = g_battery_level;
        home_config.time_font = home_time_font;
        home_config.meta_font = home_meta_font;
        home_config.label_font = home_label_font;
        home_config.status_font = home_status_font;
        home_config.title_style = &style;
        home_config.body_style = &style2;
        home_config.battery_font = font_medium;
        home_config.header_event_cb = NULL;
        home_config.tile_event_cb = home_tile_event_handler;
        home_config.enable_header_event = false;
        home_config.enable_tile_event = true;

        if (xiaozhi_home_screen_create(&home_config, &home_refs) != RT_EOK)
        {
            return -RT_ERROR;
        }

        standby_config = home_config;
        standby_config.time_font = standby_clock_font;
        standby_config.label_font = standby_date_font;
        standby_config.meta_font = standby_info_font;
        standby_config.status_font = standby_weather_font;
        standby_config.battery_font = font_medium;
        standby_config.tile_event_cb = NULL;
        standby_config.enable_tile_event = false;

        if (xiaozhi_standby_screen_create(&standby_config, &standby_refs) != RT_EOK)
        {
            return -RT_ERROR;
        }

        g_home_screen_refs = home_refs;
        g_standby_screen_refs = standby_refs;
        home_screen = home_refs.screen;
        standby_screen = standby_refs.screen;
        lv_obj_add_flag(home_screen, LV_OBJ_FLAG_CLICKABLE);
        lv_obj_add_event_cb(home_screen,
                            home_screen_activity_event_handler,
                            LV_EVENT_PRESSED,
                            NULL);
        home_time_label = home_refs.time_label;
        standby_time_label = standby_refs.time_label;
        home_meta_label = home_refs.meta_label;
        img_emoji = standby_refs.img_emoji;
        hour_tens_img = standby_refs.hour_tens_img;
        hour_units_img = standby_refs.hour_units_img;
        minute_tens_img = standby_refs.minute_tens_img;
        minute_units_img = standby_refs.minute_units_img;
        battery_arc = standby_refs.battery_arc;
        ui_Label_ip = standby_refs.ui_Label_ip;
        last_time = standby_refs.last_time;
        ui_Image_calendar = standby_refs.ui_Image_calendar;
        ui_Label_year = standby_refs.ui_Label_year;
        ui_Label_lunar = standby_refs.ui_Label_lunar;
        ui_Label_day = standby_refs.ui_Label_day;
        ui_Label_second = standby_refs.ui_Label_second;
        ui_Image_second = standby_refs.ui_Image_second;
        ui_Label3 = standby_refs.ui_Label3;
        apply_home_screen_status_refs();
        weather_bgimg = NULL;
    }



    // 创建主容器 - Flex Column，垂直排列
    main_container = lv_obj_create(lv_screen_active());
    lv_obj_remove_flag(main_container, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_size(main_container, scr_width, scr_height);

    // 清除主容器的 padding 和 margin
    lv_obj_set_style_pad_all(main_container, 0, 0);
    lv_obj_set_style_margin_all(main_container, 0, 0);

    lv_obj_set_style_bg_opa(main_container, LV_OPA_0, 0);
    lv_obj_set_style_border_width(main_container, 0, 0);

    lv_obj_set_flex_flow(main_container, LV_FLEX_FLOW_COLUMN);
    lv_obj_set_flex_align(main_container,
                          LV_FLEX_ALIGN_START,   // 主轴靠上对齐
                          LV_FLEX_ALIGN_CENTER,  // 交叉轴居中
                          LV_FLEX_ALIGN_CENTER); // 对齐方式统一
    lv_obj_set_style_pad_gap(main_container, 0, 0);//子元素之间为0

    // 顶部状态栏容器（Flex Row）
    header_row = lv_obj_create(main_container);
    lv_obj_remove_flag(header_row, LV_OBJ_FLAG_SCROLLABLE); // 关闭滚动条
    lv_obj_set_size(header_row, scr_width, SCALE_DPX(40));  // 固定高度为 40dp
#if USING_TOUCH_SWITCH
    lv_obj_add_event_cb(header_row, header_row_event_handler, LV_EVENT_ALL, NULL);
#endif


    // 清除 header_row 的内边距和外边距
    lv_obj_set_style_pad_all(header_row, 0, 0);
    lv_obj_set_style_margin_all(header_row, 0, 0);
    // 设置 header_row 的背景透明和边框宽度为 0
    lv_obj_set_style_bg_opa(header_row, LV_OPA_0, 0);
    lv_obj_set_style_border_width(header_row, 0, 0);
    lv_obj_set_flex_flow(header_row, LV_FLEX_FLOW_ROW);
    lv_obj_set_flex_align(header_row, LV_FLEX_ALIGN_SPACE_BETWEEN,
                          LV_FLEX_ALIGN_CENTER, LV_FLEX_ALIGN_CENTER);
    lv_obj_set_style_bg_color(header_row, lv_color_hex(0x000000), LV_STATE_DEFAULT); // 调试背景色
    lv_obj_set_style_bg_opa(header_row, LV_OPA_30, LV_STATE_DEFAULT);
    // 插入一个空白对象作为左边距
    lv_obj_t *spacer = lv_obj_create(header_row);
    lv_obj_remove_flag(spacer, LV_OBJ_FLAG_SCROLLABLE); // 关闭滚动条
    lv_obj_set_style_bg_opa(spacer, LV_OPA_0, 0);
    lv_obj_set_style_border_width(spacer, 0, 0);
    lv_obj_set_size(spacer, SCALE_DPX(40), LV_SIZE_CONTENT); // 宽度为 40dp

    // BLE 图标 - 左上角
    global_img_ble = lv_img_create(header_row);
    lv_img_set_src(global_img_ble, &ble);
    lv_obj_set_size(global_img_ble, SCALE_DPX(24), SCALE_DPX(24)); // 24dp 图标
    lv_img_set_zoom(global_img_ble,
                    (int)(LV_SCALE_NONE * g_scale)); // 根据缩放因子缩放

    // Top Label - 居中显示
    global_label1 = lv_label_create(header_row);
    lv_label_set_long_mode(global_label1, LV_LABEL_LONG_WRAP);
    lv_obj_add_style(global_label1, &style, 0);
    lv_obj_set_width(global_label1, LV_PCT(80));
    lv_obj_set_style_text_align(global_label1, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_align_to(global_label1, header_row, LV_ALIGN_CENTER, 0, 0);

    // 电池图标 - 放在 header_row 容器中，与 BLE 图标对称
    lv_obj_t* battery_outline = lv_obj_create(header_row);
    lv_obj_set_style_border_width(battery_outline, 2, 0);// 边框宽度
    lv_obj_set_style_pad_all(battery_outline, 0, 0);// 内边距
    lv_obj_set_style_radius(battery_outline, 8, 0);// 圆角半径
    lv_obj_clear_flag(battery_outline, LV_OBJ_FLAG_SCROLLABLE);
    #ifdef LCD_USING_ST7789
    lv_obj_set_size(battery_outline, OUTLINE_W_ST7789, OUTLINE_H_ST7789);
    #else// LCD_USING_ST7789
    lv_obj_set_size(battery_outline, OUTLINE_W * g_scale, OUTLINE_H * g_scale);
    rt_kprintf("Battery outline sizedefualt: %d x %d\n", OUTLINE_W * g_scale,
               OUTLINE_H * g_scale);
#endif // defualt
    lv_obj_add_flag(battery_outline, LV_OBJ_FLAG_EVENT_BUBBLE);

/*---------------------------------下滑菜单-----------------*/
#define CONT_W          scr_width
#define CONT_H          scr_height
#define CONT_W_PER(x)   ((CONT_W)*(x)/100)
#define CONT_H_PER(x)   ((CONT_H)*(x)/100)

    static int32_t col_dsc[] = {0, 1, LV_GRID_FR(1), 0, LV_GRID_TEMPLATE_LAST };
    col_dsc[0] = CONT_W_PER(30);
    col_dsc[1] = CONT_W_PER(24);
    col_dsc[3] = CONT_W_PER(10);

    static int32_t row_dsc[] = {0, 0, 0, 0, 0, 0, 0 , LV_GRID_TEMPLATE_LAST };
    row_dsc[0] = CONT_H_PER(4);     // 第0行：4%高度
    row_dsc[1] = row_dsc[2] = CONT_H_PER(12);  // 第1、2行：各12%高度
    row_dsc[3] = row_dsc[4] = CONT_H_PER(8);   // 第3、4行：各8%高度
    row_dsc[5] = CONT_H_PER(8);     // 第5行：8%高度
    row_dsc[6] = CONT_H_PER(8);     // 第6行：8%高度，用于版本号
    row_dsc[7] = CONT_H_PER(8);               // 第7行：8%高度，用于新版本号
    cont = lv_obj_create(lv_screen_active());
    lv_obj_remove_style_all(cont);
    lv_obj_set_style_grid_column_dsc_array(cont, col_dsc, 0);
    lv_obj_set_style_grid_row_dsc_array(cont, row_dsc, 0);
    lv_obj_set_size(cont, CONT_W, CONT_H);
    lv_obj_set_style_bg_color(cont, lv_color_make(0X88, 0X88, 0X88), 0);
    lv_obj_set_style_bg_opa(cont, LV_OPA_COVER, 0);
    lv_obj_set_pos(cont, 0, - CONT_H);
    lv_obj_set_layout(cont, LV_LAYOUT_GRID);
    lv_obj_set_scrollbar_mode(cont, LV_SCROLLBAR_MODE_OFF);
    lv_obj_set_style_pad_row(cont, 20, 0);
#if USING_TOUCH_SWITCH
    lv_obj_add_event_cb(cont, cont_event_handler, LV_EVENT_ALL, NULL);
#endif

    create_tip_label(cont, "不打断", 1, 0); //vad
    interrupt_switch = create_switch(cont, vad_switch_event_handler, 1, 2, 1);
    create_tip_label(cont, "唤醒", 2, 0); //aec
    wakeup_switch = create_switch(cont, aec_switch_event_handler, 2, 2, 1);
    create_tip_label(cont, "音量", 3, 0);
    volume_slider = create_slider(cont, slider_event_handler, 3, 1, VOL_MIN_LEVEL, VOL_MAX_LEVEL, VOL_DEFAULE_LEVEL);
    create_tip_label(cont, "亮度", 4, 0);
    brightness_lines = create_lines(cont, line_event_handler, 4, 1, BRT_TB_SIZE, LCD_BRIGHTNESS_DEFAULT);
    create_tip_label(cont, "检查更新" ,5, 0);
    update_switch = create_button(cont, update_switch_event_handler, "检查更新", 5, 2);
    create_tip_label(cont, VERSION, 6, 2);
    create_tip_label(cont, "版本号:", 6, 0);
    create_tip_label(cont, "新版本:", 7, 1);
    latest_version_label = create_tip_label(cont, latest_version, 7, 2);

// 创建弹框（初始隐藏）
    update_confirm_popup = lv_obj_create(lv_screen_active());
    lv_obj_set_size(update_confirm_popup, 300, 200);
    lv_obj_center(update_confirm_popup);
    lv_obj_set_style_bg_color(update_confirm_popup, lv_color_hex(0x202020), 0);
    lv_obj_set_style_border_color(update_confirm_popup, lv_color_hex(0x00a0ff), 0);
    lv_obj_set_style_border_width(update_confirm_popup, 2, 0);
    lv_obj_set_style_radius(update_confirm_popup, 10, 0);
    lv_obj_add_flag(update_confirm_popup, LV_OBJ_FLAG_HIDDEN); // 初始隐藏

    // 创建提示文本
    update_confirm_label = lv_label_create(update_confirm_popup);
    lv_label_set_text(update_confirm_label, "提示");
    lv_obj_align(update_confirm_label, LV_ALIGN_TOP_MID, 0, 20);
    lv_obj_set_style_text_color(update_confirm_label, lv_color_hex(0xFFFFFF), 0);
    lv_obj_add_style(update_confirm_label, &style, 0);

    // 创建更新按钮
    update_button = lv_button_create(update_confirm_popup);
    lv_obj_set_size(update_button, 100, 40);
    lv_obj_align(update_button, LV_ALIGN_BOTTOM_MID, -60, -20);
    lv_obj_add_event_cb(update_button, update_confirm_button_event_handler, LV_EVENT_CLICKED, NULL);

    // 创建更新按钮文本
    lv_obj_t *update_button_label = lv_label_create(update_button);
    lv_label_set_text(update_button_label, "更新");
    lv_obj_center(update_button_label);
    lv_obj_add_style(update_button_label, &style, 0);

    // 创建取消按钮
    cancel_button = lv_button_create(update_confirm_popup);
    lv_obj_set_size(cancel_button, 100, 40);
    lv_obj_align(cancel_button, LV_ALIGN_BOTTOM_MID, 60, -20);
    lv_obj_add_event_cb(cancel_button, update_confirm_button_event_handler, LV_EVENT_CLICKED, NULL);
    
    // 创建取消按钮文本
    lv_obj_t *cancel_button_label = lv_label_create(cancel_button);
    lv_label_set_text(cancel_button_label, "取消");
    lv_obj_center(cancel_button_label);
    lv_obj_add_style(cancel_button_label, &style, 0);

/*------------------电池---------------------*/
    g_battery_fill = lv_obj_create(battery_outline);
    lv_obj_set_style_outline_width(g_battery_fill, 0, 0);
    lv_obj_set_style_outline_pad(g_battery_fill, 0, 0);
    lv_obj_set_style_border_width(g_battery_fill, 0, 0);
    lv_obj_set_style_bg_color(g_battery_fill, lv_color_hex(0x00ff00), 0); // 初始绿色

#ifdef LCD_USING_ST7789
    lv_obj_set_size(g_battery_fill, OUTLINE_W_ST7789 - 4, OUTLINE_H_ST7789 - 4);
#else  // LCD_USING_ST7789
    lv_obj_set_size(g_battery_fill, OUTLINE_W * g_scale - 4,
                    OUTLINE_H * g_scale - 4);
#endif // defualt

    lv_obj_set_style_border_width(g_battery_fill, 0, 0);
    lv_obj_set_style_radius(g_battery_fill, 8, 0);
    lv_obj_align(g_battery_fill, LV_ALIGN_LEFT_MID, 0, 0);
    lv_obj_clear_flag(g_battery_fill, LV_OBJ_FLAG_SCROLLABLE);

    g_battery_label = lv_label_create(battery_outline);
    // lv_obj_add_style(g_battery_label, &style_battery, 0);
    lv_label_set_text_fmt(g_battery_label, "%d%%", g_battery_level);
    lv_obj_align(g_battery_label, LV_ALIGN_CENTER, 0, 0);
    
 //充电图标       
    // charging_icon = lv_img_create(header_row); // 原来是在header_row
    charging_icon = lv_img_create(battery_outline); // 改为在电池框内
    lv_img_set_src(charging_icon, &cdian2);
    lv_obj_set_size(charging_icon, 32, 32);
    lv_obj_add_flag(charging_icon, LV_OBJ_FLAG_HIDDEN); // 初始隐藏
    lv_obj_align(charging_icon, LV_ALIGN_RIGHT_MID, 8, 0); // 电池框左侧，稍微有点间距

    // 插入右侧空白对象用于对称布局
    lv_obj_t *spacer_right = lv_obj_create(header_row);
    lv_obj_remove_flag(spacer_right, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_style_bg_opa(spacer_right, LV_OPA_0, 0);
    lv_obj_set_style_border_width(spacer_right, 0, 0);
    lv_obj_set_size(spacer_right, SCALE_DPX(50),
                    LV_SIZE_CONTENT); // 宽度为 50dp

    // ====== 中间 GIF 图片容器 img_container ======
    img_container = lv_obj_create(main_container);
    lv_obj_remove_flag(img_container, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_size(img_container, scr_width, scr_height * 0.4); // 高度自适应
    lv_obj_set_style_bg_color(img_container, lv_color_hex(0x000000), LV_STATE_DEFAULT); // 调试用绿色背景
    lv_obj_set_style_bg_opa(img_container, LV_OPA_20, LV_STATE_DEFAULT);
    lv_obj_set_style_pad_all(img_container, 0, 0);
    lv_obj_set_style_margin_all(img_container, 0, 0);
    lv_obj_set_style_border_width(img_container, 0, 0);

    //gif  Emoji - 居中显示
    seqimg = lv_seqimg_create(img_container);
    lv_seqimg_src_array(seqimg, angry, 57);
    lv_seqimg_set_period(seqimg, 30);          // 每帧间隔 100ms
    lv_obj_align(seqimg, LV_ALIGN_CENTER, 0, 0);
    lv_img_set_zoom(seqimg, (int)(LV_SCALE_NONE) * g_scale);
    lv_seqimg_play(seqimg);                     // 开始播放



    // ====== 底部文本容器 text_container 占 40% 屏幕高度 ======
    
    lv_obj_t *text_container = lv_obj_create(main_container);
    lv_obj_remove_flag(text_container, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_size(text_container, scr_width, scr_height * 0.4);
    lv_obj_set_style_bg_color(text_container, lv_color_hex(0x000000), LV_STATE_DEFAULT); // 蓝色调试背景
    lv_obj_set_style_bg_opa(text_container, LV_OPA_20, LV_STATE_DEFAULT);
    lv_obj_set_style_pad_all(text_container, 0, 0);
    lv_obj_set_style_margin_all(text_container, 0, 0);
    lv_obj_set_style_border_width(text_container, 0, 0);


    // Output Label - 紧贴 emoji 下方
    global_label2 = lv_label_create(text_container);
    lv_label_set_long_mode(global_label2, LV_LABEL_LONG_WRAP);
    lv_obj_add_style(global_label2, &style, 0);
    lv_obj_set_width(global_label2, LV_PCT(90));
    lv_obj_set_style_text_align(global_label2, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_align(global_label2, LV_ALIGN_TOP_MID, 0, 30);

    show_startup_animation();
    
    return RT_EOK;
}

// 音量进度条更新函数
void xiaozhi_ui_update_volume(int volume)
{
    if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_VOLUME_UPDATE);
        msg.payload.int_value = volume;
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send volume update UI message");
        }
    }
}
//屏幕亮度进度条更新函数
void xiaozhi_ui_update_brightness(int brightness)
{
    if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_BRIGHTNESS_UPDATE);
        msg.payload.int_value = brightness;
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send brightness update UI message");
        }
    }
}
//充电状态更新函数
void xiaozhi_ui_update_charge_status(uint8_t is_charging)
{
    if (ui_msg_queue != RT_NULL) 
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_CHARGE_STATUS_CHANGED);
        msg.payload.u8_value = is_charging;
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send charge status update UI message");
        }
    }
    else 
    {
        rt_kprintf("ui_msg_queue = null\n");
    }
}

void xiaozhi_ui_update_standby_emoji(char *string) // emoji
{
    if(ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_STANDBY_EMOJI);
        ui_msg_set_text(&msg, string);
        if(ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send standby emoji UI message");
        }
    }
}
void ui_update_real_weather_and_time(void)
{
            // 异步发送消息更新天气和时间
        if (ui_msg_queue != RT_NULL) {
            ui_msg_t msg;
            ui_msg_init(&msg, UI_MSG_UPDATE_WEATHER_AND_TIME);
            if (ui_msg_send(&msg) != RT_EOK) {
                LOG_E("Failed to send weather/time update message");
            }
        }
    
}

void ui_swith_to_standby_screen(void)
{
    if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_SWITCH_TO_STANDBY);
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send switch to standby UI message");
        }
    }
}

void ui_switch_to_home_screen(void)
{
    if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_SWITCH_TO_HOME);
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send switch to home UI message");
        }
    }
}

void ui_switch_to_xiaozhi_screen(void)
{
    if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_SWITCH_TO_MAIN);
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send switch to MAIN UI message");
        }
    }
}






void update_xiaozhi_ui_time(void *parameter)
{

// 获取当前时间
    xiaozhi_time_get_current(&g_current_time);
    rt_kprintf("[standby_dbg] rt_timer tick %02d:%02d:%02d queue=%p active=%p standby=%p\n",
               g_current_time.hour,
               g_current_time.minute,
               g_current_time.second,
               ui_msg_queue,
               lv_screen_active(),
               standby_screen);

    // 使用消息队列发送更新UI的消息到UI线程
    extern rt_mq_t ui_msg_queue;
    if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_TIME_UPDATE);
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send time update UI message");
        }
    } else {
        // 如果没有消息队列，回退到直接调用（保持向后兼容）
        time_ui_update_callback();
    }
        
}
void update_xiaozhi_ui_weather(void *parameter)
{
        
        // 使用消息队列发送更新UI的消息到UI线程
        extern rt_mq_t ui_msg_queue;
        if (ui_msg_queue != RT_NULL) {
            ui_msg_t msg;
            ui_msg_init(&msg, UI_MSG_WEATHER_UPDATE);
            if (ui_msg_send(&msg) != RT_EOK) {
                LOG_E("Failed to send weather update UI message");
            }
        } else {
            // 如果没有消息队列，回退到直接调用（保持向后兼容）
            weather_ui_update_callback();
        }

}

void xiaozhi_ui_chat_status(char *string) // top text
{
    if(ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_CHAT_STATUS);
        ui_msg_set_text(&msg, string);
        if(ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send UI message");
        }
    }
}

void xiaozhi_ui_reinit_audio(void)
{
    if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_REINIT_AUDIO);
        if (ui_msg_send(&msg) != RT_EOK) 
        {
            LOG_E("Failed to send reinit audio UI message");
        }
    }
}

void xiaozhi_ui_trigger_activity(void)
{
    if (ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_TRIGGER_ACTIVITY);
        if (ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send trigger activity UI message");
        }
    }
}

void xiaozhi_ui_start_sleep_timer(rt_uint32_t timeout_ms)
{
    if (ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_START_SLEEP_TIMER);
        msg.payload.int_value = (int)timeout_ms;
        if (ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send sleep timer UI message");
        }
    }
}

void xiaozhi_ui_standby_chat_output(char *string)
{
    if(ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_STANDBY_CHAT_OUTPUT);
        ui_msg_set_text(&msg, string);
        if(ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send standby_chat UI message");
        }
    }
}

void xiaozhi_ui_chat_output(char *string)
{
    if(ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_CHAT_OUTPUT);
        ui_msg_set_text(&msg, string);
        if(ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send UI message");
        }
    }
}

static void switch_to_second_part(void *parameter)
{
     if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_TTS_SWITCH_PART);
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send tts switch UI message");
        }
    }
}
void xiaozhi_ui_tts_output(char *string)
{
     if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_TTS_OUTPUT);
        ui_msg_set_text(&msg, string);
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send tts output UI message");
        }
    }
}

void xiaozhi_ui_update_emoji(char *string) // emoji
{
    if(ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_UPDATE_EMOJI);
        ui_msg_set_text(&msg, string);
        if(ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send UI message");
        }
    }
}

void xiaozhi_ui_update_ble(char *string) // ble
{
    if(ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_UPDATE_BLE);
        ui_msg_set_text(&msg, string);
        if(ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send UI message");
        }
    }
}

// 更新确认弹框的函数
void xiaozhi_ui_update_confirm_popup(ui_msg_type_t type, BOOL needs_update)
{
    if (ui_msg_queue != RT_NULL) {
        ui_msg_t msg;
        ui_msg_init(&msg, type);
        if (type == UI_MSG_SHOW_UPDATE_CONFIRM) {
            msg.payload.bool_value = needs_update;
        }
        if (ui_msg_send(&msg) != RT_EOK) {
            LOG_E("Failed to send UI message");
        }
    }
}
// 更新最新版本号显示的函数
void xiaozhi_ui_update_latest_version(char *version)
{
    if (ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_UPDATE_LATEST_VERSION);
        ui_msg_set_text(&msg, version);
        if (ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send update latest version UI message");
        }
    }
}

// 用于发送模拟按钮更新确认弹框按钮事件的UI消息
void xiaozhi_ui_update_confirm_button_event(bool is_update_button)
{
    if (ui_msg_queue != RT_NULL)
    {
        ui_msg_t msg;
        ui_msg_init(&msg, UI_MSG_CONFIRM_BUTTON_EVENT);
        msg.payload.bool_value = is_update_button ? RT_TRUE : RT_FALSE;
        if (ui_msg_send(&msg) != RT_EOK)
        {
            LOG_E("Failed to send update confirm button event UI message");
        }
    }
}

static void pm_event_handler(gui_pm_event_type_t event)
{
    LOG_I("in pm_event_handle");
    lv_obj_t *now_screen = lv_screen_active();
    switch (event)
    {
    case GUI_PM_EVT_SUSPEND:
    {
        LOG_I("in GUI_PM_EVT_SUSPEND");
        lv_timer_enable(false);
        g_low_power_mode = true;
        break;
    }
    case GUI_PM_EVT_RESUME:
    {
        
        g_low_power_mode = false;

        if(update_time_ui_timer)
        {
            rt_timer_start(update_time_ui_timer);//醒来继续开定时器更新ui
        }
        
        if(update_weather_ui_timer)
        {
            rt_timer_start(update_weather_ui_timer);
        }


        lv_timer_enable(true);
        if(ui_sleep_timer)
        {
            lv_timer_delete(ui_sleep_timer);
            ui_sleep_timer = NULL;
        }
        if (shutdown_state && lowpower_shutdown_state) //如果是关机消息触发的唤醒，就不再切换到对话界面去了
        {
            rt_kprintf("恢复屏幕-> 对话\n");
            ui_switch_to_xiaozhi_screen();
            shutdown_state = TRUE;
            lowpower_shutdown_state = TRUE;
        }
        if (!thiz->vad_enabled)
        {
            thiz->vad_enabled = true;
            xz_aec_mic_open(thiz);
            rt_kprintf("PM resume: mic reopened\n");
            
        }
        break;
    }
    default:
    {
        LOG_W("Unhandled PM event: %d", event);
        break;
    }
    }
}
void pm_ui_init()
{

    int8_t wakeup_pin;
    uint16_t gpio_pin;
    GPIO_TypeDef *gpio;

    gpio = GET_GPIO_INSTANCE(BSP_KEY1_PIN);
    gpio_pin = GET_GPIOx_PIN(BSP_KEY1_PIN);

    wakeup_pin = HAL_HPAON_QueryWakeupPin(gpio, gpio_pin);
    if (wakeup_pin < 0)
    {
        LOG_E("HAL_HPAON_QueryWakeupPin failed: %d", wakeup_pin);
        return;
    }

    lcd_device = rt_device_find(LCD_DEVICE_NAME);
    if (lcd_device == RT_NULL)
    {
        LOG_E("rt_device_find(%s) failed", LCD_DEVICE_NAME);
        return;
    }
#ifdef BSP_USING_PM
    pm_enable_pin_wakeup(wakeup_pin, AON_PIN_MODE_DOUBLE_EDGE);
    gui_ctx_init();
    gui_pm_init(lcd_device, pm_event_handler);
#endif
}
void xiaozhi_update_battery_level(int level)
{
    // 确保电量在 0 到 100 之间
    g_battery_level = level;
    if (g_battery_fill)
    {
#ifdef LCD_USING_ST7789
        int width =
            (OUTLINE_W_ST7789 - 4) * g_battery_level / 100; // 计算填充宽度
#else                                                       // LCD_USING_ST7789
        int width =
            (OUTLINE_W * g_scale - 4) * g_battery_level / 100; // 计算填充宽度
#endif

        if (width < 2 && g_battery_level > 0)
            width = 2;                           // 最小宽度为 2
        lv_obj_set_width(g_battery_fill, width); // 根据电量设置填充宽度

        // 更新颜色
        if (g_battery_level <= 20)
        {
            lv_obj_set_style_bg_color(g_battery_fill, lv_color_hex(0xff0000),
                                      0); // 红色
        }
        else
        {
            lv_obj_set_style_bg_color(g_battery_fill, lv_color_hex(0xff00),
                                      0); // 绿色
        }
    }

    if (g_battery_label)
    {
        //rt_kprintf("Updating battery label: %d\n", g_battery_level);
        lv_label_set_text_fmt(g_battery_label, "%d%%",
                              g_battery_level); // 更新电量标签
    }

    // 状态栏的环形电池显示
    if (battery_arc) {
        lv_arc_set_value(battery_arc, g_battery_level); // 更新圆弧电量显示
        
        // 根据电量改变颜色
        if (g_battery_level <= 20) {
            // 低电量红色
            lv_obj_set_style_arc_color(battery_arc, lv_color_hex(0xCC0000), LV_PART_INDICATOR);
        } else if (g_battery_level <= 50) {
            // 中等电量黄色
            lv_obj_set_style_arc_color(battery_arc, lv_color_hex(0xCCCC00), LV_PART_INDICATOR);
        } else {
            // 高电量绿色
            lv_obj_set_style_arc_color(battery_arc, lv_color_hex(0x00CC00), LV_PART_INDICATOR);
        }
    }
    
    // 更新电池电量百分比文本
    if (battery_percent_label) 
    {
        lv_label_set_text_fmt(battery_percent_label, "%d%%", g_battery_level);
    }
    
}


void xiaozhi_ui_task(void *args)
{
    rt_err_t ret = RT_EOK;
    rt_uint32_t ms;
    static rt_device_t touch_device;
    rt_sem_init(&update_ui_sema, "update_ui", 1, RT_IPC_FLAG_FIFO);
    rt_kprintf("xiaozhi_ui_task start\n");
    //初始化UI消息队列
    ui_msg_queue = rt_mq_create("ui_msg", sizeof(ui_msg_t), 20, RT_IPC_FLAG_FIFO);
    if(ui_msg_queue == RT_NULL)
    {
        LOG_E("Failed to create UI message queue");
        return;
    }
    // 初始化UI消息邮箱
    if (g_ui_task_mb == RT_NULL) {
        g_ui_task_mb = rt_mb_create("ui_mb", 8, RT_IPC_FLAG_FIFO);
        if (g_ui_task_mb == RT_NULL)
        {
            LOG_E("Failed to create UI mailbox");
            return;
        }
    }
    rt_kprintf("xz_ui: mailbox ready\n");
    /* init littlevGL */
    ret = littlevgl2rtt_init("lcd");
    if (ret != RT_EOK)
    {
        LOG_E("littlevgl2rtt_init failed: %d", ret);
        return;
    }
    rt_kprintf("xz_ui: lvgl ready\n");


#ifdef BSP_USING_PM
    pm_ui_init();
    rt_kprintf("xz_ui: pm init done\n");
#endif
    // 如果是低电量模式，简化初始化
    if (!g_skip_startup) 
    {
        rt_kprintf("Low battery mode: simplified UI task initialization\n");
        
        // 只创建必要的字体和样式
        float scale = get_scale_factor();
        g_scale = scale;
        
        const int base_font_size = 30;
        const int adjusted_font_size = (int)(base_font_size * scale + 0.5f);
        
        lv_style_init(&style);
        lv_font_t *font = lv_tiny_ttf_create_data(xiaozhi_font, xiaozhi_font_size, adjusted_font_size);
        lv_style_set_text_font(&style, font);
        lv_style_set_text_align(&style, LV_TEXT_ALIGN_CENTER);
        lv_style_set_text_color(&style, lv_color_hex(0xFFFFFF));
        lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x000000), LV_PART_MAIN | LV_STATE_DEFAULT);
        
        ret = xiaozhi_ui_obj_init();
        if (ret != RT_EOK) {
            return;
        }
        
        // 低电量模式下的简化主循环
        while (1) {
            rt_uint32_t ui_event;
            
            // 只处理低电量相关的UI事件
            if (rt_mb_recv(g_ui_task_mb, &ui_event, 0) == RT_EOK) {
                if (ui_event == UI_EVENT_LOW_BATTERY_WARNING) {
                    show_low_battery_warning();
                }
            }
            
            if (RT_EOK == rt_sem_trytake(&update_ui_sema)) {
                ms = lv_task_handler();
                rt_thread_mdelay(ms);
                rt_sem_release(&update_ui_sema);
            }
        }
        return; // 低电量模式下不执行后续的正常初始化
    }
float scale = get_scale_factor();
lv_coord_t screen_w = lv_disp_get_hor_res(NULL);
lv_coord_t screen_h = lv_disp_get_ver_res(NULL);
lv_coord_t standby_short_edge = screen_w < screen_h ? screen_w : screen_h;
float home_scale = (float)screen_w / 390.0f;
float standby_scale = (float)standby_short_edge / 528.0f;

const int medium_font_size = (int)(20 * scale + 0.5f);
const int home_time_font_size = (int)(31 * home_scale + 0.5f);
const int home_label_font_size = (int)(17 * home_scale + 0.5f);
const int standby_clock_font_size = (int)(72 * standby_scale + 0.5f);

/* Keep TTF allocations small on this board to avoid starving other services. */
font_medium = lv_tiny_ttf_create_data(xiaozhi_font, xiaozhi_font_size, medium_font_size);
home_time_font = lv_tiny_ttf_create_data(xiaozhi_font, xiaozhi_font_size, home_time_font_size);
home_label_font = lv_tiny_ttf_create_data(xiaozhi_font, xiaozhi_font_size, home_label_font_size);
standby_clock_font = lv_tiny_ttf_create_data(xiaozhi_font, xiaozhi_font_size, standby_clock_font_size);

if (font_medium == NULL)
{
    font_medium = (lv_font_t *)LV_FONT_DEFAULT;
}
if (home_label_font == NULL)
{
    home_label_font = font_medium;
}
if (home_time_font == NULL)
{
    home_time_font = home_label_font;
}
if (standby_clock_font == NULL)
{
    standby_clock_font = home_time_font;
}

home_meta_font = home_label_font;
home_status_font = home_label_font;
standby_date_font = font_medium;
standby_info_font = font_medium;
standby_weather_font = font_medium;


    g_scale = scale; // 保存全局缩放因子
    rt_kprintf("Scale factor: %.2f\n", scale);
    lv_style_init(&style2);
     lv_style_set_text_font(&style2, font_medium);
    lv_style_set_text_align(&style2, LV_TEXT_ALIGN_CENTER);
    lv_style_set_text_color(&style2, lv_color_hex(0xFFFFFF));
 

    lv_style_init(&style);
    lv_style_set_text_font(&style, home_label_font);
    lv_style_set_text_align(&style, LV_TEXT_ALIGN_CENTER);
    lv_style_set_text_color(&style, lv_color_hex(0xFFFFFF));
    lv_obj_set_style_bg_color(lv_screen_active(), lv_color_hex(0x000000),
                              LV_PART_MAIN | LV_STATE_DEFAULT); // SET BG COLOR

    rt_kprintf("xz_ui: before obj init\n");

    ret = xiaozhi_ui_obj_init();
    if (ret != RT_EOK)
    {
        LOG_E("xiaozhi_ui_obj_init failed: %d", ret);
        return;
    }
    rt_kprintf("xz_ui: obj init done\n");
    
    rt_charge_set_rx_ind(charger_event_callback); // 初始化充电检测
    set_charge_icon();
    rt_kprintf("xz_ui: charge icon ready\n");

    if (global_img_ble)
    {
        lv_img_set_src(global_img_ble, &ble_close);
    }
    if (global_label1)
    {
        lv_label_set_text(global_label1, "连接中...");
    }
    if (global_label2)
    {
        lv_label_set_text(global_label2, "等待连接...");
    }
    if (seqimg)
    {
        lv_seqimg_src_array(seqimg, neutral, sizeof(neutral) / sizeof(neutral[0]));
    }
    rt_kprintf("xz_ui: startup ui ready\n");


    //每秒更新时间的ui
    if (!update_time_ui_timer) 
    {update_time_ui_timer = rt_timer_create("update_ui_time", update_xiaozhi_ui_time, NULL,
                                    rt_tick_from_millisecond(1000), //每秒更新time的ui
                                    RT_TIMER_FLAG_PERIODIC  | RT_TIMER_FLAG_SOFT_TIMER);
    } else 
    {
        rt_timer_stop(update_time_ui_timer);
    }
    rt_timer_start(update_time_ui_timer);



        //更新天气
    if (!update_weather_ui_timer) 
    {update_weather_ui_timer = rt_timer_create("update_ui_time", update_xiaozhi_ui_weather, NULL,
                                    rt_tick_from_millisecond(1800000), //30分钟
                                    RT_TIMER_FLAG_PERIODIC  | RT_TIMER_FLAG_SOFT_TIMER);
    } 
    else 
    {
        rt_timer_stop(update_weather_ui_timer);
    }
    rt_timer_start(update_weather_ui_timer);


    while (1)
    {
        rt_uint32_t btn_event;
        rt_uint32_t ui_event;
        //先处理充电消息
        if (g_charge_status_isr_pending)
        {
            uint8_t v = g_charge_status_isr_value;
            g_charge_status_isr_pending = 0;
            xiaozhi_ui_update_charge_status(v);
        }
        if (g_kws_force_exit)
        {
            g_kws_force_exit = 0;
            kws_demo_stop();
        }

        // 处理关机事件
        if (rt_mb_recv(g_ui_task_mb, &ui_event, 0) == RT_EOK)
        {
            if (ui_event == UI_EVENT_SHUTDOWN)
            {
                show_shutdown();
            }
            else if (ui_event == UI_EVENT_LOW_BATTERY_SHUTDOWN)
            {
                g_screen_before_low_battery = lv_screen_active();
                show_low_battery_shutdown();
            }
            else if (ui_event == UI_EVENT_LOW_BATTERY_WARNING)  
            {
                show_low_battery_warning();
            }
        }
        // 处理按钮事件
        if (rt_mb_recv(g_button_event_mb, &btn_event, 0) == RT_EOK)
        {
            rt_kprintf("button event: %d\n", btn_event);
            switch (btn_event)
            {
            case BUTTON_EVENT_PRESSED:
                    report_user_activity();
                    ws_send_speak_abort(&g_xz_ws.clnt, g_xz_ws.session_id,kAbortReasonWakeWordDetected);                                           
                    xz_speaker(0); // 关闭扬声器
					rt_kprintf("vad_enabled jjjjjk\n");
#ifdef BSP_USING_PM
                    if(!thiz->vad_enabled)
                    {
                        rt_kprintf("vad_enabled\n");
                        thiz->vad_enabled = true;
                        xz_aec_mic_open(thiz);    
                    }
#endif                                       
                xiaozhi_ui_chat_status("聆听中...");
                break;
                
            case BUTTON_EVENT_RELEASED:
                report_user_activity();
                xiaozhi_ui_chat_status("待命中...");
#if !PKG_XIAOZHI_USING_AEC  
                ws_send_listen_stop(&g_xz_ws.clnt, g_xz_ws.session_id);
                xz_mic(0);
#endif // !PKG_XIAOZHI_USING_AEC                
                break;

            default:
                break;
            }
        }

        rt_uint32_t battery_level;
        if (rt_mb_recv(g_battery_mb, &battery_level, 0) == RT_EOK)
        {
           // rt_kprintf("Battery level received: %d\n", battery_level);
            xiaozhi_update_battery_level(battery_level);
        }
        
        // 处理UI消息队列中的消息
        ui_msg_t msg;
        while (rt_mq_recv(ui_msg_queue, &msg, sizeof(ui_msg_t), 0) == RT_EOK)
        {
            rt_kprintf("xz_ui: handling msg %d\n", msg.type);
            switch (msg.type)
            {
                case UI_MSG_STANDBY_CHAT_OUTPUT:
                    if(msg.payload.text[0] != '\0')
                    {
                        if (ui_Label3)
                        {
                            lv_label_set_text(ui_Label3, msg.payload.text);
                        }
                        else
                        {
                            rt_kprintf("xz_ui: standby chat label missing, ignore: %s\n", msg.payload.text);
                        }
                    }
                    break;
                case UI_MSG_UPDATE_WEATHER_AND_TIME:
                    LOG_I("update weather and time\n");
                    rt_mb_send(g_bt_app_mb, UPDATE_REAL_WEATHER_AND_TIME);
                    break;
                case UI_MSG_STANDBY_EMOJI:
                    if(msg.payload.text[0] != '\0')
                    {
                        if (strcmp(msg.payload.text, "sleepy") == 0)
                        {
                            if (img_emoji) 
                            {
                                lv_img_set_src(img_emoji, &sleepy2); // 使用睡眠表情表示小智未连接
                            }
                        }
                        else if (strcmp(msg.payload.text, "funny") == 0)
                        {
                            if (img_emoji) 
                            {
                                lv_img_set_src(img_emoji, &funny2); // 使用睡眠表情表示小智未连接
                            }
                        }
                    }
                    break;
                case UI_MSG_SWITCH_TO_STANDBY:
                    if (standby_screen) {
                        lv_obj_t *active_screen = lv_screen_active();
                        if (active_screen == standby_screen ||
                            active_screen == sleep_screen ||
                            active_screen == shutdown_screen ||
                            active_screen == low_battery_shutdown_screen)
                        {
                            break;
                        }

                        lv_screen_load(standby_screen);
                        apply_standby_screen_status_refs();
                        lv_obj_set_parent(cont, lv_screen_active());
                        lv_obj_set_parent(update_confirm_popup, lv_screen_active());
                        lv_obj_move_foreground(cont);
                        refresh_non_dialog_screen_status();
                        }

                        // mic关闭，开启KWS
                        xz_aec_mic_close(thiz);
                        if(aec_enabled) 
                        {
                            kws_demo();
                        }    

                        if(g_pan_connected)
                        {
                            rt_kprintf("create sleep timer1\n");
                        }
                        ui_restart_sleep_timer(60000);

                        if (standby_update_timer != NULL) {
                            lv_timer_delete(standby_update_timer);
                        }
                        
                        // 创建定时器，稍后执行更新
                        standby_update_timer = lv_timer_create(standby_update_callback, 100, NULL);

                    break;

                case UI_MSG_SWITCH_TO_HOME:
                    if (home_screen) {
                        if(ui_sleep_timer)
                        {
                            lv_timer_delete(ui_sleep_timer);
                            ui_sleep_timer = NULL;
                        }

                        lv_screen_load(home_screen);
                        apply_home_screen_status_refs();
                        lv_obj_set_parent(cont, lv_screen_active());
                        lv_obj_set_parent(update_confirm_popup, lv_screen_active());
                        lv_obj_move_foreground(cont);
                        refresh_non_dialog_screen_status();
                    }
                    xz_aec_mic_close(thiz);
                    if(aec_enabled)
                    {
                        kws_demo();
                    }
                    ui_restart_sleep_timer(30000);
                    break;
                    
                case UI_MSG_SWITCH_TO_MAIN:
                    if (main_container) {
                        if(ui_sleep_timer)
                        {
                            lv_timer_delete(ui_sleep_timer);
                            ui_sleep_timer = NULL;
                        }

                        lv_screen_load(lv_obj_get_screen(main_container));
                        lv_obj_set_parent(cont, lv_screen_active());
                        lv_obj_set_parent(update_confirm_popup, lv_screen_active());
                        lv_obj_move_foreground(cont);
                    }
                    // mic开启，关闭KWS
                    xz_aec_mic_open(thiz);
                    if (g_kws_force_exit)
                    {
                        g_kws_force_exit = 0;
                        kws_demo_stop();
                    }
#ifdef XIAOZHI_USING_MQTT
                    if (mqtt_g_state == kDeviceStateIdle)
                    {
                        mqtt_listen_start(&g_xz_context, kListeningModeAlwaysOn);
                    }
#else
                    if (g_xz_ws.is_connected)
                    {
                        ws_send_listen_start(&g_xz_ws.clnt,
                                             g_xz_ws.session_id,
                                             kListeningModeAlwaysOn);
                    }
#endif
                    break;
                case UI_MSG_WEATHER_UPDATE:
                    weather_ui_update_callback();
                    break;
                case UI_MSG_TIME_UPDATE:
                    rt_kprintf("[standby_dbg] UI_MSG_TIME_UPDATE active=%p standby=%p\n",
                               lv_screen_active(), standby_screen);
                    time_ui_update_callback();
                    break;
                case UI_MSG_CHAT_STATUS:
                    if(msg.payload.text[0] != '\0')
                    {
                        lv_label_set_text(global_label1, msg.payload.text);
                    }
                    break;
                case UI_MSG_CHAT_OUTPUT:
                    if(msg.payload.text[0] != '\0')
                    {
                        lv_label_set_text(global_label2, msg.payload.text);
                    }
                    break;
                case UI_MSG_VOLUME_UPDATE:
                {
                    int volume = msg.payload.int_value;
                    if (volume_slider) {
                        lv_slider_set_value(volume_slider, volume, LV_ANIM_OFF);
                    }
                    break; 
                }
                case UI_MSG_BRIGHTNESS_UPDATE:
                {
                    int brightness = msg.payload.int_value;
                    // 更新亮度显示条
                    if (brightness_lines) {
                        uint32_t cnt = lv_obj_get_child_count(brightness_lines);
                        lv_obj_t* child;
                        uint16_t i = 0;
                        // 根据亮度值更新显示条的颜色
                        while(i < cnt) {
                            child = lv_obj_get_child(brightness_lines, i);
                            if (brigtness_tb[i] <= brightness)
                                lv_obj_set_style_bg_color(child, lv_palette_main(LV_PALETTE_LIGHT_GREEN), 0);
                            else
                                lv_obj_set_style_bg_color(child, lv_palette_main(LV_PALETTE_GREY), 0);
                            i++;
                        }
                    }
                    break;
                }
                case UI_MSG_CHARGE_STATUS_CHANGED:
                {
                    uint8_t is_charging = msg.payload.u8_value;
                    bool should_show_charging = is_charging && (g_battery_level < 100);
                    if (charging_icon) 
                    {
                        if (should_show_charging) 
                        {
                            lv_obj_clear_flag(charging_icon, LV_OBJ_FLAG_HIDDEN);
                            rt_kprintf("显示充电图标\n");
                        } 
                        else 
                        {
                           if (is_charging && g_battery_level >= 100) 
                            {
                                rt_kprintf("电量已满，隐藏充电图标 (电量: %d%%)\n", g_battery_level);
                                lv_obj_add_flag(charging_icon, LV_OBJ_FLAG_HIDDEN);
                            } 
                            else 
                            {
                                rt_kprintf("隐藏充电图标\n");
                                lv_obj_add_flag(charging_icon, LV_OBJ_FLAG_HIDDEN);
                            }
                        }
                    }
                    if (standby_charging_icon) 
                    {
                        if (should_show_charging) 
                        {
                            lv_obj_clear_flag(standby_charging_icon, LV_OBJ_FLAG_HIDDEN);
                            rt_kprintf("显示待机界面充电图标 (电量: %d%%)\n", g_battery_level);
                        } 
                        else 
                        {
                            lv_obj_add_flag(standby_charging_icon, LV_OBJ_FLAG_HIDDEN);
                            if (is_charging && g_battery_level >= 100) 
                            {
                                rt_kprintf("电量已满，隐藏待机界面充电图标 (电量: %d%%)\n", g_battery_level);
                            } 
                            else 
                            {
                                rt_kprintf("隐藏待机界面充电图标\n");
                            }
                        }
                    }
                    break;
                }
                case UI_MSG_UPDATE_EMOJI:
                    if(msg.payload.text[0] != '\0')
                    {
                        if (strcmp(msg.payload.text, "neutral") == 0)
                        {
                            lv_seqimg_src_array(seqimg, neutral, sizeof(neutral) / sizeof(neutral[0]));
                        }
                        else if (strcmp(msg.payload.text, "happy") == 0)
                        {
                            lv_seqimg_src_array(seqimg, funny, sizeof(funny) / sizeof(funny[0]));
                        }
                        else if (strcmp(msg.payload.text, "laughing") == 0)
                        {
                            lv_seqimg_src_array(seqimg, funny, sizeof(funny) / sizeof(funny[0]));
                        }
                        else if (strcmp(msg.payload.text, "funny") == 0)
                        {
                            lv_seqimg_src_array(seqimg, funny, sizeof(funny) / sizeof(funny[0]));
                        }
                        else if (strcmp(msg.payload.text, "sad") == 0)
                        {
                            lv_seqimg_src_array(seqimg, crying, sizeof(crying) / sizeof(crying[0]));
                        }
                        else if (strcmp(msg.payload.text, "angry") == 0)
                        {
                            lv_seqimg_src_array(seqimg, angry, sizeof(angry) / sizeof(angry[0]));
                        }
                        else if (strcmp(msg.payload.text, "crying") == 0)
                        {
                            lv_seqimg_src_array(seqimg, crying, sizeof(crying) / sizeof(crying[0]));
                        }
                        else if (strcmp(msg.payload.text, "loving") == 0)
                        {
                            lv_seqimg_src_array(seqimg, loving, sizeof(loving) / sizeof(loving[0]));
                        }
                        else if (strcmp(msg.payload.text, "embarrassed") == 0)
                        {
                            lv_seqimg_src_array(seqimg, embarrassed, sizeof(embarrassed) / sizeof(embarrassed[0]));
                        }
                        else if (strcmp(msg.payload.text, "surprised") == 0)
                        {
                            lv_seqimg_src_array(seqimg, surprised, sizeof(surprised) / sizeof(surprised[0]));
                        }
                        else if (strcmp(msg.payload.text, "shocked") == 0)
                        {
                            lv_seqimg_src_array(seqimg, surprised, sizeof(surprised) / sizeof(surprised[0]));
                        }
                        else if (strcmp(msg.payload.text, "thinking") == 0)
                        {
                            lv_seqimg_src_array(seqimg, thinking, sizeof(thinking) / sizeof(thinking[0]));
                        }
                        else if (strcmp(msg.payload.text, "winking") == 0)
                        {
                            lv_seqimg_src_array(seqimg, loving, sizeof(loving) / sizeof(loving[0]));
                        }
                        else if (strcmp(msg.payload.text, "cool") == 0)
                        {
                            lv_seqimg_src_array(seqimg, cool, sizeof(cool) / sizeof(cool[0]));
                        }
                        else if (strcmp(msg.payload.text, "relaxed") == 0)
                        {
                            lv_seqimg_src_array(seqimg, cool, sizeof(cool) / sizeof(cool[0]));
                        }
                        else if (strcmp(msg.payload.text, "delicious") == 0)
                        {
                            lv_seqimg_src_array(seqimg, loving, sizeof(loving) / sizeof(loving[0]));
                        }
                        else if (strcmp(msg.payload.text, "kissy") == 0)
                        {
                            lv_seqimg_src_array(seqimg, kissy, sizeof(kissy) / sizeof(kissy[0]));
                        }
                        else if (strcmp(msg.payload.text, "confident") == 0)
                        {
                            lv_seqimg_src_array(seqimg, cool, sizeof(cool) / sizeof(cool[0]));
                        }
                        else if (strcmp(msg.payload.text, "sleepy") == 0)
                        {
                            lv_seqimg_src_array(seqimg, sleepy, sizeof(sleepy) / sizeof(sleepy[0]));
                        }
                        else if (strcmp(msg.payload.text, "silly") == 0)
                        {
                            lv_seqimg_src_array(seqimg, thinking, sizeof(thinking) / sizeof(thinking[0]));
                        }
                        else if (strcmp(msg.payload.text, "confused") == 0)
                        {
                            lv_seqimg_src_array(seqimg, thinking, sizeof(thinking) / sizeof(thinking[0]));
                        }
                        else
                        {
                            lv_seqimg_src_array(seqimg, neutral, sizeof(neutral) / sizeof(neutral[0])); // common emoji is neutral
                        }
                    }
                    break;
                case UI_MSG_UPDATE_BLE:
                    if(msg.payload.text[0] != '\0')
                    {
                        if (strcmp(msg.payload.text, "open") == 0)
                        {
                            lv_img_set_src(global_img_ble, &ble);
                        }
                        else if (strcmp(msg.payload.text, "close") == 0)
                        {
                            lv_img_set_src(global_img_ble, &ble_close);
                        }
                    }
                    break;
                case UI_MSG_TTS_OUTPUT:
                    if(msg.payload.text[0] != '\0')
                    {
                         int len = strlen(msg.payload.text);
                        rt_kprintf("len == %d\n", len);

                        if (len > SHOW_TEXT_LEN) {
                            // 查看 SHOW_TEXT_LEN 是否落在一个多字节字符中间
                            int cut_pos = SHOW_TEXT_LEN;

                            // 向前调整到完整的 UTF-8 字符起点
                            while (cut_pos > 0 &&
                                   ((unsigned char)msg.payload.text[cut_pos] & 0xC0) == 0x80) {
                                cut_pos--;
                            }

                            if (cut_pos == 0) // 找不到合适的截断点，直接截断
                                cut_pos = SHOW_TEXT_LEN;

                            // 截取第一部分
                            char first_part[SHOW_TEXT_LEN + 1];
                            strncpy(first_part, msg.payload.text, cut_pos);
                            first_part[cut_pos] = '\0'; // 确保字符串结束

                            // 剩余部分从 cut_pos 开始
                            strncpy(g_second_part, msg.payload.text + cut_pos, sizeof(g_second_part) - 1);
                            g_second_part[sizeof(g_second_part) - 1] = '\0'; // 确保结尾
                            g_label_for_second_part = global_label2;

                            lv_label_set_text(global_label2, first_part);
#ifdef BSP_USING_PM
                            lv_display_trigger_activity(NULL);
#endif // BSP_USING_PM

                            // 创建定时器
                            if (!g_split_text_timer) {
                                g_split_text_timer = rt_timer_create(
                                    "next_text", switch_to_second_part, NULL,
                                    rt_tick_from_millisecond(7000), // 6.5秒后显示下一部分
                                    RT_TIMER_FLAG_ONE_SHOT | RT_TIMER_FLAG_SOFT_TIMER);
                            } else {
                                rt_timer_stop(g_split_text_timer);
                            }
                            rt_timer_start(g_split_text_timer);
                        } 
                        else 
                        {
                            lv_label_set_text(global_label2, msg.payload.text);
                        }
                    }
                    break;
                case UI_MSG_TTS_SWITCH_PART:
                    if (g_label_for_second_part && strlen(g_second_part) > 0) {
                        int len = strlen(g_second_part);
                        if (len > SHOW_TEXT_LEN) {
                            // 再次分割文本
                            char first_part[SHOW_TEXT_LEN + 1];
                            char remaining[512];

                            // 查找合适的截断点
                            int cut_pos = SHOW_TEXT_LEN;
                            while (cut_pos > 0 &&
                                ((unsigned char)g_second_part[cut_pos] & 0xC0) == 0x80) {
                                cut_pos--;
                            }

                            strncpy(first_part, g_second_part, cut_pos);
                            first_part[cut_pos] = '\0';

                            strncpy(remaining, g_second_part + cut_pos, sizeof(remaining) - 1);
                            remaining[sizeof(remaining) - 1] = '\0';

                            // 显示当前部分
                            lv_label_set_text(g_label_for_second_part, first_part);

                            // 保存剩余部分
                            strncpy(g_second_part, remaining, sizeof(g_second_part) - 1);
                            g_second_part[sizeof(g_second_part) - 1] = '\0';

                            // 重置定时器以显示下一部分
                            rt_timer_control(g_split_text_timer, RT_TIMER_CTRL_SET_TIME,
                                            &(rt_tick_t){rt_tick_from_millisecond(7000)});
                            rt_timer_start(g_split_text_timer);
                        } else {
                            // 最后一部分，直接显示
                            lv_label_set_text(g_label_for_second_part, g_second_part);
                            memset(g_second_part, 0, sizeof(g_second_part));
                            g_label_for_second_part = NULL;
                        }
                        
                    }
                    break;
                case UI_MSG_SHOW_UPDATE_CONFIRM:
                {
                    BOOL needs_update = msg.payload.bool_value;
                        LOG_D("UI_MSG_SHOW_UPDATE_CONFIRM\n");

                        // 显示弹框
                    if (update_confirm_popup)
                    {
                        lv_obj_remove_flag(update_confirm_popup,
                                        LV_OBJ_FLAG_HIDDEN);
                        }
                        
                        // 根据是否有更新设置弹框内容
                    if (needs_update)
                    {
                            LOG_D("UI_MSG_SHOW_UPDATE_CONFIRM: needs_update\n");
                            // 如果有新版本，显示更新提示和按钮
                        if (update_confirm_label)
                        {
                            char update_text[32];
                            snprintf(update_text, sizeof(update_text),
                                    "发现新版本%s", latest_version);
                            lv_label_set_text(update_confirm_label,
                                            update_text);
                            }
                        if (update_button)
                        {
                            lv_obj_remove_flag(update_button,
                                            LV_OBJ_FLAG_HIDDEN);
                        }
                    }
                    else
                    {
                            LOG_D("UI_MSG_SHOW_UPDATE_CONFIRM: no update\n");    
                            // 如果没有新版本，显示无需更新提示并隐藏更新按钮
                        if (update_confirm_label)
                        {
                            lv_label_set_text(update_confirm_label,
                                            "当前已是最新版本");
                            }
                        if (update_button)
                        {
                            lv_obj_add_flag(update_button,
                                            LV_OBJ_FLAG_HIDDEN); // 隐藏更新按钮
                        }
                    }
                    break;
                }
                case UI_MSG_UPDATE_LATEST_VERSION:
                    if (msg.payload.text[0] != '\0' && latest_version_label)
                    {
                        lv_label_set_text(latest_version_label, msg.payload.text);

                        // 显示版本提示弹框
                        if (update_confirm_popup)
                        {
                            char update_text[32];
                            snprintf(update_text, sizeof(update_text),
                                    "发现新版本%s", msg.payload.text);
                            lv_label_set_text(update_confirm_label, update_text);
                            lv_obj_remove_flag(update_confirm_popup,
                                            LV_OBJ_FLAG_HIDDEN);
                        }
                    }
                    break;
                case UI_MSG_REINIT_AUDIO:
                    rt_kprintf("UI thread: reinitializing audio\n");
                    reinit_audio();
                    break;
                case UI_MSG_TRIGGER_ACTIVITY:
#ifdef BSP_USING_PM
                    lv_display_trigger_activity(NULL);
#endif
                    break;
                case UI_MSG_START_SLEEP_TIMER:
                    ui_restart_sleep_timer((rt_uint32_t)msg.payload.int_value);
                    break;
                case UI_MSG_CONFIRM_BUTTON_EVENT: 
                {
                    // 从消息数据中获取按钮类型
                    BOOL is_update_button = msg.payload.bool_value;
                    // 检查弹框是否已创建且可见
                    if (update_confirm_popup && !lv_obj_has_flag(update_confirm_popup, LV_OBJ_FLAG_HIDDEN))
                    {
                        if (is_update_button)
                        {
                            // 模拟点击更新按钮
                            if (update_button &&
                                !lv_obj_has_flag(update_button, LV_OBJ_FLAG_HIDDEN))
                            {
                                lv_obj_send_event(update_button, LV_EVENT_CLICKED, NULL);
                            }
                        }
                        else
                        {
                            // 模拟点击取消按钮
                            if (cancel_button)
                            {
                                lv_obj_send_event(cancel_button, LV_EVENT_CLICKED,
                                                NULL);
                            }
                        }
                    }
                    break;
                }
            }
        }
        if (RT_EOK == rt_sem_trytake(&update_ui_sema))
        {
            lv_obj_t *xiaozhi_screen_obj = NULL;
            rt_bool_t is_xiaozhi_screen = RT_FALSE;
            ms = lv_task_handler();
            switch_anim_timeout_check();

            char *current_text = lv_label_get_text(global_label1);
            lv_obj_t *current_screen = lv_screen_active();
            if (main_container)
            {
                xiaozhi_screen_obj = lv_obj_get_screen(main_container);
                is_xiaozhi_screen = (current_screen == xiaozhi_screen_obj);
            }

            //rt_kprintf("current_screen: %p, main_container: %p\n", current_screen, main_container);
            //rt_kprintf("inactive_time: %d, limit: %d\n", lv_display_get_inactive_time(NULL), IDLE_TIME_LIMIT);
            if (lv_display_get_inactive_time(NULL) > IDLE_TIME_LIMIT &&
                is_xiaozhi_screen &&
                g_pan_connected)
            {

                rt_kprintf("listen_tick\n");
                last_listen_tick= 1;
                lv_display_trigger_activity(NULL);
            }
            // 低功耗判断
#ifdef XIAOZHI_USING_MQTT
            if (mqtt_g_state == kDeviceStateUnknown && last_listen_tick > 0 && g_pan_connected && she_bei_ma)
#else
            if (g_xz_ws.is_connected == 0 && last_listen_tick > 0 && g_pan_connected && she_bei_ma)
#endif  
            {
                rt_tick_t now = rt_tick_get();
                rt_tick_t delta = now - last_listen_tick;
                rt_kprintf("last_listen_tick: %d, now: %d, delta: %d\n", last_listen_tick, now, delta);
                if (delta < rt_tick_from_millisecond(12000))
                {
                    LOG_I("Websocket disconnected, entering low power mode");
                    lv_display_trigger_activity(NULL);
                    if(thiz->vad_enabled)
                    {
                        thiz->vad_enabled = false;
                        rt_kprintf("in zudon_PM,so vad_close\n");
                        xz_aec_mic_close(thiz);
                    }
                    bt_interface_wr_link_policy_setting(
                    (unsigned char *)&g_bt_app_env.bd_addr,
                    BT_NOTIFY_LINK_POLICY_SNIFF_MODE | BT_NOTIFY_LINK_POLICY_ROLE_SWITCH); // open role switch
                    MCP_RGBLED_CLOSE(); 
                    show_sleep_countdown_and_sleep();
                    
                    if(aec_enabled) 
                    {
                        kws_demo();
                    }                  
                }
                if (delta > rt_tick_from_millisecond(12000))
                {
                    LOG_I("30s no action \n");
                    lv_display_trigger_activity(NULL);
                    bt_interface_wr_link_policy_setting(
                    (unsigned char *)&g_bt_app_env.bd_addr,
                    BT_NOTIFY_LINK_POLICY_SNIFF_MODE | BT_NOTIFY_LINK_POLICY_ROLE_SWITCH); // open role switch
                    MCP_RGBLED_CLOSE();
                    rt_kprintf("time out,xiu_mian\n");
                    if (standby_screen) 
                    {
                        LOG_I("休眠->待机\n");
                        ui_swith_to_standby_screen();

                    }
                }
                last_listen_tick = 0;
            }
            if (gui_is_force_close())
            {
                LOG_I("in force_close");
                bool lcd_drawing;
                rt_device_control(lcd_device, RTGRAPHIC_CTRL_GET_BUSY,
                                  &lcd_drawing);
                if (!lcd_drawing)
                {
                    LOG_I("no input:%d", lv_display_get_inactive_time(NULL));
                    gui_suspend();
                    LOG_I("ui resume");
                    /* force screen to redraw */
                    lv_obj_invalidate(lv_screen_active());
                    /* reset activity timer */
                    lv_display_trigger_activity(NULL);
                }
            }

            rt_thread_mdelay(ms);
            rt_sem_release(&update_ui_sema);
        }
    }
}
