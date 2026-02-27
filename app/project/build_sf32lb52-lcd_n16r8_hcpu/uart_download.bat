@echo off
title=uart download
set WORK_PATH=%~dp0
set CURR_PATH=%cd%
cd %WORK_PATH%
:start
echo,
echo      Uart Download
echo,
set /p input=please input the serial port num:
goto download
:download
echo com%input%
sftool -p COM%input% -c SF32LB52 -m nor write_flash "bootloader/bootloader.bin@0x12208000" "main.bin/ER_IROM2.bin@0x12AE0000" "main.bin/ER_IROM3.bin@0x12460000" "main.bin/ER_IROM1.bin@0x12218000" "dfu_pan/dfu_pan.bin@0x12008000" "ftab/ftab.bin@0x12000000"

if "%ENV_ROOT%"=="" pause

