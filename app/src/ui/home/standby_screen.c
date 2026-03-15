#include "ui/home/standby_screen.h"

#define STANDBY_DESIGN_W 528
#define STANDBY_DESIGN_H 792
#define TOMATO_SOURCE_SIZE 220

extern const lv_image_dsc_t ble_icon_img_close;
extern const lv_image_dsc_t cdian2;
extern const lv_image_dsc_t network_icon_img_close;
extern const lv_image_dsc_t standby_tomato;

static lv_coord_t scale_x(lv_coord_t screen_w, lv_coord_t value)
{
    return (lv_coord_t)((value * screen_w + STANDBY_DESIGN_W / 2) / STANDBY_DESIGN_W);
}

static lv_coord_t scale_y(lv_coord_t screen_h, lv_coord_t value)
{
    return (lv_coord_t)((value * screen_h + STANDBY_DESIGN_H / 2) / STANDBY_DESIGN_H);
}

static lv_coord_t zoom_for_size(lv_coord_t target_size, lv_coord_t source_size)
{
    if (target_size <= 0 || source_size <= 0)
    {
        return 256;
    }

    return (lv_coord_t)((target_size * 256 + source_size / 2) / source_size);
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
    lv_obj_set_style_bg_color(obj, lv_color_white(), 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_COVER, 0);
    lv_obj_set_style_pad_all(obj, 0, 0);
    return obj;
}

static void set_label_font(lv_obj_t *label, lv_font_t *font)
{
    if (font)
    {
        lv_obj_set_style_text_font(label, font, 0);
    }
}

static lv_obj_t *create_text_label(lv_obj_t *parent,
                                   const char *text,
                                   lv_font_t *font,
                                   lv_color_t color,
                                   lv_text_align_t align,
                                   lv_coord_t width)
{
    lv_obj_t *label = lv_label_create(parent);

    if (text)
    {
        lv_label_set_text(label, text);
    }

    if (width > 0)
    {
        lv_obj_set_width(label, width);
    }

    lv_label_set_long_mode(label, LV_LABEL_LONG_CLIP);
    lv_obj_set_style_text_color(label, color, 0);
    lv_obj_set_style_text_align(label, align, 0);
    lv_obj_set_style_text_letter_space(label, 0, 0);
    lv_obj_set_style_text_line_space(label, 0, 0);
    set_label_font(label, font);
    return label;
}

static lv_obj_t *create_image_obj(lv_obj_t *parent,
                                  const lv_image_dsc_t *src,
                                  lv_coord_t zoom)
{
    lv_obj_t *img = lv_img_create(parent);
    lv_img_set_src(img, src);
    lv_img_set_zoom(img, zoom);
    return img;
}

static void hide_obj(lv_obj_t *obj)
{
    if (obj)
    {
        lv_obj_add_flag(obj, LV_OBJ_FLAG_HIDDEN);
    }
}

