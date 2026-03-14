---
name: sf32-uart-download
description: Use when flashing the SF32LB52 LCD N16R8 HCPU firmware in this repo via UART; enter app/project/build_sf32lb52-lcd_n16r8_hcpu, export SDK tools into PATH, run ./uart_download.sh interactively, and select serial port index 0 when prompted.
---

# SF32 UART 下载

## 适用场景
- 用户要求给 `sf32lb52-lcd_n16r8_hcpu` 目标下载/烧录程序。
- 用户明确要求进入 `app/project/build_sf32lb52-lcd_n16r8_hcpu` 执行 `./uart_download.sh`。

## 工作流
1. 进入目录：
   - `app/project/build_sf32lb52-lcd_n16r8_hcpu`
2. 先导出 SDK 工具环境，避免 `sftool` 不在 PATH：
   - `eval "$(python3 sdk/tools/sifli_sdk_tools.py export)"`
3. 运行下载脚本：
   - `./uart_download.sh`
4. 出现串口列表后，默认输入 `0`。
5. 观察 `sftool` 输出，等待流程结束。

## 执行命令
在仓库根目录执行：

```bash
eval "$(python3 /Users/hiveton/HivetonCode/hiveton-wodle-xiaozhi/sdk/tools/sifli_sdk_tools.py export)"
cd /Users/hiveton/HivetonCode/hiveton-wodle-xiaozhi/app/project/build_sf32lb52-lcd_n16r8_hcpu
./uart_download.sh
```

## 预期现象
- 串口列表中通常会看到类似 `/dev/cu.usbserial-*` 的设备。
- 提示 `Enter index OR type a port` 时输入 `0`。
- 流程中可能先看到一次 `Received unknown response code: 0x53`，只要后续继续进入 `Download stub success!` 并完成写入/校验，就可视为本次下载成功。
- 成功时会出现类似这些阶段：
  - `Connected success!`
  - `Download stub success!`
  - `Downloaded successfully`
  - `Verify success!`

## 失败处理
- `sftool not found`：
  - 重新执行 `eval "$(python3 sdk/tools/sifli_sdk_tools.py export)"`
- 没有检测到串口：
  - 确认开发板已连接并处于可下载状态，再重试脚本。
- 选择串口时不要把 `0` 当成脚本参数直接传入：
  - `./uart_download.sh 0` 会把 `0` 当作端口字符串，不会映射到第 0 个串口。
