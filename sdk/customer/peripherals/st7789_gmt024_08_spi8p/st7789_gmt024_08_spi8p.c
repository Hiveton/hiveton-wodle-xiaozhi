#include <rtthread.h>
#include "string.h"
#include "board.h"
#include "drv_io.h"
#include "drv_lcd.h"
#include "bf0_hal.h"
#include "waveinit.h"
#include "epd_pin_defs.h"
#include "mem_section.h"

#define DBG_TAG "epd.spi"
#define DBG_LVL DBG_INFO
#include "log.h"

#define EPD_SRC_PIXELS 792
#define EPD_GATE_PIXELS 528
#define EPD_WIDTH EPD_SRC_PIXELS
#define EPD_HEIGHT EPD_GATE_PIXELS
#define EPD_LOGICAL_WIDTH LCD_HOR_RES_MAX
#define EPD_LOGICAL_HEIGHT LCD_VER_RES_MAX
#define EPD_GRAY2_FRAME_SIZE (EPD_WIDTH * EPD_HEIGHT / 4) /* 2bpp */
#define EPD_MONO_FRAME_SIZE (EPD_WIDTH * EPD_HEIGHT / 8)  /* 1bpp */
#define EPD_SELF_TEST_PATTERN 0
#define EPD_USE_SCAN_MODE3 1
/* Scan total and visible window can differ (per UC8179 reference code). */
#define EPD_SCAN_SRC_PIXELS EPD_SRC_PIXELS
/* Vendor sample uses total gate scan 600 with visible window starting at Y=72 (0x48). */
#define EPD_SCAN_GATE_PIXELS 600
#define EPD_WIN_X_START 0
#define EPD_WIN_Y_START 72
#define EPD_WIN_WIDTH EPD_WIDTH
#define EPD_WIN_HEIGHT EPD_HEIGHT

static const unsigned char EPD_lut_full_update[] = {
    0x02, 0x02, 0x01, 0x11, 0x12, 0x12, 0x22, 0x22, 0x66, 0x69,
    0x69, 0x59, 0x58, 0x99, 0x99, 0x88, 0x00, 0x00, 0x00, 0x00,
    0xF8, 0xB4, 0x13, 0x51, 0x35, 0x51, 0x51, 0x19, 0x01, 0x00};

