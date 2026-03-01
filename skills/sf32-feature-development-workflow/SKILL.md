---
name: sf32-feature-development-workflow
description: Use when implementing or fixing features in this SF32 Xiaozhi project and you need a repeatable build-to-device validation loop; 适用于功能开发或修复时执行标准闭环。
---

# SF32 功能开发流程

## 概述
使用稳定的端到端闭环：确认板卡目标、最小改动实现、编译、烧录、连接 PAN、板端验证运行行为。

## 工作流
1. 在 `app/project/sf32lb52-*_hcpu/` 确认板卡目标与配置。
2. 通过 `skills/references/architecture-map.md` 追踪影响路径，选择最小改动集。
3. 优先在 `app/src/` 实现；除非必要，不改 `sdk/`。
4. 使用项目命令编译（根目录 README 示例）：
   - `scons --board=sf32lb52-lcd_n16r8 --menuconfig`
5. 按 `docs/src/get-started/README.md` 完成烧录与上电流程。
6. 板端按顺序验证：
   - BT 与 PAN 连接状态
   - 服务握手（WebSocket/MQTT）
   - 音频输入/输出行为
   - UI 状态切换
7. 若失败，按层定位并迭代（main 事件循环、协议层、音频层、UI 层、IoT/MCP 层）。

## 检查清单
- 已确认板卡目标。
- 改动文件限定在必要模块内。
- 编译命令执行成功。
- 设备烧录完成。
- 已在真实板端验证运行路径。
- 已记录回归风险（线程/定时器/共享状态）。
