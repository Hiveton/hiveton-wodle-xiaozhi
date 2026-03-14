#include "ui/home/home_screen.h"

#define HOME_DESIGN_W 390
#define HOME_DESIGN_H 450
#define HOME_GRID_COLS 3
#define HOME_GRID_ROWS 3

extern const lv_image_dsc_t home_ai;
extern const lv_image_dsc_t home_music;
extern const lv_image_dsc_t home_reading;
extern const lv_image_dsc_t home_record;
extern const lv_image_dsc_t home_calendar;
extern const lv_image_dsc_t home_settings;
extern const lv_image_dsc_t home_weather;
extern const lv_image_dsc_t home_clock;
extern const lv_image_dsc_t home_pet;
extern const lv_image_dsc_t cdian2;
extern const lv_image_dsc_t ble_icon_img_close;
extern const lv_image_dsc_t network_icon_img_close;

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

static void set_label_font(lv_obj_t *label, lv_font_t *font)
{
    if (font)
    {
        lv_obj_set_style_text_font(label, font, 0);
    }
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
                                  lv_coord_t icon_y,
                                  lv_coord_t label_y,
                                  lv_coord_t label_w,
                                  lv_obj_t **icon_out)
{
    lv_obj_t *cell = create_plain_container(parent, 0, 0, 0, 0);
    lv_obj_t *icon_obj = lv_img_create(cell);
    lv_obj_t *label_obj = lv_label_create(cell);

    lv_img_set_src(icon_obj, icon);
    lv_img_set_zoom(icon_obj, icon_zoom);
    lv_obj_align(icon_obj, LV_ALIGN_TOP_MID, 0, icon_y);

    lv_label_set_text(label_obj, text);
    lv_label_set_long_mode(label_obj, LV_LABEL_LONG_WRAP);
    lv_obj_set_width(label_obj, label_w);
    lv_obj_set_style_text_color(label_obj, lv_color_black(), 0);
    lv_obj_set_style_text_align(label_obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_set_style_text_letter_space(label_obj, 0, 0);
    lv_obj_set_style_text_line_space(label_obj, 0, 0);
    set_label_font(label_obj, label_font);
    lv_obj_align(label_obj, LV_ALIGN_TOP_MID, 0, label_y);

    if (icon_out)
    {
        *icon_out = icon_obj;
    }

    return cell;
}

rt_err_t xiaozhi_home_screen_create(const xiaozhi_home_screen_config_t *config,
                                    xiaozhi_home_screen_refs_t *refs)
{
    static const lv_image_dsc_t *home_icons[HOME_GRID_ROWS][HOME_GRID_COLS] = {
        {&home_reading, &home_pet, &home_ai},
        {&home_clock, &home_weather, &home_calendar},
        {&home_record, &home_music, &home_settings},
    };
    static const char *home_labels[HOME_GRID_ROWS][HOME_GRID_COLS] = {
        {"阅读", "宠物管理", "AI小豆"},
        {"时间管理", "天气", "日历日程"},
        {"录音", "音乐", "设置"},
    };
    lv_coord_t screen_w;
    lv_coord_t screen_h;
    lv_coord_t header_h;
    lv_coord_t separator_y;
    lv_coord_t side_pad;
    lv_coord_t time_y;
    lv_coord_t meta_x;
    lv_coord_t meta_y;
    lv_coord_t meta_w;
    lv_coord_t meta_h;
    lv_coord_t status_icon_zoom;
    lv_coord_t status_gap;
    lv_coord_t battery_text_w;
    lv_coord_t charging_gap;
    lv_coord_t grid_top;
    lv_coord_t grid_bottom_pad;
    lv_coord_t grid_side_pad;
    lv_coord_t grid_w;
    lv_coord_t grid_h;
    lv_coord_t cell_w;
    lv_coord_t cell_h;
    lv_coord_t col_gap;
    lv_coord_t row_gap;
    lv_coord_t tile_icon_zoom;
    lv_coord_t tile_icon_y;
    lv_coord_t tile_label_y;
    lv_coord_t tile_label_w;
    lv_coord_t row;
    lv_coord_t col;
    lv_obj_t *screen;
    lv_obj_t *separator;
    lv_obj_t *meta_wrap;
    lv_obj_t *status_wrap;
    lv_obj_t *cell;
    lv_obj_t *weather_icon = NULL;
    lv_obj_t *bluetooth_icon;
    lv_obj_t *network_icon;
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

    header_h = scale_y(screen_h, 52);
    separator_y = header_h;
    side_pad = scale_x(screen_w, 14);
    time_y = scale_y(screen_h, 7);
    meta_w = scale_x(screen_w, 130);
    meta_h = scale_y(screen_h, 34);
    meta_x = (screen_w - meta_w) / 2;
    meta_y = scale_y(screen_h, 6);
    status_icon_zoom = 96;
    status_gap = scale_x(screen_w, 8);
    battery_text_w = scale_x(screen_w, 46);
    charging_gap = scale_x(screen_w, 4);
    grid_top = separator_y + scale_y(screen_h, 14);
    grid_bottom_pad = scale_y(screen_h, 16);
    grid_side_pad = scale_x(screen_w, 26);
    col_gap = scale_x(screen_w, 12);
    row_gap = scale_y(screen_h, 10);
    grid_w = screen_w - grid_side_pad * 2;
    grid_h = screen_h - grid_top - grid_bottom_pad;
    cell_w = (grid_w - col_gap * (HOME_GRID_COLS - 1)) / HOME_GRID_COLS;
    cell_h = (grid_h - row_gap * (HOME_GRID_ROWS - 1)) / HOME_GRID_ROWS;
    tile_icon_zoom = 176;
    tile_icon_y = scale_y(screen_h, 8);
    tile_label_y = scale_y(screen_h, 72);
    tile_label_w = cell_w;

    screen = lv_obj_create(NULL);
    lv_obj_clear_flag(screen, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_style_radius(screen, 0, 0);
    lv_obj_set_style_border_width(screen, 0, 0);
    lv_obj_set_style_pad_all(screen, 0, 0);
    lv_obj_set_style_bg_color(screen, lv_color_white(), 0);
    refs->screen = screen;

    refs->time_label = lv_label_create(screen);
    lv_label_set_text(refs->time_label, "00:55");
    lv_obj_set_style_text_color(refs->time_label, lv_color_black(), 0);
    set_label_font(refs->time_label, time_font);
    lv_obj_set_pos(refs->time_label, side_pad, time_y);

    meta_wrap = create_plain_container(screen, meta_x, meta_y, meta_w, meta_h);
    refs->meta_label = lv_label_create(meta_wrap);
    lv_label_set_text(refs->meta_label, "2000/01/01\n星期一 --°C");
    lv_obj_set_width(refs->meta_label, LV_PCT(100));
    lv_obj_set_style_text_color(refs->meta_label, lv_color_black(), 0);
    lv_obj_set_style_text_align(refs->meta_label, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_set_style_text_letter_space(refs->meta_label, 0, 0);
    lv_obj_set_style_text_line_space(refs->meta_label, 0, 0);
    set_label_font(refs->meta_label, meta_font);
    lv_obj_center(refs->meta_label);

    refs->battery_percent_label = lv_label_create(screen);
    lv_label_set_text_fmt(refs->battery_percent_label, "%d%%", config->battery_level);
    lv_obj_set_width(refs->battery_percent_label, battery_text_w);
    lv_obj_set_style_text_color(refs->battery_percent_label, lv_color_black(), 0);
    lv_obj_set_style_text_align(refs->battery_percent_label, LV_TEXT_ALIGN_RIGHT, 0);
    lv_obj_set_style_text_letter_space(refs->battery_percent_label, 0, 0);
    set_label_font(refs->battery_percent_label, status_font);
    lv_obj_align(refs->battery_percent_label, LV_ALIGN_TOP_RIGHT, -side_pad, time_y + scale_y(screen_h, 2));

    refs->standby_charging_icon = lv_img_create(screen);
    lv_img_set_src(refs->standby_charging_icon, &cdian2);
    lv_img_set_zoom(refs->standby_charging_icon, status_icon_zoom);
    lv_obj_align_to(refs->standby_charging_icon,
                    refs->battery_percent_label,
                    LV_ALIGN_OUT_LEFT_MID,
                    -charging_gap,
                    0);
    lv_obj_add_flag(refs->standby_charging_icon, LV_OBJ_FLAG_HIDDEN);

    status_wrap = create_plain_container(screen,
                                         lv_obj_get_x(refs->battery_percent_label) - scale_x(screen_w, 54),
                                         scale_y(screen_h, 10),
                                         scale_x(screen_w, 44),
                                         scale_y(screen_h, 16));
    network_icon = create_status_icon(status_wrap, &network_icon_img_close, status_icon_zoom);
    lv_obj_align(network_icon, LV_ALIGN_LEFT_MID, 0, 0);

    bluetooth_icon = create_status_icon(status_wrap, &ble_icon_img_close, status_icon_zoom);
    lv_obj_align_to(bluetooth_icon, network_icon, LV_ALIGN_OUT_RIGHT_MID, status_gap, 0);

    separator = lv_obj_create(screen);
    lv_obj_remove_flag(separator, LV_OBJ_FLAG_SCROLLABLE);
    lv_obj_set_size(separator, screen_w, 1);
    lv_obj_set_pos(separator, 0, separator_y);
    lv_obj_set_style_radius(separator, 0, 0);
    lv_obj_set_style_border_width(separator, 0, 0);
    lv_obj_set_style_bg_color(separator, lv_color_black(), 0);
    lv_obj_set_style_pad_all(separator, 0, 0);

    for (row = 0; row < HOME_GRID_ROWS; row++)
    {
        for (col = 0; col < HOME_GRID_COLS; col++)
        {
            lv_obj_t **icon_out = NULL;

            if (row == 1 && col == 1)
            {
                icon_out = &weather_icon;
            }

            cell = create_grid_item(screen,
                                    home_icons[row][col],
                                    home_labels[row][col],
                                    label_font,
                                    tile_icon_zoom,
                                    tile_icon_y,
                                    tile_label_y,
                                    tile_label_w,
                                    icon_out);
            lv_obj_set_pos(cell,
                           grid_side_pad + col * (cell_w + col_gap),
                           grid_top + row * (cell_h + row_gap));
            lv_obj_set_size(cell, cell_w, cell_h);
        }
    }

    refs->weather_icon = weather_icon;
    refs->img_emoji = NULL;
    refs->hour_tens_img = NULL;
    refs->hour_units_img = NULL;
    refs->minute_tens_img = NULL;
    refs->minute_units_img = NULL;
    refs->bluetooth_icon = bluetooth_icon;
    refs->network_icon = network_icon;
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
