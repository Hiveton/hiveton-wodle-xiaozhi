#include "ui/home/home_screen.h"

#define HOME_DESIGN_W 528
#define HOME_DESIGN_H 792

extern const lv_image_dsc_t home_ai;
extern const lv_image_dsc_t home_music;
extern const lv_image_dsc_t home_reading;
extern const lv_image_dsc_t home_record;
extern const lv_image_dsc_t home_calendar;
extern const lv_image_dsc_t home_settings;
extern const lv_image_dsc_t home_weather;
extern const lv_image_dsc_t home_clock;
extern const lv_image_dsc_t home_pet;
extern const lv_image_dsc_t home_mic;
extern const lv_image_dsc_t home_volume;
extern const lv_image_dsc_t home_signal;
extern const lv_image_dsc_t home_bluetooth;
extern const lv_image_dsc_t home_battery;
extern const lv_image_dsc_t cdian2;

static lv_coord_t scale_x(lv_coord_t screen_w, lv_coord_t value)
{
    return (lv_coord_t)((value * screen_w + HOME_DESIGN_W / 2) / HOME_DESIGN_W);
}

static lv_coord_t scale_y(lv_coord_t screen_h, lv_coord_t value)
{
    return (lv_coord_t)((value * screen_h + HOME_DESIGN_H / 2) / HOME_DESIGN_H);
}