static const unsigned char EPD_lut_partial_update[] = {
    0x10, 0x18, 0x18, 0x08, 0x18, 0x18, 0x08, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x13, 0x14, 0x44, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
const unsigned char LUT_GC[282]={
/*Vcom*/
0x00,0x1A,0x1A,0x01,0x00,0x01,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
/*WW*/
0x60,0x1A,0x1A,0x01,0x00,0x01,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
/*BW*/
0x20,0x1A,0x1A,0x01,0x00,0x01,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
/*WB*/
0x10,0x1A,0x1A,0x01,0x00,0x01,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
/*BB*/
0x90,0x1A,0x1A,0x01,0x00,0x01,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,
};
#define EPD_FULL 0
#define EPD_PART 1

#define EPD_LCD_ID 0x09ff
#define LCD_PIXEL_WIDTH EPD_WIDTH
#define LCD_PIXEL_HEIGHT EPD_HEIGHT
#define LCD_HOR_RES_MAX_8 LCD_HOR_RES_MAX / 8

#define PICTURE_LENGTH (LCD_HOR_RES_MAX / 8 * LCD_VER_RES_MAX)
#define PIC_WHITE 255                  // 全白
#define PIC_BLACK 254                  // 全黑
#define PIC_LEFT_BLACK_RIGHT_WHITE 253 // 左黑右白
#define PIC_UP_BLACK_DOWN_WHITE 252    // 上黑下白
#define PART_DISP_TIMES 10

#define REG_LUT_VCOM 0x20
#define REG_LUT_W2W 0x21
#define REG_LUT_K2W 0x22
#define REG_LUT_W2K 0x23
#define REG_LUT_K2K 0x24
#define REG_LUT_OPT 0x2A
#define REG_WRITE_NEW_DATA 0x13
#define REG_AUTO_REFRESH 0x17
#define REG_PWR_ON_MEASURE 0x05
#define REG_TEMP_CALIB 0x40
#define REG_TEMP_SEL 0x41
#define REG_TEMP_READ 0x43
#define REG_PANEL_SETTING 0x00
#define REG_POWER_SETTING 0x01
#define REG_BOOSTER_SOFTSTART 0x06
#define REG_PLL_CTRL 0x30
#define REG_VCOM_DATA_INTERV 0x50
#define REG_TCON_SETTING 0x60
#define REG_RESOLUTION 0x61
#define REG_REV 0x70
#define REG_VDCS 0x82
#define REG_WRITE_NEW_DATA 0x13

static int reflesh_times;
static uint8_t current_refresh_mode;
static unsigned char LUT_Flag = 0; // LUT切换标志
static unsigned char Var_Temp = 0; // 温度值
static rt_tick_t s_last_epd_refresh_tick = 0;
static uint8_t s_frame_collecting = 0;
static uint8_t s_dirty_area_valid = 0;
static uint16_t s_dirty_x0 = 0;
static uint16_t s_dirty_y0 = 0;
static uint16_t s_dirty_x1 = 0;
static uint16_t s_dirty_y1 = 0;
static uint8_t s_partial_refresh_count = 0;

static LCDC_InitTypeDef lcdc_int_cfg = {
    .lcd_itf = LCDC_INTF_SPI_DCX_1DATA,
    .freq = 5000000,
    .color_mode = LCDC_PIXEL_FORMAT_RGB332,
    .cfg =
        {
            .spi =
                {
                    .dummy_clock = 0,
                    .syn_mode = HAL_LCDC_SYNC_DISABLE,
                    .vsyn_polarity = 1,
                    .vsyn_delay_us = 0,
                    .hsyn_num = 0,
                },
        },
};

LCDC_HandleTypeDef hlcdc;
static uint16_t g_input_color_mode = RTGRAPHIC_PIXEL_FORMAT_RGB565;
static uint32_t LCD_ReadID(LCDC_HandleTypeDef *hlcdc);
static void LCD_WriteReg(LCDC_HandleTypeDef *hlcdc, uint16_t LCD_Reg,
                         uint8_t *Parameters, uint32_t NbParameters);
static uint32_t LCD_ReadData(LCDC_HandleTypeDef *hlcdc, uint16_t RegValue,
                             uint8_t ReadSize);
static void EPD_TemperatureMeasure(LCDC_HandleTypeDef *hlcdc);
static void EPD_EnterDeepSleep(LCDC_HandleTypeDef *hlcdc);
static void EPD_DisplayImage(LCDC_HandleTypeDef *hlcdc, uint8_t img_flag);
static void EPD_EnterDeepSleep(LCDC_HandleTypeDef *hlcdc);
static void EPD_LoadLUT(LCDC_HandleTypeDef *hlcdc, uint8_t lut_mode);
static void LUTGC(LCDC_HandleTypeDef *hlcdc);
static void EPD_Refresh(LCDC_HandleTypeDef *hlcdc);
static void EPD_ReadBusy(void);
static void EPD_SendCommandDataBuf(LCDC_HandleTypeDef *hlcdc, uint8_t cmd,
                                   const uint8_t *data, uint16_t len);
static void EPD_SetFullWindow(LCDC_HandleTypeDef *hlcdc);
static void EPD_SetPartialWindow(LCDC_HandleTypeDef *hlcdc, uint16_t x0,
                                 uint16_t y0, uint16_t x1, uint16_t y1);
static void EPD_FrameBuffer_FlushRegion(LCDC_HandleTypeDef *hlcdc, uint16_t x0,
                                        uint16_t y0, uint16_t x1, uint16_t y1);
static void EPD_FrameBuffer_FlushFast(LCDC_HandleTypeDef *hlcdc);
static void EPD_MarkDirtyPhysicalRegion(uint16_t x0, uint16_t y0, uint16_t x1,
                                        uint16_t y1);
static void EPD_MarkDirtyLogicalRegion(uint16_t x0, uint16_t y0, uint16_t x1,
                                       uint16_t y1);
static void EPD_ClearDirtyRegion(void);
static uint8_t EPD_ShouldUseFullRefresh(uint16_t x0, uint16_t y0, uint16_t x1,
                                        uint16_t y1);
static uint8_t *EPD_AllocMonoRegionBuffer(const uint8_t *src, uint16_t x0,
                                          uint16_t y0, uint16_t x1,
                                          uint16_t y1, uint32_t *out_len);

L2_NON_RET_BSS_SECT_BEGIN(frambuf)
L2_NON_RET_BSS_SECT(frambuf,
                    ALIGN(64) static uint8_t mixed_framebuffer[EPD_GRAY2_FRAME_SIZE]);
L2_NON_RET_BSS_SECT(frambuf,
                    ALIGN(64) static uint8_t mixed_framebuffer_mono[EPD_MONO_FRAME_SIZE]);
L2_NON_RET_BSS_SECT(frambuf,
                    ALIGN(64) static uint8_t mixed_framebuffer_prev_mono[EPD_MONO_FRAME_SIZE]);
L2_NON_RET_BSS_SECT_END

static uint8_t framebuffer_initialized = 0;

static rt_sem_t epd_busy_sem = RT_NULL;

static unsigned int epd_ticks_to_ms(rt_tick_t ticks)
{
    return (unsigned int)(((uint64_t)ticks * 1000U) / RT_TICK_PER_SECOND);
}

static inline uint8_t epd_clamp_gray2(uint8_t lv)
{
    return (lv > 3) ? 3 : lv;
}

static inline void epd_set_gray2_pixel(uint16_t x, uint16_t y, uint8_t lv)
{
    uint32_t px = (uint32_t)y * EPD_WIDTH + x;
    uint32_t byte_idx = px >> 2;              /* 4 pixels per byte */
    uint8_t shift = (uint8_t)((3 - (px & 0x3)) << 1); /* MSB first */
    uint8_t mask = (uint8_t)(0x3u << shift);
    lv = epd_clamp_gray2(lv);
    mixed_framebuffer[byte_idx] = (uint8_t)((mixed_framebuffer[byte_idx] & ~mask) | (lv << shift));
}

static inline uint8_t epd_get_gray2_pixel(uint16_t x, uint16_t y)
{
    uint32_t px = (uint32_t)y * EPD_WIDTH + x;
    uint32_t byte_idx = px >> 2;
    uint8_t shift = (uint8_t)((3 - (px & 0x3)) << 1);
    return (uint8_t)((mixed_framebuffer[byte_idx] >> shift) & 0x3u);
}

static inline void epd_map_logical_to_physical(uint16_t lx, uint16_t ly,
                                               uint16_t *px, uint16_t *py)
{
    /* Logical (portrait): 528x792 -> Physical (landscape): 792x528 */
    *px = ly;
    *py = (uint16_t)(EPD_HEIGHT - 1U - lx);
}

static void EPD_Gray2ToMonoDither(void)
{
    static const uint8_t bayer2x2[2][2] = {
        {0, 2},
        {3, 1},
    };
    memset(mixed_framebuffer_mono, 0xFF, sizeof(mixed_framebuffer_mono));

    for (uint16_t y = 0; y < EPD_HEIGHT; y++)
    {
        for (uint16_t x = 0; x < EPD_WIDTH; x++)
        {
            uint8_t lv = epd_get_gray2_pixel(x, y); /* 0=black ... 3=white */
            uint8_t threshold = bayer2x2[y & 1][x & 1];
            /* level density: 0->0/4, 1->1/4, 2->2/4, 3->4/4 */
            uint8_t is_white = (lv == 3) ? 1 : ((lv > threshold) ? 1 : 0);

            uint32_t byte_idx = (uint32_t)y * (EPD_WIDTH / 8) + (x / 8);
            uint8_t bit_pos = (uint8_t)(7 - (x % 8));
            if (is_white)
            {
                mixed_framebuffer_mono[byte_idx] |= (uint8_t)(1u << bit_pos);
            }
            else
            {
                mixed_framebuffer_mono[byte_idx] &= (uint8_t)~(1u << bit_pos);
            }
        }
    }
}

static void EPD_MarkDirtyPhysicalRegion(uint16_t x0, uint16_t y0, uint16_t x1,
                                        uint16_t y1)
{
    if (x0 > x1 || y0 > y1)
    {
        return;
    }

    if (x1 >= EPD_WIDTH) x1 = EPD_WIDTH - 1;
    if (y1 >= EPD_HEIGHT) y1 = EPD_HEIGHT - 1;

    if (!s_dirty_area_valid)
    {
        s_dirty_x0 = x0;
        s_dirty_y0 = y0;
        s_dirty_x1 = x1;
        s_dirty_y1 = y1;
        s_dirty_area_valid = 1;
        return;
    }

    if (x0 < s_dirty_x0) s_dirty_x0 = x0;
    if (y0 < s_dirty_y0) s_dirty_y0 = y0;
    if (x1 > s_dirty_x1) s_dirty_x1 = x1;
    if (y1 > s_dirty_y1) s_dirty_y1 = y1;
}

static void EPD_MarkDirtyLogicalRegion(uint16_t x0, uint16_t y0, uint16_t x1,
                                       uint16_t y1)
{
    if (x0 > x1 || y0 > y1)
    {
        return;
    }

    if (x1 >= EPD_LOGICAL_WIDTH) x1 = EPD_LOGICAL_WIDTH - 1;
    if (y1 >= EPD_LOGICAL_HEIGHT) y1 = EPD_LOGICAL_HEIGHT - 1;

    EPD_MarkDirtyPhysicalRegion(y0, (uint16_t)(EPD_HEIGHT - 1U - x1),
                                y1, (uint16_t)(EPD_HEIGHT - 1U - x0));
}

static void EPD_ClearDirtyRegion(void)
{
    s_dirty_area_valid = 0;
    s_dirty_x0 = 0;
    s_dirty_y0 = 0;
    s_dirty_x1 = 0;
    s_dirty_y1 = 0;
}

static uint8_t EPD_ShouldUseFullRefresh(uint16_t x0, uint16_t y0, uint16_t x1,
                                        uint16_t y1)
{
    uint32_t dirty_pixels = (uint32_t)(x1 - x0 + 1U) * (uint32_t)(y1 - y0 + 1U);
    uint32_t full_pixels = (uint32_t)EPD_WIDTH * (uint32_t)EPD_HEIGHT;

    if (dirty_pixels * 2U >= full_pixels)
    {
        return 1;
    }

    if (s_partial_refresh_count >= PART_DISP_TIMES)
    {
        return 1;
    }

    return 0;
}

static void EPD_GetEffectiveUpdateRegion(LCDC_HandleTypeDef *hlcdc,
                                         uint16_t src_x0, uint16_t src_y0,
                                         uint16_t src_x1, uint16_t src_y1,
                                         uint16_t *upd_x0, uint16_t *upd_y0,
                                         uint16_t *upd_x1, uint16_t *upd_y1)
{
    if (upd_x0 == NULL || upd_y0 == NULL || upd_x1 == NULL || upd_y1 == NULL)
    {
        return;
    }

    *upd_x0 = src_x0;
    *upd_y0 = src_y0;
    *upd_x1 = src_x1;
    *upd_y1 = src_y1;

    if (hlcdc == NULL)
    {
        return;
    }

    if ((hlcdc->roi.x0 <= hlcdc->roi.x1) && (hlcdc->roi.y0 <= hlcdc->roi.y1))
    {
        uint16_t roi_x0 = (uint16_t)hlcdc->roi.x0;
        uint16_t roi_y0 = (uint16_t)hlcdc->roi.y0;
        uint16_t roi_x1 = (uint16_t)hlcdc->roi.x1;
        uint16_t roi_y1 = (uint16_t)hlcdc->roi.y1;

        if (roi_x0 < *upd_x0) roi_x0 = *upd_x0;
        if (roi_y0 < *upd_y0) roi_y0 = *upd_y0;
        if (roi_x1 > *upd_x1) roi_x1 = *upd_x1;
        if (roi_y1 > *upd_y1) roi_y1 = *upd_y1;

        if (roi_x0 <= roi_x1 && roi_y0 <= roi_y1)
        {
            *upd_x0 = roi_x0;
            *upd_y0 = roi_y0;
            *upd_x1 = roi_x1;
            *upd_y1 = roi_y1;
        }
    }
}

static uint8_t EPD_ShouldFlushCurrentROI(LCDC_HandleTypeDef *hlcdc,
                                         uint16_t upd_x1, uint16_t upd_y1)
{
    if (hlcdc == NULL)
    {
        return 1;
    }

    if ((hlcdc->roi.x0 <= hlcdc->roi.x1) && (hlcdc->roi.y0 <= hlcdc->roi.y1))
    {
        return (upd_x1 >= (uint16_t)hlcdc->roi.x1) &&
               (upd_y1 >= (uint16_t)hlcdc->roi.y1);
    }

    return 1;
}

static uint8_t *EPD_AllocMonoRegionBuffer(const uint8_t *src, uint16_t x0,
                                          uint16_t y0, uint16_t x1,
                                          uint16_t y1, uint32_t *out_len)
{
    uint16_t src_stride = (uint16_t)(EPD_WIDTH / 8U);
    uint16_t x0_byte = (uint16_t)(x0 / 8U);
    uint16_t x1_byte = (uint16_t)(x1 / 8U);
    uint16_t row_bytes = (uint16_t)(x1_byte - x0_byte + 1U);
    uint16_t height = (uint16_t)(y1 - y0 + 1U);
    uint32_t buf_len = (uint32_t)row_bytes * (uint32_t)height;
    uint8_t *buf;

    if (out_len != NULL)
    {
        *out_len = 0;
    }

    if (src == NULL || row_bytes == 0U || height == 0U)
    {
        return RT_NULL;
    }

    buf = rt_malloc(buf_len);
    if (buf == RT_NULL)
    {
        rt_kprintf("EPD region alloc failed, len=%lu\n", (unsigned long)buf_len);
        return RT_NULL;
    }

    for (uint16_t row = 0; row < height; row++)
    {
        const uint8_t *src_row = src + ((uint32_t)(y0 + row) * src_stride) + x0_byte;
        memcpy(buf + ((uint32_t)row * row_bytes), src_row, row_bytes);
    }

    if (out_len != NULL)
    {
        *out_len = buf_len;
    }

    return buf;
}

/**
 * @brief 初始化帧缓冲区为全白
 */
static void EPD_FrameBuffer_Init(void)
{
    memset(mixed_framebuffer, 0xFF, sizeof(mixed_framebuffer)); /* default white (3) by packed bytes */
    memset(mixed_framebuffer_mono, 0xFF, sizeof(mixed_framebuffer_mono));
    memset(mixed_framebuffer_prev_mono, 0xFF, sizeof(mixed_framebuffer_prev_mono));
    framebuffer_initialized = 1;
    EPD_ClearDirtyRegion();
    s_partial_refresh_count = 0;
}

/**
 * @brief 更新帧缓冲区指定区域的数据
 * @param data 源数据指针(RGB332格式，每字节一个像素)
 * @param x0 起始X坐标
 * @param y0 起始Y坐标
 * @param x1 结束X坐标
 * @param y1 结束Y坐标
 * @note 将RGB332数据转换为2bpp（4色阶）格式存入缓冲区
 */
static void EPD_FrameBuffer_UpdateRegion(const uint8_t *data, uint16_t x0, uint16_t y0, 
                                          uint16_t x1, uint16_t y1)
{
    if (data == NULL || x0 > x1 || y0 > y1)
    {
        return;
    }
    
    // 边界检查
    if (x1 >= EPD_LOGICAL_WIDTH) x1 = EPD_LOGICAL_WIDTH - 1;
    if (y1 >= EPD_LOGICAL_HEIGHT) y1 = EPD_LOGICAL_HEIGHT - 1;
    
    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }
    
    uint16_t src_width = x1 - x0 + 1;
    
    for (uint16_t y = y0; y <= y1; y++)
    {
        for (uint16_t x = x0; x <= x1; x++)
        {
            // 计算源数据中的位置
            uint32_t src_idx = (y - y0) * src_width + (x - x0);
            uint8_t pixel = data[src_idx];
            
            // 将RGB332转换为4级灰度（0=黑,1=深灰,2=浅灰,3=白）
            // RGB332: RRRGGGBB, 计算灰度值
            uint8_t r = (pixel >> 5) & 0x07;  // 3 bits
            uint8_t g = (pixel >> 2) & 0x07;  // 3 bits
            uint8_t b = pixel & 0x03;         // 2 bits
            uint16_t gray = (uint16_t)r * 36 + (uint16_t)g * 36 + (uint16_t)b * 64;  // 0-252
            uint8_t gray2 = (gray < 64) ? 0 : (gray < 128) ? 1 : (gray < 192) ? 2 : 3;
            uint16_t px, py;
            epd_map_logical_to_physical(x, y, &px, &py);
            epd_set_gray2_pixel(px, py, gray2);
        }
    }
}

