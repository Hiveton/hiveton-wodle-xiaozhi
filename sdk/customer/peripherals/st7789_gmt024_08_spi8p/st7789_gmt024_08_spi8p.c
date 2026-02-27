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

#define EPD_WIDTH 528
#define EPD_HEIGHT 792

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
#define LCD_PIXEL_WIDTH 240
#define LCD_PIXEL_HEIGHT 240
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
static void EPD_SendCommandDataBuf(LCDC_HandleTypeDef *hlcdc, uint8_t cmd,
                                   const uint8_t *data, uint16_t len);

L2_NON_RET_BSS_SECT_BEGIN(frambuf)
L2_NON_RET_BSS_SECT(frambuf,
                    ALIGN(64) static uint8_t mixed_framebuffer[EPD_WIDTH / 8 * EPD_HEIGHT]);
L2_NON_RET_BSS_SECT_END

static uint8_t framebuffer_initialized = 0;

static rt_sem_t epd_busy_sem = RT_NULL;

/**
 * @brief 初始化帧缓冲区为全白
 */
static void EPD_FrameBuffer_Init(void)
{
    memset(mixed_framebuffer, 0xFF, EPD_WIDTH / 8 * EPD_HEIGHT);
    framebuffer_initialized = 1;
}

/**
 * @brief 更新帧缓冲区指定区域的数据
 * @param data 源数据指针(RGB332格式，每字节一个像素)
 * @param x0 起始X坐标
 * @param y0 起始Y坐标
 * @param x1 结束X坐标
 * @param y1 结束Y坐标
 * @note 将RGB332数据转换为1bpp格式存入缓冲区
 */
static void EPD_FrameBuffer_UpdateRegion(const uint8_t *data, uint16_t x0, uint16_t y0, 
                                          uint16_t x1, uint16_t y1)
{
    if (data == NULL || x0 > x1 || y0 > y1)
    {
        return;
    }
    
    // 边界检查
    if (x1 >= EPD_WIDTH) x1 = EPD_WIDTH - 1;
    if (y1 >= EPD_HEIGHT) y1 = EPD_HEIGHT - 1;
    
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
            
            // 将RGB332转换为1bpp (简单阈值判断)
            // RGB332: RRRGGGBB, 计算灰度值
            uint8_t r = (pixel >> 5) & 0x07;  // 3 bits
            uint8_t g = (pixel >> 2) & 0x07;  // 3 bits
            uint8_t b = pixel & 0x03;         // 2 bits
            // 灰度近似: (R*3 + G*3 + B*2) / 8 * 32
            uint16_t gray = r * 36 + g * 36 + b * 64;  // 0-252 范围
            uint8_t mono = (gray > 126) ? 1 : 0;  // 1=白, 0=黑
            
            // 计算在帧缓冲区中的位置 (1bpp格式)
            uint32_t byte_idx = y * (EPD_WIDTH / 8) + (x / 8);
            uint8_t bit_pos = 7 - (x % 8);  // MSB first
            
            if (mono)
            {
                mixed_framebuffer[byte_idx] |= (1 << bit_pos);   // 设置为白
            }
            else
            {
                mixed_framebuffer[byte_idx] &= ~(1 << bit_pos);  // 设置为黑
            }
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
    if (x1 >= EPD_WIDTH) x1 = EPD_WIDTH - 1;
    if (y1 >= EPD_HEIGHT) y1 = EPD_HEIGHT - 1;
    
    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }
    
    // x坐标对齐到字节边界
    uint16_t x0_byte = x0 / 8;
    uint16_t x1_byte = x1 / 8;
    uint16_t src_bytes_per_row = x1_byte - x0_byte + 1;
    
    for (uint16_t y = y0; y <= y1; y++)
    {
        uint32_t dst_offset = y * (EPD_WIDTH / 8) + x0_byte;
        uint32_t src_offset = (y - y0) * src_bytes_per_row;
        memcpy(&mixed_framebuffer[dst_offset], &data[src_offset], src_bytes_per_row);
    }
}

/**
 * @brief 将帧缓冲区全屏刷新到墨水屏
 * @param hlcdc LCDC句柄
 */
static void EPD_FrameBuffer_Flush(LCDC_HandleTypeDef *hlcdc)
{
    if (!framebuffer_initialized)
    {
        EPD_FrameBuffer_Init();
    }
    
    // 加载 GC 模式的 LUT
    LUTGC(hlcdc);
    
    // 使用Layer方式发送帧缓冲区数据
    uint32_t total_size = EPD_WIDTH / 8 * EPD_HEIGHT;
    
    // 设置 Layer 数据格式为 RGB332 (1字节/像素，实际是1bpp打包数据)
    HAL_LCDC_LayerSetFormat(hlcdc, HAL_LCDC_LAYER_DEFAULT, LCDC_PIXEL_FORMAT_RGB332);
    
    // 设置 Layer 数据源 - 整个帧缓冲区
    HAL_LCDC_LayerSetData(hlcdc, HAL_LCDC_LAYER_DEFAULT, mixed_framebuffer, 
                          0, 0, EPD_WIDTH / 8 - 1, EPD_HEIGHT - 1);
    
    // 发送数据到寄存器
    if (HAL_LCDC_SendLayerData2Reg_IT(hlcdc, REG_WRITE_NEW_DATA, 1) != HAL_OK)
    {
        rt_kprintf("EPD flush: SendLayerData failed\n");
        return;
    }
    
    // 刷新显示
    EPD_Refresh(hlcdc);
}

/**
 * @brief 清空帧缓冲区（填充白色）
 */
static void EPD_FrameBuffer_Clear(void)
{
    memset(mixed_framebuffer, 0xFF, EPD_WIDTH / 8 * EPD_HEIGHT);
    framebuffer_initialized = 1;
}

