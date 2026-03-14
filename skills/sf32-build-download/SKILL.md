---
name: sf32-build-download
description: Use when code changes in this repository should be followed by the standard SF32LB52 LCD N16R8 compile-and-download loop; 适用于本项目改完代码后需要执行固定闭环：先在 `sdk/` 下 source `export.sh` 导入环境，再在 `app/project` 执行 `scons --board=sf32lb52-lcd_n16r8` 编译，最后进入 `build_sf32lb52-lcd_n16r8_hcpu` 运行 `./uart_download.sh` 并默认选择串口索引 `0`。
---

# SF32 编译下载

## 概述

执行固定闭环：导入 SDK 环境、编译 `sf32lb52-lcd_n16r8`、串口下载到板子。默认把它当作本项目“改完代码后的编译下载流程”，优先使用脚本 `scripts/build_download.sh`，避免每次手动切目录和重复输入。

## 工作流

1. 在仓库根目录执行脚本：
   - `skills/sf32-build-download/scripts/build_download.sh`
2. 脚本会依次执行：
   - 进入 `sdk/`
   - `. ./export.sh`
   - 进入 `app/project/`
   - `scons --board=sf32lb52-lcd_n16r8`
   - 进入 `app/project/build_sf32lb52-lcd_n16r8_hcpu/`
   - 运行 `./uart_download.sh`
3. 下载阶段默认向提示输入 `0`，即选择第 0 个串口。
4. 若编译失败，流程会立刻停止，不进入下载。

## 常用命令

完整执行：

```bash
/Users/hiveton/HivetonCode/hiveton-wodle-xiaozhi/skills/sf32-build-download/scripts/build_download.sh
```

仅编译，不下载：

```bash
/Users/hiveton/HivetonCode/hiveton-wodle-xiaozhi/skills/sf32-build-download/scripts/build_download.sh --build-only
```

只查看将执行哪些步骤：

```bash
/Users/hiveton/HivetonCode/hiveton-wodle-xiaozhi/skills/sf32-build-download/scripts/build_download.sh --dry-run
```

## 约束

- 板卡目标固定为 `sf32lb52-lcd_n16r8`。
- 环境导入必须在 `sdk/` 目录下通过 `. ./export.sh` 完成，不能直接执行脚本。
- 下载默认选择串口索引 `0`；若当前环境不是第 0 个串口，用 `--port-selection` 改掉输入值。
- 若用户只要求下载、不要求编译，优先使用已有的 `skills/sf32-uart-download/SKILL.md`。

## 资源

### scripts/
- `scripts/build_download.sh`: 执行导环境、编译、下载的一体化脚本。