static void EPD_FrameBuffer_UpdateRegionFromSrcArea(const uint8_t *data,
                                                    uint16_t src_x0, uint16_t src_y0,
                                                    uint16_t src_x1, uint16_t src_y1,
                                                    uint16_t upd_x0, uint16_t upd_y0,
                                                    uint16_t upd_x1, uint16_t upd_y1)
{
    if (data == NULL || src_x0 > src_x1 || src_y0 > src_y1 ||
        upd_x0 > upd_x1 || upd_y0 > upd_y1)
    {
        return;
    }

    if (upd_x0 < src_x0 || upd_y0 < src_y0 || upd_x1 > src_x1 || upd_y1 > src_y1)
    {
        return;
    }

    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }

    uint16_t src_width = (uint16_t)(src_x1 - src_x0 + 1U);

    for (uint16_t y = upd_y0; y <= upd_y1; y++)
    {
        for (uint16_t x = upd_x0; x <= upd_x1; x++)
        {
            uint32_t src_idx = (uint32_t)(y - src_y0) * src_width + (uint32_t)(x - src_x0);
            uint8_t pixel = data[src_idx];
            uint8_t r = (pixel >> 5) & 0x07;
            uint8_t g = (pixel >> 2) & 0x07;
            uint8_t b = pixel & 0x03;
            uint16_t gray = (uint16_t)r * 36 + (uint16_t)g * 36 + (uint16_t)b * 64;
            uint8_t gray2 = (gray < 64) ? 0 : (gray < 128) ? 1 : (gray < 192) ? 2 : 3;
            uint16_t px, py;
            epd_map_logical_to_physical(x, y, &px, &py);
            epd_set_gray2_pixel(px, py, gray2);
        }
    }
}

static void EPD_FrameBuffer_UpdateRegionRGB565(const uint8_t *data, uint16_t x0, uint16_t y0,
                                                uint16_t x1, uint16_t y1)
{
    if (data == NULL || x0 > x1 || y0 > y1)
    {
        return;
    }

    if (x1 >= EPD_LOGICAL_WIDTH) x1 = EPD_LOGICAL_WIDTH - 1;
    if (y1 >= EPD_LOGICAL_HEIGHT) y1 = EPD_LOGICAL_HEIGHT - 1;

    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }

    uint16_t src_width = x1 - x0 + 1;

    for (uint16_t y = y0; y <= y1; y++)
    {
        for (uint16_t x = x0; x <= x1; x++)
        {
            uint32_t src_idx = (uint32_t)((y - y0) * src_width + (x - x0));
            uint16_t pixel565 = (uint16_t)data[src_idx * 2] | ((uint16_t)data[src_idx * 2 + 1] << 8);

            uint8_t r5 = (uint8_t)((pixel565 >> 11) & 0x1F);
            uint8_t g6 = (uint8_t)((pixel565 >> 5) & 0x3F);
            uint8_t b5 = (uint8_t)(pixel565 & 0x1F);
            uint8_t r8 = (uint8_t)((r5 << 3) | (r5 >> 2));
            uint8_t g8 = (uint8_t)((g6 << 2) | (g6 >> 4));
            uint8_t b8 = (uint8_t)((b5 << 3) | (b5 >> 2));

            uint16_t gray = (uint16_t)(r8 * 30 + g8 * 59 + b8 * 11) / 100;
            uint8_t gray2 = (gray < 64) ? 0 : (gray < 128) ? 1 : (gray < 192) ? 2 : 3;
            uint16_t px, py;
            epd_map_logical_to_physical(x, y, &px, &py);
            epd_set_gray2_pixel(px, py, gray2);
        }
    }
}