static lv_obj_t *create_plain_container(lv_obj_t *parent,
                                        lv_coord_t x,
                                        lv_coord_t y,
                                        lv_coord_t w,
                                        lv_coord_t h)
{
    lv_obj_t *obj = lv_obj_create(parent);
    lv_obj_remove_flag(obj, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_pos(obj, x, y);
    lv_obj_set_size(obj, w, h);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_border_width(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_0, 0);
    lv_obj_set_style_pad_all(obj, 0, 0);
    return obj;
}

static lv_obj_t *create_status_icon(lv_obj_t *parent,
                                    const lv_image_dsc_t *icon,
                                    lv_coord_t zoom)
{
    lv_obj_t *img = lv_img_create(parent);
    lv_img_set_src(img, icon);
    lv_img_set_zoom(img, zoom);
    return img;
}

static lv_obj_t *create_grid_item(lv_obj_t *parent,
                                  const lv_image_dsc_t *icon,
                                  const char *text,
                                  lv_font_t *label_font,
                                  lv_coord_t icon_zoom,
                                  lv_coord_t icon_top,
                                  lv_coord_t label_bottom,
                                  lv_obj_t **icon_out)
{
    lv_obj_t *cell = create_plain_container(parent, 0, 0, 0, 0);
    lv_obj_t *icon_obj = lv_img_create(cell);
    lv_obj_t *label_obj = lv_label_create(cell);

    lv_img_set_src(icon_obj, icon);
    lv_img_set_zoom(icon_obj, icon_zoom);
    lv_obj_align(icon_obj, LV_ALIGN_TOP_MID, 0, icon_top);

    lv_label_set_text(label_obj, text);
    lv_obj_set_width(label_obj, LV_PCT(100));
    lv_obj_set_style_text_color(label_obj, lv_color_black(), 0);
    lv_obj_set_style_text_align(label_obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_set_style_text_letter_space(label_obj, 0, 0);
    lv_obj_set_style_text_line_space(label_obj, 0, 0);
    if (label_font)
    {
        lv_obj_set_style_text_font(label_obj, label_font, 0);
    }
    lv_obj_align(label_obj, LV_ALIGN_BOTTOM_MID, 0, -label_bottom);

    if (icon_out)
    {
        *icon_out = icon_obj;
    }

    return cell;
}

rt_err_t xiaozhi_home_screen_create(const xiaozhi_home_screen_config_t *config,
                                    xiaozhi_home_screen_refs_t *refs)
{
    lv_coord_t screen_w;
    lv_coord_t screen_h;
    lv_coord_t separator_y;
    lv_coord_t time_x;
    lv_coord_t time_y;
    lv_coord_t meta_w;
    lv_coord_t meta_h;
    lv_coord_t meta_y;
    lv_coord_t grid_left;
    lv_coord_t grid_top;
    lv_coord_t cell_w;
    lv_coord_t cell_h;
    lv_coord_t col_gap;
    lv_coord_t row_gap;
    lv_coord_t icon_top;
    lv_coord_t label_bottom;
    lv_coord_t status_icon_zoom;
    lv_coord_t status_icon_y;
    lv_coord_t status_gap;
    lv_coord_t battery_text_w;
    lv_coord_t battery_text_y;
    lv_coord_t battery_right_pad;
    lv_coord_t battery_gap;
    lv_obj_t *screen;
    lv_obj_t *separator;
    lv_obj_t *meta_wrap;
    lv_obj_t *battery_icon;
    lv_obj_t *signal_icon;
    lv_obj_t *bt_icon;
    lv_obj_t *volume_icon;
    lv_obj_t *mic_icon;
    lv_obj_t *cell;
    lv_obj_t *weather_icon = NULL;
    lv_font_t *time_font;
    lv_font_t *meta_font;
    lv_font_t *label_font;
    lv_font_t *status_font;

    if (!config || !refs)
    {
        return -RT_EINVAL;
    }

    *refs = (xiaozhi_home_screen_refs_t){0};

    screen_w = lv_disp_get_hor_res(NULL);
    screen_h = lv_disp_get_ver_res(NULL);
    time_font = config->time_font;
    meta_font = config->meta_font;
    label_font = config->label_font;
    status_font = config->status_font;

    separator_y = scale_y(screen_h, 60);
    time_x = scale_x(screen_w, 18);
    time_y = scale_y(screen_h, 8);
    meta_w = scale_x(screen_w, 164);
    meta_h = scale_y(screen_h, 44);
    meta_y = scale_y(screen_h, 4);
    grid_left = scale_x(screen_w, 36);
    grid_top = scale_y(screen_h, 106);
    cell_w = scale_x(screen_w, 126);
    cell_h = scale_y(screen_h, 182);
    col_gap = scale_x(screen_w, 41);
    row_gap = scale_y(screen_h, 22);
    icon_top = scale_y(screen_h, 18);
    label_bottom = scale_y(screen_h, 16);
    status_icon_zoom = 104;
    status_icon_y = scale_y(screen_h, 11);
    status_gap = scale_x(screen_w, 10);
    battery_text_w = scale_x(screen_w, 50);
    battery_text_y = scale_y(screen_h, 7);
    battery_right_pad = scale_x(screen_w, 8);
    battery_gap = scale_x(screen_w, 8);

    screen = lv_obj_create(NULL);
    lv_obj_clear_flag(screen, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_style_radius(screen, 0, 0);
    lv_obj_set_style_border_width(screen, 0, 0);
    lv_obj_set_style_pad_all(screen, 0, 0);
    lv_obj_set_style_bg_color(screen, lv_color_white(), 0);
    refs->screen = screen;

    refs->time_label = lv_label_create(screen);
    lv_label_set_text(refs->time_label, "00:00");
    lv_obj_set_style_text_color(refs->time_label, lv_color_black(), 0);
    if (time_font)
    {
        lv_obj_set_style_text_font(refs->time_label, time_font, 0);
    }
    lv_obj_set_pos(refs->time_label, time_x, time_y);

    meta_wrap = create_plain_container(screen,
                                       (screen_w - meta_w) / 2,
                                       meta_y,
                                       meta_w,
                                       meta_h);

    refs->meta_label = lv_label_create(meta_wrap);
    lv_label_set_text(refs->meta_label, "0000/00/00\n星期一 --°C");
    lv_obj_set_width(refs->meta_label, LV_PCT(100));
    lv_obj_set_style_text_color(refs->meta_label, lv_color_black(), 0);
    lv_obj_set_style_text_align(refs->meta_label, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_set_style_text_letter_space(refs->meta_label, 0, 0);
    lv_obj_set_style_text_line_space(refs->meta_label, 0, 0);
    if (meta_font)
    {
        lv_obj_set_style_text_font(refs->meta_label, meta_font, 0);
    }
    lv_obj_center(refs->meta_label);

    refs->battery_percent_label = lv_label_create(screen);
    lv_label_set_text_fmt(refs->battery_percent_label, "%d%%", config->battery_level);
    lv_obj_set_width(refs->battery_percent_label, battery_text_w);
    lv_obj_set_style_text_color(refs->battery_percent_label, lv_color_black(), 0);
    lv_obj_set_style_text_align(refs->battery_percent_label, LV_TEXT_ALIGN_RIGHT, 0);
    lv_obj_set_style_text_letter_space(refs->battery_percent_label, 0, 0);
    if (status_font)
    {
        lv_obj_set_style_text_font(refs->battery_percent_label, status_font, 0);
    }
    lv_obj_align(refs->battery_percent_label, LV_ALIGN_TOP_RIGHT, -battery_right_pad, battery_text_y);

    battery_icon = create_status_icon(screen, &home_battery, status_icon_zoom);
    lv_obj_set_pos(battery_icon,
                   lv_obj_get_x(refs->battery_percent_label) - lv_obj_get_width(battery_icon) - battery_gap,
                   status_icon_y + scale_y(screen_h, 1));

    refs->standby_charging_icon = lv_img_create(screen);
    lv_img_set_src(refs->standby_charging_icon, &cdian2);
    lv_img_set_zoom(refs->standby_charging_icon, status_icon_zoom);
    lv_obj_set_pos(refs->standby_charging_icon,
                   lv_obj_get_x(battery_icon),
                   lv_obj_get_y(battery_icon));
    lv_obj_add_flag(refs->standby_charging_icon, LV_OBJ_FLAG_HIDDEN);

    signal_icon = create_status_icon(screen, &home_signal, status_icon_zoom);
    lv_obj_set_pos(signal_icon,
                   lv_obj_get_x(battery_icon) - lv_obj_get_width(signal_icon) - status_gap,
                   status_icon_y + scale_y(screen_h, 5));

    bt_icon = create_status_icon(screen, &home_bluetooth, status_icon_zoom);
    lv_obj_set_pos(bt_icon,
                   lv_obj_get_x(signal_icon) - lv_obj_get_width(bt_icon) - status_gap,
                   status_icon_y);

    volume_icon = create_status_icon(screen, &home_volume, status_icon_zoom);
    lv_obj_set_pos(volume_icon,
                   lv_obj_get_x(bt_icon) - lv_obj_get_width(volume_icon) - status_gap,
                   status_icon_y + scale_y(screen_h, 1));

    mic_icon = create_status_icon(screen, &home_mic, status_icon_zoom);
    lv_obj_set_pos(mic_icon,
                   lv_obj_get_x(volume_icon) - lv_obj_get_width(mic_icon) - status_gap,
                   status_icon_y);

    separator = lv_obj_create(screen);
    lv_obj_remove_flag(separator, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_size(separator, screen_w, 1);
    lv_obj_set_pos(separator, 0, separator_y);
    lv_obj_set_style_radius(separator, 0, 0);
    lv_obj_set_style_border_width(separator, 0, 0);
    lv_obj_set_style_bg_color(separator, lv_color_black(), 0);
    lv_obj_set_style_pad_all(separator, 0, 0);

    cell = create_grid_item(screen, &home_reading, "阅读", label_font, 172, icon_top, label_bottom, NULL);
    lv_obj_set_pos(cell, grid_left, grid_top);
    lv_obj_set_size(cell, cell_w, cell_h);

    cell = create_grid_item(screen, &home_pet, "宠物管理", label_font, 172, icon_top, label_bottom, NULL);
    lv_obj_set_pos(cell, grid_left + cell_w + col_gap, grid_top);
    lv_obj_set_size(cell, cell_w, cell_h);

    cell = create_grid_item(screen, &home_ai, "AI小豆", label_font, 172, icon_top, label_bottom, NULL);
    lv_obj_set_pos(cell, grid_left + (cell_w + col_gap) * 2, grid_top);
    lv_obj_set_size(cell, cell_w, cell_h);

    cell = create_grid_item(screen, &home_clock, "时间管理", label_font, 172, icon_top, label_bottom, NULL);
    lv_obj_set_pos(cell, grid_left, grid_top + cell_h + row_gap);
    lv_obj_set_size(cell, cell_w, cell_h);

    cell = create_grid_item(screen, &home_weather, "天气", label_font, 172, icon_top, label_bottom, &weather_icon);
    lv_obj_set_pos(cell, grid_left + cell_w + col_gap, grid_top + cell_h + row_gap);
    lv_obj_set_size(cell, cell_w, cell_h);

    cell = create_grid_item(screen, &home_calendar, "日历日程", label_font, 172, icon_top, label_bottom, NULL);
    lv_obj_set_pos(cell, grid_left + (cell_w + col_gap) * 2, grid_top + cell_h + row_gap);
    lv_obj_set_size(cell, cell_w, cell_h);

    cell = create_grid_item(screen, &home_record, "录音", label_font, 172, icon_top, label_bottom, NULL);
    lv_obj_set_pos(cell, grid_left, grid_top + (cell_h + row_gap) * 2);
    lv_obj_set_size(cell, cell_w, cell_h);

    cell = create_grid_item(screen, &home_music, "音乐", label_font, 172, icon_top, label_bottom, NULL);
    lv_obj_set_pos(cell, grid_left + cell_w + col_gap, grid_top + (cell_h + row_gap) * 2);
    lv_obj_set_size(cell, cell_w, cell_h);

    cell = create_grid_item(screen, &home_settings, "设置", label_font, 172, icon_top, label_bottom, NULL);
    lv_obj_set_pos(cell, grid_left + (cell_w + col_gap) * 2, grid_top + (cell_h + row_gap) * 2);
    lv_obj_set_size(cell, cell_w, cell_h);

    refs->weather_icon = weather_icon;
    refs->img_emoji = NULL;
    refs->hour_tens_img = NULL;
    refs->hour_units_img = NULL;
    refs->minute_tens_img = NULL;
    refs->minute_units_img = NULL;
    refs->bluetooth_icon = NULL;
    refs->network_icon = NULL;
    refs->battery_arc = NULL;
    refs->ui_Label_ip = NULL;
    refs->last_time = NULL;
    refs->ui_Image_calendar = NULL;
    refs->ui_Label_year = NULL;
    refs->ui_Label_day = NULL;
    refs->ui_Label_second = NULL;
    refs->ui_Image_second = NULL;
    refs->ui_Label3 = NULL;

    return RT_EOK;
}