rt_err_t xiaozhi_standby_screen_create(const xiaozhi_home_screen_config_t *config,
                                       xiaozhi_home_screen_refs_t *refs)
{
    lv_coord_t screen_w;
    lv_coord_t screen_h;
    lv_coord_t left_pad;
    lv_coord_t info_w;
    lv_coord_t date_y;
    lv_coord_t lunar_y;
    lv_coord_t weekday_y;
    lv_coord_t weather_y;
    lv_coord_t clock_y;
    lv_coord_t clock_w;
    lv_coord_t clock_h;
    lv_coord_t second_slot_w;
    lv_coord_t tomato_size;
    lv_coord_t tomato_y;
    lv_coord_t status_zoom;
    lv_font_t *clock_font;
    lv_font_t *date_font;
    lv_font_t *info_font;
    lv_font_t *weather_font;
    lv_font_t *hidden_font;
    lv_obj_t *screen;
    lv_obj_t *clock_wrap;

    if (!config || !refs)
    {
        return -RT_EINVAL;
    }

    *refs = (xiaozhi_home_screen_refs_t){0};

    screen_w = lv_disp_get_hor_res(NULL);
    screen_h = lv_disp_get_ver_res(NULL);
    left_pad = scale_x(screen_w, 24);
    info_w = screen_w - left_pad * 2;
    date_y = scale_y(screen_h, 22);
    lunar_y = scale_y(screen_h, 85);
    weekday_y = scale_y(screen_h, 144);
    weather_y = scale_y(screen_h, 203);
    clock_y = scale_y(screen_h, 280);
    clock_w = scale_x(screen_w, 420);
    clock_h = scale_y(screen_h, 132);
    second_slot_w = scale_x(screen_w, 72);
    tomato_size = scale_x(screen_w, 136);
    tomato_y = scale_y(screen_h, 570);
    status_zoom = 96;

    clock_font = config->time_font;
    date_font = config->label_font ? config->label_font : config->meta_font;
    info_font = config->meta_font ? config->meta_font : date_font;
    weather_font = config->status_font ? config->status_font : info_font;
    hidden_font = config->battery_font ? config->battery_font : weather_font;

    screen = lv_obj_create(NULL);
    lv_obj_clear_flag(screen, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_style_radius(screen, 0, 0);
    lv_obj_set_style_border_width(screen, 0, 0);
    lv_obj_set_style_pad_all(screen, 0, 0);
    lv_obj_set_style_bg_color(screen, lv_color_white(), 0);
    refs->screen = screen;

    refs->ui_Label_year = create_text_label(screen,
                                            "2026/01/17",
                                            date_font,
                                            lv_color_black(),
                                            LV_TEXT_ALIGN_LEFT,
                                            info_w);
    lv_obj_set_pos(refs->ui_Label_year, left_pad, date_y);

    refs->ui_Label_lunar = create_text_label(screen,
                                             "乙巳年 十一月廿六",
                                             info_font,
                                             lv_color_black(),
                                             LV_TEXT_ALIGN_LEFT,
                                             info_w);
    lv_obj_set_pos(refs->ui_Label_lunar, left_pad, lunar_y);

    refs->ui_Label_day = create_text_label(screen,
                                           "星期六",
                                           info_font,
                                           lv_color_black(),
                                           LV_TEXT_ALIGN_LEFT,
                                           info_w);
    lv_obj_set_pos(refs->ui_Label_day, left_pad, weekday_y);

    refs->ui_Label_ip = create_text_label(screen,
                                          "23°C 晴",
                                          weather_font,
                                          lv_color_black(),
                                          LV_TEXT_ALIGN_LEFT,
                                          info_w);
    lv_obj_set_pos(refs->ui_Label_ip, left_pad, weather_y);

    clock_wrap = create_plain_container(screen,
                                        (screen_w - clock_w) / 2,
                                        clock_y,
                                        clock_w,
                                        clock_h);

    refs->time_label = create_text_label(clock_wrap,
                                         "18:30",
                                         clock_font,
                                         lv_color_black(),
                                         LV_TEXT_ALIGN_CENTER,
                                         clock_w - second_slot_w);
    lv_obj_align(refs->time_label, LV_ALIGN_LEFT_MID, 0, 0);

    refs->hour_tens_img = NULL;
    refs->hour_units_img = NULL;
    refs->minute_tens_img = NULL;
    refs->minute_units_img = NULL;
    refs->ui_Image_second = NULL;
    refs->ui_Label_second = create_text_label(clock_wrap,
                                              "00",
                                              info_font,
                                              lv_color_black(),
                                              LV_TEXT_ALIGN_RIGHT,
                                              second_slot_w);
    lv_obj_align(refs->ui_Label_second,
                 LV_ALIGN_BOTTOM_RIGHT,
                 0,
                 -scale_y(screen_h, 10));

    refs->battery_percent_label = create_text_label(screen,
                                                    "100%",
                                                    hidden_font,
                                                    lv_color_black(),
                                                    LV_TEXT_ALIGN_RIGHT,
                                                    scale_x(screen_w, 64));
    lv_obj_align(refs->battery_percent_label, LV_ALIGN_TOP_RIGHT, -left_pad, date_y);
    hide_obj(refs->battery_percent_label);

    refs->standby_charging_icon = create_image_obj(screen, &cdian2, status_zoom);
    lv_obj_align_to(refs->standby_charging_icon,
                    refs->battery_percent_label,
                    LV_ALIGN_OUT_LEFT_MID,
                    -scale_x(screen_w, 6),
                    0);
    hide_obj(refs->standby_charging_icon);

    refs->network_icon = create_image_obj(screen, &network_icon_img_close, status_zoom);
    lv_obj_align_to(refs->network_icon,
                    refs->standby_charging_icon,
                    LV_ALIGN_OUT_LEFT_MID,
                    -scale_x(screen_w, 6),
                    0);
    hide_obj(refs->network_icon);

    refs->bluetooth_icon = create_image_obj(screen, &ble_icon_img_close, status_zoom);
    lv_obj_align_to(refs->bluetooth_icon,
                    refs->network_icon,
                    LV_ALIGN_OUT_LEFT_MID,
                    -scale_x(screen_w, 6),
                    0);
    hide_obj(refs->bluetooth_icon);

    refs->last_time = create_text_label(screen,
                                        "",
                                        hidden_font,
                                        lv_color_black(),
                                        LV_TEXT_ALIGN_LEFT,
                                        scale_x(screen_w, 80));
    lv_obj_set_pos(refs->last_time, scale_x(screen_w, 12), scale_y(screen_h, 48));
    hide_obj(refs->last_time);

    refs->meta_label = NULL;
    refs->img_emoji = NULL;
    refs->battery_arc = NULL;
    refs->weather_icon = NULL;
    refs->ui_Image_calendar = NULL;
    refs->ui_Label3 = create_text_label(screen,
                                        "",
                                        hidden_font,
                                        lv_color_black(),
                                        LV_TEXT_ALIGN_LEFT,
                                        scale_x(screen_w, 120));
    lv_obj_set_pos(refs->ui_Label3, scale_x(screen_w, 12), scale_y(screen_h, 84));
    hide_obj(refs->ui_Label3);

    lv_obj_t *tomato_img = create_image_obj(screen,
                                            &standby_tomato,
                                            zoom_for_size(tomato_size, TOMATO_SOURCE_SIZE));
    lv_obj_align(tomato_img, LV_ALIGN_TOP_MID, 0, tomato_y);

    return RT_EOK;
}