static void EPD_FrameBuffer_UpdateRegionRGB565FromSrcArea(const uint8_t *data,
                                                          uint16_t src_x0, uint16_t src_y0,
                                                          uint16_t src_x1, uint16_t src_y1,
                                                          uint16_t upd_x0, uint16_t upd_y0,
                                                          uint16_t upd_x1, uint16_t upd_y1)
{
    if (data == NULL || src_x0 > src_x1 || src_y0 > src_y1 ||
        upd_x0 > upd_x1 || upd_y0 > upd_y1)
    {
        return;
    }

    if (upd_x0 < src_x0 || upd_y0 < src_y0 || upd_x1 > src_x1 || upd_y1 > src_y1)
    {
        return;
    }

    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }

    uint16_t src_width = (uint16_t)(src_x1 - src_x0 + 1U);

    for (uint16_t y = upd_y0; y <= upd_y1; y++)
    {
        for (uint16_t x = upd_x0; x <= upd_x1; x++)
        {
            uint32_t src_idx = (uint32_t)(y - src_y0) * src_width + (uint32_t)(x - src_x0);
            uint16_t pixel565 = (uint16_t)data[src_idx * 2U] |
                                ((uint16_t)data[src_idx * 2U + 1U] << 8);

            uint8_t r5 = (uint8_t)((pixel565 >> 11) & 0x1F);
            uint8_t g6 = (uint8_t)((pixel565 >> 5) & 0x3F);
            uint8_t b5 = (uint8_t)(pixel565 & 0x1F);
            uint8_t r8 = (uint8_t)((r5 << 3) | (r5 >> 2));
            uint8_t g8 = (uint8_t)((g6 << 2) | (g6 >> 4));
            uint8_t b8 = (uint8_t)((b5 << 3) | (b5 >> 2));

            uint16_t gray = (uint16_t)(r8 * 30 + g8 * 59 + b8 * 11) / 100;
            uint8_t gray2 = (gray < 64) ? 0 : (gray < 128) ? 1 : (gray < 192) ? 2 : 3;
            uint16_t px, py;
            epd_map_logical_to_physical(x, y, &px, &py);
            epd_set_gray2_pixel(px, py, gray2);
        }
    }
}

/**
 * @brief 更新帧缓冲区指定区域的数据（1bpp格式直接拷贝）
 * @param data 源数据指针(1bpp格式)
 * @param x0 起始X坐标（必须是8的倍数）
 * @param y0 起始Y坐标
 * @param x1 结束X坐标
 * @param y1 结束Y坐标
 */
static void EPD_FrameBuffer_UpdateRegion1bpp(const uint8_t *data, uint16_t x0, uint16_t y0, 
                                              uint16_t x1, uint16_t y1)
{
    if (data == NULL || x0 > x1 || y0 > y1)
    {
        return;
    }
    
    // 边界检查
    if (x1 >= EPD_LOGICAL_WIDTH) x1 = EPD_LOGICAL_WIDTH - 1;
    if (y1 >= EPD_LOGICAL_HEIGHT) y1 = EPD_LOGICAL_HEIGHT - 1;
    
    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }
    
    // 将1bpp源数据映射到2bpp灰度缓存（0->黑，1->白）
    uint16_t x0_byte = x0 / 8;
    uint16_t x1_byte = x1 / 8;
    uint16_t src_bytes_per_row = x1_byte - x0_byte + 1;
    
    for (uint16_t y = y0; y <= y1; y++)
    {
        uint32_t src_offset = (y - y0) * src_bytes_per_row;
        for (uint16_t x = x0; x <= x1; x++)
        {
            uint32_t src_byte_idx = src_offset + ((x - x0) / 8);
            uint8_t src_bit = (uint8_t)(7 - ((x - x0) % 8));
            uint8_t mono = (uint8_t)((data[src_byte_idx] >> src_bit) & 0x1u);
            uint16_t px, py;
            epd_map_logical_to_physical(x, y, &px, &py);
            epd_set_gray2_pixel(px, py, mono ? 3 : 0);
        }
    }
}

/**
 * @brief 将帧缓冲区全屏刷新到墨水屏
 * @param hlcdc LCDC句柄
 */
static void EPD_FrameBuffer_Flush(LCDC_HandleTypeDef *hlcdc)
{
    rt_tick_t refresh_start;
    rt_tick_t refresh_end;

    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }
    
    EPD_ReadBusy();

    // 加载 GC 模式的 LUT
    LUTGC(hlcdc);

#if EPD_USE_SCAN_MODE3
    EPD_SetFullWindow(hlcdc);
#endif
    
    // 使用Layer方式发送帧缓冲区数据
    EPD_Gray2ToMonoDither();

    /* Vendor flow: normal display writes new/BW RAM (0x13), then refresh. */
    EPD_SendCommandDataBuf(hlcdc, REG_WRITE_NEW_DATA, mixed_framebuffer_mono,
                           EPD_MONO_FRAME_SIZE);
    
    // 刷新显示
    refresh_start = rt_tick_get();
    EPD_Refresh(hlcdc);
    refresh_end = rt_tick_get();
    rt_kprintf("[standby_dbg] epd full refresh done elapsed=%u ms\n",
               epd_ticks_to_ms(refresh_end - refresh_start));
    memcpy(mixed_framebuffer_prev_mono, mixed_framebuffer_mono,
           sizeof(mixed_framebuffer_prev_mono));
    s_partial_refresh_count = 0;
    EPD_ClearDirtyRegion();
}

static void EPD_FrameBuffer_FlushFast(LCDC_HandleTypeDef *hlcdc)
{
    rt_tick_t refresh_start;
    rt_tick_t refresh_end;

    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }

    EPD_ReadBusy();
    EPD_LoadLUT(hlcdc, 2);

#if EPD_USE_SCAN_MODE3
    EPD_SetFullWindow(hlcdc);
#endif

    EPD_Gray2ToMonoDither();
    EPD_SendCommandDataBuf(hlcdc, 0x10, mixed_framebuffer_prev_mono,
                           EPD_MONO_FRAME_SIZE);
    EPD_SendCommandDataBuf(hlcdc, REG_WRITE_NEW_DATA, mixed_framebuffer_mono,
                           EPD_MONO_FRAME_SIZE);

    refresh_start = rt_tick_get();
    EPD_Refresh(hlcdc);
    refresh_end = rt_tick_get();
    rt_kprintf("[standby_dbg] epd fast full refresh done elapsed=%u ms partial_count=%u\n",
               epd_ticks_to_ms(refresh_end - refresh_start),
               (unsigned int)s_partial_refresh_count);

    memcpy(mixed_framebuffer_prev_mono, mixed_framebuffer_mono,
           sizeof(mixed_framebuffer_prev_mono));
    if (s_partial_refresh_count < 0xFF)
    {
        s_partial_refresh_count++;
    }
    EPD_ClearDirtyRegion();
}

/**
 * @brief 清空帧缓冲区（填充白色）
 */
static void EPD_FrameBuffer_Clear(void)
{
    memset(mixed_framebuffer, 0xFF, sizeof(mixed_framebuffer));
    memset(mixed_framebuffer_mono, 0xFF, sizeof(mixed_framebuffer_mono));
    memset(mixed_framebuffer_prev_mono, 0xFF, sizeof(mixed_framebuffer_prev_mono));
    framebuffer_initialized = 1;
    EPD_ClearDirtyRegion();
    s_partial_refresh_count = 0;
}

static void EPD_DrawCenteredCircleTest(void)
{
    int32_t cx = EPD_WIDTH / 2;
    int32_t cy = EPD_HEIGHT / 2;
    int32_t r = (EPD_WIDTH < EPD_HEIGHT ? EPD_WIDTH : EPD_HEIGHT) / 4;
    int32_t r2 = r * r;

    EPD_FrameBuffer_Clear();

    for (int32_t y = 0; y < EPD_HEIGHT; y++)
    {
        int32_t dy = y - cy;
        for (int32_t x = 0; x < EPD_WIDTH; x++)
        {
            int32_t dx = x - cx;
            if ((dx * dx + dy * dy) <= r2)
            {
                epd_set_gray2_pixel((uint16_t)x, (uint16_t)y, 0);
            }
        }
    }
}