/**
 * @brief 填充帧缓冲区（填充黑色）
 */
static void EPD_FrameBuffer_Fill(void)
{
    memset(mixed_framebuffer, 0x00, EPD_WIDTH / 8 * EPD_HEIGHT);
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
    rt_pin_irq_enable(2, PIN_IRQ_ENABLE);
    rt_err_t result = rt_sem_take(epd_busy_sem, RT_TICK_PER_SECOND * 2);
    if (result != RT_EOK)
    {
        rt_kprintf("EPD busy wait timeout! (may cause display error)\n");
    }

    rt_sem_control(epd_busy_sem, RT_IPC_CMD_RESET, RT_NULL);
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


    // 扫描反向1
    uint8_t scan_data[2] = {0x3F, 0x0A};
    EPD_SendCommandDataBuf(hlcdc, 0x00, scan_data, 2);

    // Resolution
    uint8_t resolution_data[4] = {0x03, 0x18, 0x02, 0x58}; // 600
    EPD_SendCommandDataBuf(hlcdc, 0x61, resolution_data, 4);
    EPD_ReadBusy();

    // Scan starting address
    uint8_t scan_addr_data[4] = {0x00, 0x00, 0x00, 0x00};
    EPD_SendCommandDataBuf(hlcdc, 0x65, scan_addr_data, 4);

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
    // EPD_ReadBusy();
    rt_thread_delay(2000);

    // Write BW RAM - 填充白色
    // Note: Gate_Pixel和Source_Pixel需要根据实际屏幕参数定义
    // 这里使用EPD_WIDTH和EPD_HEIGHT
    uint16_t ram_size = (EPD_WIDTH / 8) * EPD_HEIGHT;
    uint8_t *ram_buf = rt_malloc(ram_size);
    if (ram_buf != RT_NULL)
    {
        memset(ram_buf, 0xFF, ram_size);
        EPD_SendCommandDataBuf(hlcdc, 0x10, ram_buf, ram_size);
        rt_free(ram_buf);
    }
}



// EPD 刷新显示
static void EPD_Refresh(LCDC_HandleTypeDef *hlcdc)
{
    EPD_SendCommand(hlcdc, 0x12);
    EPD_ReadBusy();
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
    
    // Write BW RAM - 填充白色
    uint32_t ram_size = (EPD_WIDTH / 8) * EPD_HEIGHT;
    uint8_t *ram_buf = rt_malloc(ram_size);
    if (ram_buf != RT_NULL)
    {
        memset(ram_buf, 0xFF, ram_size);
        EPD_SendCommandDataBuf(hlcdc, 0x13, ram_buf, ram_size);
        rt_free(ram_buf);
    }
    else
    {
        rt_kprintf("EPD clear ram buf malloc failed\n");
    }
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
    HAL_LCDC_SetROIArea(hlcdc, 0, 0, LCD_HOR_RES_MAX_8 - 1,
                        LCD_VER_RES_MAX - 1);
}

static void LCD_WritePixel(LCDC_HandleTypeDef *hlcdc, uint16_t Xpos,
                           uint16_t Ypos, const uint8_t *RGBCode)
{
    if (RGBCode == NULL || Xpos >= EPD_WIDTH || Ypos >= EPD_HEIGHT)
    {
        return;
    }
    rt_kprintf("EPD single pixel: (%d,%d)\n", Xpos, Ypos);
    // 更新帧缓冲区单个像素
    EPD_FrameBuffer_UpdateRegion(RGBCode, Xpos, Ypos, Xpos, Ypos);
    
    // 注意: 单像素写入不会立即刷新屏幕，需要调用者手动触发刷新
    // 如果需要立即刷新，取消下面的注释
    // EPD_FrameBuffer_Flush(hlcdc);
}

static void LCD_WriteMultiplePixels(LCDC_HandleTypeDef *hlcdc,
                                    const uint8_t *RGBCode, uint16_t Xpos0,
                                    uint16_t Ypos0, uint16_t Xpos1,
                                    uint16_t Ypos1)
{
    if (RGBCode == NULL || Xpos0 > Xpos1 || Ypos0 > Ypos1)
    {
        rt_kprintf("EPD multiple pixels param error\n");
        return;
    }
    rt_kprintf("EPD multiple pixels: (%d,%d)-(%d,%d)\n",
               Xpos0, Ypos0, Xpos1, Ypos1);

    // 更新帧缓冲区对应区域
    EPD_FrameBuffer_UpdateRegion(RGBCode, Xpos0, Ypos0, Xpos1, Ypos1);
    
    // 将帧缓冲区全屏刷新到墨水屏
    EPD_FrameBuffer_Flush(hlcdc);

    reflesh_times++;
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
        color_mode != LCDC_PIXEL_FORMAT_RGB332)
    {
        rt_kprintf("EPD only support mono-color, ignore mode: %d\n",
                   color_mode);
        return;
    }
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

static const LCD_DrvOpsDef epd_spi_drv = {LCD_Init,
                                          LCD_ReadID,
                                          LCD_DisplayOn,
                                          LCD_DisplayOff,
                                          LCD_SetRegion,
                                          LCD_WritePixel,
                                          LCD_WriteMultiplePixels,
                                          LCD_ReadPixel,
                                          LCD_SetColorMode,
                                          LCD_SetBrightness,
                                          LCD_IdleModeOn,
                                          LCD_IdleModeOff};

LCD_DRIVER_EXPORT(epd_spi, EPD_LCD_ID, &lcdc_int_cfg, &epd_spi_drv,
                  LCD_PIXEL_WIDTH, LCD_PIXEL_HEIGHT, 8);
