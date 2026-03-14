---
name: project-development-standards
description: Use when editing, extending, or reviewing code in this Hiveton Wodle Xiaozhi repository and you need the concrete project conventions for module boundaries, board/build selection, RT-Thread style, concurrency safety, UI/resource changes, and validation expectations; 适用于在本项目中按既有规范开发、修复或评审代码。
---

# 项目开发规范

## 何时使用
当任务会改动 `app/` 下代码、资源、板卡适配、IoT/MCP 能力，或需要判断“这类改动在本仓库里应该怎么做”时使用。

## 快速流程
1. 先读 `skills/references/project-standards.md`。
2. 再按任务需要补读：
   - 架构路径：`skills/references/architecture-map.md`
   - 构建与烧录：`README.md`、`docs/src/get-started/README.md`
3. 先确认目标板卡与传输模式，再决定最小改动面。

## 默认约束
- 默认只改 `app/`；只有在应用层无法完成需求时才进入 `sdk/`。
- 不编辑 `app/project/build_*`、`.sconsign.dblite` 这类生成产物。
- 涉及运行时行为时，优先复用既有 mailbox、message queue、timer、UI helper，不直接扩大全局共享状态。
- 涉及网络消息或能力扩展时，优先检查 WebSocket 与 MQTT 两条路径是否都需要同步。
- 涉及 LVGL/UI 时，优先通过 `xiaozhi_ui_*` 入口向 UI 线程发消息，不从其他线程直接操作界面对象。

## 模块规则
- 启动顺序与状态流不要随意重排，主入口在 `app/src/main.c`。
- 新增源文件后，记得同步 `app/src/SConscript` 或对应子目录 `SConscript`。
- 新增板卡相关逻辑时，落在 `app/src/board/`，并通过 `app/src/board/SConscript` 按板卡宏选择。
- 新增图片或表情资源时，落在 `app/asset/` 并确认 `app/asset/SConscript` 已覆盖对应目录。
- 新增 IoT Thing 或 MCP tool 时，分别从 `app/src/iot/iot_c_api.cc` 和 `app/src/mcp/mcp_server.cc` 接入。

## 输出要求
在实现或评审结论里尽量说明：
- 改动模块边界
- 是否影响板卡差异、线程/定时器、共享状态
- 是否需要同时覆盖 MQTT/WebSocket
- 已执行或未执行的构建/板端验证