/**
 * @brief 填充帧缓冲区（填充黑色）
 */
static void EPD_FrameBuffer_Fill(void)
{
    memset(mixed_framebuffer, 0x00, sizeof(mixed_framebuffer));
    memset(mixed_framebuffer_mono, 0x00, sizeof(mixed_framebuffer_mono));
    framebuffer_initialized = 1;
}

/**
 * @brief 获取帧缓冲区指针
 * @return 帧缓冲区指针
 */
static uint8_t* EPD_FrameBuffer_GetPtr(void)
{
    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }
    return mixed_framebuffer;
}
// 发送命令（不带数据）
static void EPD_SendCommand(LCDC_HandleTypeDef *hlcdc, uint8_t cmd)
{
    HAL_LCDC_WriteU8Reg(hlcdc, cmd, NULL, 0);
}

// 发送命令+单字节数据
static void EPD_SendCommandData(LCDC_HandleTypeDef *hlcdc, uint8_t cmd,
                                uint8_t data)
{
    HAL_LCDC_WriteU8Reg(hlcdc, cmd, &data, 1);
}

// 发送命令+多字节数据
static void EPD_SendCommandDataBuf(LCDC_HandleTypeDef *hlcdc, uint8_t cmd,
                                   const uint8_t *data, uint16_t len)
{
    HAL_LCDC_WriteU8Reg(hlcdc, cmd, (uint8_t *)data, len);
}

static void EPD_SetFullWindow(LCDC_HandleTypeDef *hlcdc)
{
    uint16_t x_start = EPD_WIN_X_START;
    uint16_t y_start = EPD_WIN_Y_START;
    uint16_t x_end = (uint16_t)(EPD_WIN_X_START + EPD_WIN_WIDTH - 1);
    uint16_t y_end = (uint16_t)(EPD_WIN_Y_START + EPD_WIN_HEIGHT - 1);

    if (x_end >= EPD_SCAN_SRC_PIXELS) x_end = EPD_SCAN_SRC_PIXELS - 1;
    if (y_end >= EPD_SCAN_GATE_PIXELS) y_end = EPD_SCAN_GATE_PIXELS - 1;

    uint8_t win[9] = {
        (uint8_t)(x_start >> 8), (uint8_t)(x_start & 0xFF),
        (uint8_t)(x_end >> 8), (uint8_t)(x_end & 0xFF),
        (uint8_t)(y_start >> 8), (uint8_t)(y_start & 0xFF),
        (uint8_t)(y_end >> 8), (uint8_t)(y_end & 0xFF),
        0x01
    };
    EPD_SendCommand(hlcdc, 0x91);
    EPD_SendCommandDataBuf(hlcdc, 0x90, win, sizeof(win));
}

static void EPD_SetPartialWindow(LCDC_HandleTypeDef *hlcdc, uint16_t x0,
                                 uint16_t y0, uint16_t x1, uint16_t y1)
{
    uint16_t x_start = (uint16_t)(x0 & ~0x7u);
    uint16_t x_end = (uint16_t)(x1 | 0x7u);
    uint16_t y_start = (uint16_t)(EPD_WIN_Y_START + y0);
    uint16_t y_end = (uint16_t)(EPD_WIN_Y_START + y1);
    uint8_t win[9] = {
        (uint8_t)(x_start >> 8), (uint8_t)(x_start & 0xFF),
        (uint8_t)(x_end >> 8), (uint8_t)(x_end & 0xFF),
        (uint8_t)(y_start >> 8), (uint8_t)(y_start & 0xFF),
        (uint8_t)(y_end >> 8), (uint8_t)(y_end & 0xFF),
        0x01
    };

    if (x_end >= EPD_SCAN_SRC_PIXELS) x_end = EPD_SCAN_SRC_PIXELS - 1;
    if (y_end >= EPD_SCAN_GATE_PIXELS) y_end = EPD_SCAN_GATE_PIXELS - 1;
    win[2] = (uint8_t)(x_end >> 8);
    win[3] = (uint8_t)(x_end & 0xFF);
    win[6] = (uint8_t)(y_end >> 8);
    win[7] = (uint8_t)(y_end & 0xFF);

    EPD_SendCommand(hlcdc, 0x91);
    EPD_SendCommandDataBuf(hlcdc, 0x90, win, sizeof(win));
}

static void EPD_FrameBuffer_FlushRegion(LCDC_HandleTypeDef *hlcdc, uint16_t x0,
                                        uint16_t y0, uint16_t x1, uint16_t y1)
{
    uint8_t *old_region;
    uint8_t *new_region;
    uint32_t old_len;
    uint32_t new_len;
    rt_tick_t refresh_start;
    rt_tick_t refresh_end;
    uint16_t src_stride;
    uint16_t x0_byte;
    uint16_t x1_byte;
    uint16_t row_bytes;

    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }

    x0 = (uint16_t)(x0 & ~0x7u);
    x1 = (uint16_t)(x1 | 0x7u);
    if (x1 >= EPD_WIDTH) x1 = EPD_WIDTH - 1;
    if (y1 >= EPD_HEIGHT) y1 = EPD_HEIGHT - 1;

    EPD_ReadBusy();
    EPD_LoadLUT(hlcdc, 2);
    EPD_Gray2ToMonoDither();
    EPD_SetPartialWindow(hlcdc, x0, y0, x1, y1);

    old_region = EPD_AllocMonoRegionBuffer(mixed_framebuffer_prev_mono, x0, y0,
                                           x1, y1, &old_len);
    if (old_region == RT_NULL)
    {
        rt_kprintf("EPD partial old region alloc failed, fallback to full refresh\n");
        EPD_FrameBuffer_Flush(hlcdc);
        return;
    }

    new_region = EPD_AllocMonoRegionBuffer(mixed_framebuffer_mono, x0, y0, x1,
                                           y1, &new_len);
    if (new_region == RT_NULL)
    {
        rt_free(old_region);
        rt_kprintf("EPD partial new region alloc failed, fallback to full refresh\n");
        EPD_FrameBuffer_Flush(hlcdc);
        return;
    }

    if (old_len != new_len)
    {
        rt_kprintf("EPD partial region len mismatch old=%lu new=%lu\n",
                   (unsigned long)old_len, (unsigned long)new_len);
        rt_free(old_region);
        rt_free(new_region);
        EPD_FrameBuffer_Flush(hlcdc);
        return;
    }

    EPD_SendCommandDataBuf(hlcdc, 0x10, old_region, (uint16_t)old_len);
    EPD_SendCommandDataBuf(hlcdc, 0x13, new_region, (uint16_t)new_len);
    refresh_start = rt_tick_get();
    EPD_Refresh(hlcdc);
    refresh_end = rt_tick_get();
    rt_kprintf("[standby_dbg] epd partial refresh done area=(%d,%d)-(%d,%d) elapsed=%u ms partial_count=%u\n",
               x0, y0, x1, y1,
               epd_ticks_to_ms(refresh_end - refresh_start),
               (unsigned int)s_partial_refresh_count);

    rt_free(old_region);
    rt_free(new_region);

    src_stride = (uint16_t)(EPD_WIDTH / 8U);
    x0_byte = (uint16_t)(x0 / 8U);
    x1_byte = (uint16_t)(x1 / 8U);
    row_bytes = (uint16_t)(x1_byte - x0_byte + 1U);

    for (uint16_t row = y0; row <= y1; row++)
    {
        uint8_t *dst = mixed_framebuffer_prev_mono + ((uint32_t)row * src_stride) + x0_byte;
        const uint8_t *src = mixed_framebuffer_mono + ((uint32_t)row * src_stride) + x0_byte;
        memcpy(dst, src, row_bytes);
    }

    if (s_partial_refresh_count < 0xFF)
    {
        s_partial_refresh_count++;
    }
    EPD_ClearDirtyRegion();
}
static void epd_busy_callback(void *args)
{
    rt_sem_release(epd_busy_sem);
    rt_pin_irq_enable(2, PIN_IRQ_DISABLE);
}

