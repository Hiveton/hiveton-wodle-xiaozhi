#ifndef XIAOZHI_HOME_SCREEN_H
#define XIAOZHI_HOME_SCREEN_H

#include <stdbool.h>
#include "rtthread.h"
#include "lvgl.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{
    XIAOZHI_HOME_TILE_READING = 0,
    XIAOZHI_HOME_TILE_PET,
    XIAOZHI_HOME_TILE_AI,
    XIAOZHI_HOME_TILE_CLOCK,
    XIAOZHI_HOME_TILE_WEATHER,
    XIAOZHI_HOME_TILE_CALENDAR,
    XIAOZHI_HOME_TILE_RECORD,
    XIAOZHI_HOME_TILE_MUSIC,
    XIAOZHI_HOME_TILE_SETTINGS,
} xiaozhi_home_tile_t;

typedef struct
{
    float scale;
    int battery_level;
    lv_font_t *time_font;
    lv_font_t *meta_font;
    lv_font_t *label_font;
    lv_font_t *status_font;
    lv_style_t *title_style;
    lv_style_t *body_style;
    lv_font_t *battery_font;
    lv_event_cb_t header_event_cb;
    lv_event_cb_t tile_event_cb;
    bool enable_header_event;
    bool enable_tile_event;
} xiaozhi_home_screen_config_t;

typedef struct
{
    lv_obj_t *screen;
    lv_obj_t *time_label;
    lv_obj_t *meta_label;
    lv_obj_t *img_emoji;
    lv_obj_t *hour_tens_img;
    lv_obj_t *hour_units_img;
    lv_obj_t *minute_tens_img;
    lv_obj_t *minute_units_img;
    lv_obj_t *bluetooth_icon;
    lv_obj_t *network_icon;
    lv_obj_t *battery_arc;
    lv_obj_t *battery_percent_label;
    lv_obj_t *standby_charging_icon;
    lv_obj_t *weather_icon;
    lv_obj_t *ui_Label_ip;
    lv_obj_t *last_time;
    lv_obj_t *ui_Image_calendar;
    lv_obj_t *ui_Label_year;
    lv_obj_t *ui_Label_lunar;
    lv_obj_t *ui_Label_day;
    lv_obj_t *ui_Label_second;
    lv_obj_t *ui_Image_second;
    lv_obj_t *ui_Label3;
} xiaozhi_home_screen_refs_t;

rt_err_t xiaozhi_home_screen_create(const xiaozhi_home_screen_config_t *config,
                                    xiaozhi_home_screen_refs_t *refs);

#ifdef __cplusplus
}
#endif

#endif