static void epd_sem_init(void)
{
    if (epd_busy_sem != RT_NULL)
    {
        return;
    }
    epd_busy_sem = rt_sem_create("epd_busy", 0, RT_IPC_FLAG_FIFO);
    if (epd_busy_sem == RT_NULL)
    {
        rt_kprintf("EPD busy semaphore create failed!\n");
        return;
    }
    rt_pin_mode(2, PIN_MODE_INPUT_PULLUP);
    rt_err_t irq_ret = rt_pin_attach_irq(2, PIN_IRQ_MODE_HIGH_LEVEL,
                                         epd_busy_callback, RT_NULL);
    if (irq_ret != RT_EOK)
    {
        rt_kprintf("EPD BUSY IRQ attach failed!\n");
        rt_sem_delete(epd_busy_sem);
        epd_busy_sem = RT_NULL;
        return;
    }
    rt_pin_irq_enable(2, PIN_IRQ_ENABLE);
}

static void EPD_ReadBusy(void)
{
    /* Follow vendor sample: busy=0 means busy, wait until BUSY goes high. */
    rt_tick_t start = rt_tick_get();
    rt_tick_t timeout = rt_tick_from_millisecond(10000);

    while (rt_pin_read(2) == 0)
    {
        if ((rt_tick_get() - start) > timeout)
        {
            rt_kprintf("EPD busy wait timeout! pin=%d\n", rt_pin_read(2));
            break;
        }
        rt_thread_mdelay(5);
    }
    rt_thread_mdelay(2);
}

static void EPD_Reset(LCDC_HandleTypeDef *hlcdc)
{
    rt_pin_write(0, 1);
    rt_thread_delay(200);
    rt_pin_write(0, 0);
    rt_thread_delay(2);
    rt_pin_write(0, 1);
    rt_thread_delay(200);

    LUT_Flag = 0;
}
static void LCD_ReadMode(LCDC_HandleTypeDef *hlcdc, bool enable)
{
    if (HAL_LCDC_IS_SPI_IF(lcdc_int_cfg.lcd_itf))
    {
        if (enable)
        {
            HAL_LCDC_SetFreq(hlcdc, 2800000);
        }
        else
        {
            HAL_LCDC_SetFreq(hlcdc, lcdc_int_cfg.freq);
        }
    }
}

static void LCD_Drv_Init(LCDC_HandleTypeDef *hlcdc, uint8_t Mode)
{
    memcpy(&hlcdc->Init, &lcdc_int_cfg, sizeof(LCDC_InitTypeDef));
    HAL_LCDC_Init(hlcdc);
    rt_pin_mode(0, PIN_MODE_OUTPUT);
    rt_pin_mode(2, PIN_MODE_INPUT);
    epd_sem_init();
    EPD_Reset(hlcdc);


    // 扫描配置
#if EPD_USE_SCAN_MODE3
    // 参考屏厂“扫描反向3”路径：配合 0x91/0x90 全窗地址
    uint8_t scan_data[2] = {0x37, 0x0A};
#else
    uint8_t scan_data[2] = {0x3F, 0x0A};
#endif
    EPD_SendCommandDataBuf(hlcdc, 0x00, scan_data, 2);

    // Resolution register uses controller scan total
    uint8_t resolution_data[4] = {
        (uint8_t)(EPD_SCAN_SRC_PIXELS >> 8),
        (uint8_t)(EPD_SCAN_SRC_PIXELS & 0xFF),
        (uint8_t)(EPD_SCAN_GATE_PIXELS >> 8),
        (uint8_t)(EPD_SCAN_GATE_PIXELS & 0xFF),
    };
    EPD_SendCommandDataBuf(hlcdc, 0x61, resolution_data, 4);
    EPD_ReadBusy();

#if EPD_USE_SCAN_MODE3
    EPD_SetFullWindow(hlcdc);
#else
    // Scan starting address
    uint8_t scan_addr_data[4] = {0x00, 0x00, 0x00, 0x00};
    EPD_SendCommandDataBuf(hlcdc, 0x65, scan_addr_data, 4);
#endif

    // PFS
    EPD_SendCommandData(hlcdc, 0x03, 0x30);

    // Power Setting
    uint8_t power_data[5] = {0x07, 0x17, 0x3F, 0x3F, 0x17};
    EPD_SendCommandDataBuf(hlcdc, 0x01, power_data, 5);

    // Vcom Voltage setting
    EPD_SendCommandData(hlcdc, 0x82, 0x25);

    // Power boost setting
    uint8_t boost_data[4] = {0x25, 0x25, 0x3C, 0x37};
    EPD_SendCommandDataBuf(hlcdc, 0x06, boost_data, 4);

    // Border and color setting
    uint8_t border_data[2] = {0x29, 0x07};
    EPD_SendCommandDataBuf(hlcdc, 0x50, border_data, 2);

    // Frame Frequence
    EPD_SendCommandData(hlcdc, 0x30, 0x09);

    // Gate Scan mode
    EPD_SendCommandData(hlcdc, 0xE1, 0x02);

    // Power ON
    EPD_SendCommand(hlcdc, 0x04);
    EPD_ReadBusy();

    /* Initialize old RAM to white baseline. */
    EPD_FrameBuffer_Init();
    EPD_SendCommandDataBuf(hlcdc, 0x10, mixed_framebuffer_mono, EPD_MONO_FRAME_SIZE);
}



// EPD 刷新显示
static void EPD_Refresh(LCDC_HandleTypeDef *hlcdc)
{
    EPD_SendCommand(hlcdc, 0x12);
    EPD_ReadBusy();
#if EPD_USE_SCAN_MODE3
    EPD_SendCommand(hlcdc, 0x92);
#endif
}

// 加载 GC 模式的 LUT 表
// 注意: 需要定义 LUT_GC 数组(282字节)
static void LUTGC(LCDC_HandleTypeDef *hlcdc)
{
    // 假设 LUT_GC 是一个外部定义的数组
    // 如果没有定义，需要先定义这个数组
    extern const unsigned char LUT_GC[282];
    
    // 0x20: VCOM LUT (60 bytes)
    EPD_SendCommandDataBuf(hlcdc, 0x20, &LUT_GC[0], 60);
    
    // 0x21: W2W LUT (42 bytes)
    EPD_SendCommandDataBuf(hlcdc, 0x21, &LUT_GC[60], 42);
    
    // 0x22: K2W LUT (60 bytes)
    EPD_SendCommandDataBuf(hlcdc, 0x22, &LUT_GC[102], 60);
    
    // 0x23: W2K LUT (60 bytes)
    EPD_SendCommandDataBuf(hlcdc, 0x23, &LUT_GC[162], 60);
    
    // 0x24: K2K LUT (60 bytes)
    EPD_SendCommandDataBuf(hlcdc, 0x24, &LUT_GC[222], 60);
}

void EPD_Clear(LCDC_HandleTypeDef *hlcdc)
{
    // 加载 GC 模式的 LUT
    LUTGC(hlcdc);

    /* Baseline clear: force both old/new to white, then full refresh twice. */
    EPD_FrameBuffer_Clear();
    EPD_SendCommandDataBuf(hlcdc, 0x10, mixed_framebuffer_mono, EPD_MONO_FRAME_SIZE);
    EPD_SendCommandDataBuf(hlcdc, 0x13, mixed_framebuffer_mono, EPD_MONO_FRAME_SIZE);
    EPD_Refresh(hlcdc);
    EPD_Refresh(hlcdc);
}


void EPD_Sleep(LCDC_HandleTypeDef *hlcdc)
{
    EPD_SendCommandData(hlcdc, 0x10, 0x01); // DEEP_SLEEP_MODE
}

static void LCD_Init(LCDC_HandleTypeDef *hlcdc)
{
    LCD_Drv_Init(hlcdc, EPD_FULL);
    rt_kprintf("EPD initialized\n");
    // rt_thread_mdelay(1000);
    rt_kprintf("EPD initialized\n");
    EPD_Clear(hlcdc);
    rt_kprintf("EPD initialized\n");
#if EPD_SELF_TEST_PATTERN
    EPD_DrawCenteredCircleTest();
    EPD_FrameBuffer_Flush(hlcdc);
#endif
    // rt_thread_mdelay(10000);
}

static uint32_t LCD_ReadID(LCDC_HandleTypeDef *hlcdc)
{
    uint32_t epd_id = 0x09ff;
    // 读取ID，并打印
    uint8_t id_data[10] = {0};
    
    for (int i = 0; i < 10; i++)
    {
        id_data[i] = (uint8_t)LCD_ReadData(hlcdc, 0x2E, 1);
        rt_kprintf("EPD ID byte %d: 0x%x\n", i, id_data[i]);
    }

    // rt_kprintf("EPD ID: 0x%x (240x416 mono EPD)", epd_id);
    return epd_id;
}
static void LCD_DisplayOn(LCDC_HandleTypeDef *hlcdc)
{
}

static void LCD_DisplayOff(LCDC_HandleTypeDef *hlcdc)
{
}
static void LCD_SetRegion(LCDC_HandleTypeDef *hlcdc, uint16_t Xpos0,
                          uint16_t Ypos0, uint16_t Xpos1, uint16_t Ypos1)
{
    if (Xpos1 >= EPD_LOGICAL_WIDTH) Xpos1 = EPD_LOGICAL_WIDTH - 1;
    if (Ypos1 >= EPD_LOGICAL_HEIGHT) Ypos1 = EPD_LOGICAL_HEIGHT - 1;
    HAL_LCDC_SetROIArea(hlcdc, Xpos0, Ypos0, Xpos1, Ypos1);
}

static void LCD_WritePixel(LCDC_HandleTypeDef *hlcdc, uint16_t Xpos,
                           uint16_t Ypos, const uint8_t *RGBCode)
{
    if (RGBCode == NULL || Xpos >= EPD_LOGICAL_WIDTH || Ypos >= EPD_LOGICAL_HEIGHT)
    {
        return;
    }
    rt_kprintf("EPD single pixel: (%d,%d)\n", Xpos, Ypos);
    // 更新帧缓冲区单个像素
    if (g_input_color_mode == RTGRAPHIC_PIXEL_FORMAT_RGB565 ||
        g_input_color_mode == LCDC_PIXEL_FORMAT_RGB565)
    {
        EPD_FrameBuffer_UpdateRegionRGB565(RGBCode, Xpos, Ypos, Xpos, Ypos);
    }
    else
    {
        EPD_FrameBuffer_UpdateRegion(RGBCode, Xpos, Ypos, Xpos, Ypos);
    }
    EPD_MarkDirtyLogicalRegion(Xpos, Ypos, Xpos, Ypos);
    
    // 注意: 单像素写入不会立即刷新屏幕，需要调用者手动触发刷新
    // 如果需要立即刷新，取消下面的注释
    // EPD_FrameBuffer_Flush(hlcdc);
}

static void LCD_WriteMultiplePixels(LCDC_HandleTypeDef *hlcdc,
                                    const uint8_t *RGBCode, uint16_t Xpos0,
                                    uint16_t Ypos0, uint16_t Xpos1,
                                    uint16_t Ypos1)
{
    uint8_t should_flush_now;
    uint16_t upd_x0;
    uint16_t upd_y0;
    uint16_t upd_x1;
    uint16_t upd_y1;

    if (RGBCode == NULL || Xpos0 > Xpos1 || Ypos0 > Ypos1)
    {
        rt_kprintf("EPD multiple pixels param error\n");
        return;
    }
    EPD_GetEffectiveUpdateRegion(hlcdc, Xpos0, Ypos0, Xpos1, Ypos1,
                                 &upd_x0, &upd_y0, &upd_x1, &upd_y1);
    rt_kprintf("EPD multiple pixels src:(%d,%d)-(%d,%d) roi:(%d,%d)-(%d,%d)\n",
               Xpos0, Ypos0, Xpos1, Ypos1, upd_x0, upd_y0, upd_x1, upd_y1);

    if (!s_frame_collecting)
    {
        s_frame_collecting = 1;
    }

    if (g_input_color_mode == RTGRAPHIC_PIXEL_FORMAT_RGB565 ||
        g_input_color_mode == LCDC_PIXEL_FORMAT_RGB565)
    {
        EPD_FrameBuffer_UpdateRegionRGB565FromSrcArea(RGBCode, Xpos0, Ypos0,
                                                      Xpos1, Ypos1, upd_x0,
                                                      upd_y0, upd_x1, upd_y1);
    }
    else
    {
        EPD_FrameBuffer_UpdateRegionFromSrcArea(RGBCode, Xpos0, Ypos0, Xpos1,
                                                Ypos1, upd_x0, upd_y0,
                                                upd_x1, upd_y1);
    }
    EPD_MarkDirtyLogicalRegion(upd_x0, upd_y0, upd_x1, upd_y1);
    should_flush_now = EPD_ShouldFlushCurrentROI(hlcdc, upd_x1, upd_y1);

    if (!should_flush_now)
    {
        rt_kprintf("[standby_dbg] epd defer flush src=(%d,%d)-(%d,%d) roi=(%d,%d)-(%d,%d) dirty=(%d,%d)-(%d,%d)\n",
                   Xpos0, Ypos0, Xpos1, Ypos1,
                   hlcdc->roi.x0, hlcdc->roi.y0, hlcdc->roi.x1, hlcdc->roi.y1,
                   s_dirty_x0, s_dirty_y0, s_dirty_x1, s_dirty_y1);
    }
    else
    {
        rt_tick_t min_interval = rt_tick_from_millisecond(300);
        rt_tick_t now = rt_tick_get();
        rt_tick_t elapsed = now - s_last_epd_refresh_tick;

        if ((s_last_epd_refresh_tick != 0) && (elapsed < min_interval))
        {
            rt_thread_delay(min_interval - elapsed);
        }

        rt_kprintf("[standby_dbg] epd forced gc full flush src=(%d,%d)-(%d,%d) dirty_valid=%d dirty=(%d,%d)-(%d,%d)\n",
                   Xpos0, Ypos0, Xpos1, Ypos1,
                   s_dirty_area_valid,
                   s_dirty_x0, s_dirty_y0, s_dirty_x1, s_dirty_y1);
        EPD_FrameBuffer_Flush(hlcdc);
        s_last_epd_refresh_tick = rt_tick_get();
        s_frame_collecting = 0;
    }

    reflesh_times++;

    /*
     * EPD path uses synchronous command writes (not LCDC layer DMA), so there is
     * no hardware transfer-complete IRQ to release drv_lcd draw_sem.
     * Notify completion explicitly to avoid draw_core timeout in lcd_task.
     */
    if (hlcdc->XferCpltCallback != NULL)
    {
        hlcdc->XferCpltCallback(hlcdc);
    }
}
static void LCD_WriteReg(LCDC_HandleTypeDef *hlcdc, uint16_t LCD_Reg,
                         uint8_t *Parameters, uint32_t NbParameters)
{
    EPD_ReadBusy();
    HAL_LCDC_WriteU8Reg(hlcdc, LCD_Reg, Parameters, NbParameters);
}
static uint32_t LCD_ReadData(LCDC_HandleTypeDef *hlcdc, uint16_t RegValue,
                             uint8_t ReadSize)
{
    uint32_t rd_data = 0;
    EPD_ReadBusy();
    LCD_ReadMode(hlcdc, true);
    HAL_LCDC_ReadU8Reg(hlcdc, RegValue, (uint8_t *)&rd_data, ReadSize);
    LCD_ReadMode(hlcdc, false);

    return rd_data;
}

static uint32_t LCD_ReadPixel(LCDC_HandleTypeDef *hlcdc, uint16_t Xpos,
                              uint16_t Ypos)
{
    if (Xpos >= LCD_PIXEL_WIDTH || Ypos >= LCD_PIXEL_HEIGHT)
    {
        LOG_W("EPD read pixel out of range");
        return 0;
    }

    LCD_SetRegion(hlcdc, Xpos, Ypos, Xpos, Ypos);
    uint8_t read_data = (uint8_t)LCD_ReadData(hlcdc, 0x2E, 1);
    uint32_t color = (read_data & 0x80) ? 0xFFFFFF : 0x000000;
    LOG_D("EPD read pixel: (%d,%d), color: 0x%x", Xpos, Ypos, color);
    return color;
}

static void LCD_SetColorMode(LCDC_HandleTypeDef *hlcdc, uint16_t color_mode)
{
    if (color_mode != RTGRAPHIC_PIXEL_FORMAT_RGB332 &&
        color_mode != LCDC_PIXEL_FORMAT_RGB332 &&
        color_mode != RTGRAPHIC_PIXEL_FORMAT_RGB565 &&
        color_mode != LCDC_PIXEL_FORMAT_RGB565)
    {
        rt_kprintf("EPD unsupported input mode: %d\n",
                   color_mode);
        return;
    }
    g_input_color_mode = color_mode;
    lcdc_int_cfg.color_mode = LCDC_PIXEL_FORMAT_RGB332;
    HAL_LCDC_SetOutFormat(hlcdc, lcdc_int_cfg.color_mode);
    // rt_kprintf("EPD set color mode: mono-color (1bit)\n");
}

static void LCD_SetBrightness(LCDC_HandleTypeDef *hlcdc, uint8_t br)
{
    LOG_W("EPD has no brightness adjustment, ignore br: %d", br);
}

static void LCD_IdleModeOn(LCDC_HandleTypeDef *hlcdc)
{
    EPD_EnterDeepSleep(hlcdc);
    BSP_LCD_PowerDown();
    BSP_LCD_Reset(0);
}

static void LCD_IdleModeOff(LCDC_HandleTypeDef *hlcdc)
{
    BSP_LCD_PowerUp();
    BSP_LCD_Reset(1);
    HAL_Delay(1);
    LCD_Drv_Init(hlcdc, EPD_FULL);
}
static void EPD_LoadLUT(LCDC_HandleTypeDef *hlcdc, uint8_t lut_mode)
{
    uint16_t count;
    switch (lut_mode)
    {
    case 0: // 5S模式（清屏）
        LCD_WriteReg(hlcdc, REG_LUT_VCOM, lut_R20_5S, 56);
        LCD_WriteReg(hlcdc, REG_LUT_W2W, lut_R21_5S, 42);
        LCD_WriteReg(hlcdc, REG_LUT_K2K, lut_R24_5S, 42);

        if (LUT_Flag == 0)
        {
            LCD_WriteReg(hlcdc, REG_LUT_K2W, lut_R22_5S, 56);
            LCD_WriteReg(hlcdc, REG_LUT_W2K, lut_R23_5S, 42);
            LUT_Flag = 1;
        }
        else
        {
            LCD_WriteReg(hlcdc, REG_LUT_K2W, lut_R23_5S, 56);
            LCD_WriteReg(hlcdc, REG_LUT_W2K, lut_R22_5S, 42);
            LUT_Flag = 0;
        }
        break;

    case 1: // GC模式（全刷无残影）
        LCD_WriteReg(hlcdc, REG_LUT_VCOM, lut_R20_GC, 56);
        LCD_WriteReg(hlcdc, REG_LUT_W2W, lut_R21_GC, 42);
        LCD_WriteReg(hlcdc, REG_LUT_K2K, lut_R24_GC, 42);
        if (LUT_Flag == 0)
        {
            LCD_WriteReg(hlcdc, REG_LUT_K2W, lut_R22_GC, 56);
            LCD_WriteReg(hlcdc, REG_LUT_W2K, lut_R23_GC, 42);
            LUT_Flag = 1;
        }
        else
        {
            LCD_WriteReg(hlcdc, REG_LUT_K2W, lut_R23_GC, 56);
            LCD_WriteReg(hlcdc, REG_LUT_W2K, lut_R22_GC, 42);
            LUT_Flag = 0;
        }
        break;
    case 2: // DU模式（局部刷有残影）
        LCD_WriteReg(hlcdc, REG_LUT_VCOM, lut_R20_DU, 56);
        LCD_WriteReg(hlcdc, REG_LUT_W2W, lut_R21_DU, 42);
        LCD_WriteReg(hlcdc, REG_LUT_K2K, lut_R24_DU, 42);
        if (LUT_Flag == 0)
        {
            LCD_WriteReg(hlcdc, REG_LUT_K2W, lut_R22_DU, 56);
            LCD_WriteReg(hlcdc, REG_LUT_W2K, lut_R23_DU, 42);
            LUT_Flag = 1;
        }
        else
        {
            LCD_WriteReg(hlcdc, REG_LUT_K2W, lut_R23_DU, 56);
            LCD_WriteReg(hlcdc, REG_LUT_W2K, lut_R22_DU, 42);
            LUT_Flag = 0;
        }
        break;
    default:
        break;
    }
}

static void EPD_DisplayImage(LCDC_HandleTypeDef *hlcdc, uint8_t img_flag)
{
    uint16_t row, col;
    uint16_t pcnt = 0;
    uint8_t *temp_buf = rt_malloc(PICTURE_LENGTH);

    if (temp_buf == RT_NULL)
    {
        rt_kprintf("EPD image buf malloc failed\n");
        return;
    }

    for (col = 0; col < LCD_VER_RES_MAX; col++)
    {
        for (row = 0; row < LCD_HOR_RES_MAX / 8; row++)
        {
            switch (img_flag)
            {
            case PIC_BLACK:
                temp_buf[pcnt] = 0x00;
                break;
            case PIC_WHITE:
                temp_buf[pcnt] = 0xFF;
                break;
            case PIC_LEFT_BLACK_RIGHT_WHITE:
                temp_buf[pcnt] = (col >= LCD_VER_RES_MAX / 2) ? 0xFF : 0x00;
                break;
            case PIC_UP_BLACK_DOWN_WHITE:
                temp_buf[pcnt] = (row > LCD_HOR_RES_MAX / 16)    ? 0xFF
                                 : (row == LCD_HOR_RES_MAX / 16) ? 0x0F
                                                                 : 0x00;
                break;
            default:
                temp_buf[pcnt] = 0x00;
                break;
            }
            pcnt++;
        }
    }

    LCD_WriteReg(hlcdc, REG_WRITE_NEW_DATA, temp_buf, PICTURE_LENGTH);
    rt_free(temp_buf);

    uint8_t parameter[5];
    parameter[0] = 0xA5;
    LCD_WriteReg(hlcdc, REG_AUTO_REFRESH, parameter, 1);
    EPD_ReadBusy();
}
static void EPD_EnterDeepSleep(LCDC_HandleTypeDef *hlcdc)
{
    uint8_t parameter[5];
    parameter[0] = 0xA5;
    LCD_WriteReg(hlcdc, 0x07, parameter, 1);
}
static void EPD_TemperatureMeasure(LCDC_HandleTypeDef *hlcdc)
{
    uint8_t parameter[5];
    LCD_WriteReg(hlcdc, REG_PWR_ON_MEASURE, RT_NULL, 0);
    parameter[0] = 0xA5;
    LCD_WriteReg(hlcdc, REG_TEMP_SEL, parameter, 1);
    LCD_WriteReg(hlcdc, REG_TEMP_CALIB, RT_NULL, 0);
    EPD_ReadBusy();

    HAL_LCDC_ReadDatas(hlcdc, REG_TEMP_READ, 0, &Var_Temp, 1);
    // rt_kprintf("EPD internal temp: %d °C", (int8_t)Var_Temp);
}

static const LCD_DrvOpsDef epd_spi_drv = {
    .Init = LCD_Init,
    .ReadID = LCD_ReadID,
    .DisplayOn = LCD_DisplayOn,
    .DisplayOff = LCD_DisplayOff,
    .SetRegion = LCD_SetRegion,
    .WritePixel = LCD_WritePixel,
    .WriteMultiplePixels = LCD_WriteMultiplePixels,
    .ReadPixel = LCD_ReadPixel,
    .SetColorMode = LCD_SetColorMode,
    .SetBrightness = LCD_SetBrightness,
    .IdleModeOn = LCD_IdleModeOn,
    .IdleModeOff = LCD_IdleModeOff,
};

LCD_DRIVER_EXPORT(epd_spi, EPD_LCD_ID, &lcdc_int_cfg, &epd_spi_drv,
                  LCD_PIXEL_WIDTH, LCD_PIXEL_HEIGHT, 16);
