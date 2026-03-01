---
name: project-architecture-overview
description: Use when you need a fast architecture understanding of this repository before coding, debugging, reviewing, or planning; 适用于进入项目新会话时快速建立全局认知。
---

# 项目架构总览

## 概述
在修改代码前先建立可靠的项目地图。优先关注 `app/` 下自有业务代码，仅在明确依赖时再深入 `sdk/`。

## 工作流
1. 先阅读 `skills/references/architecture-map.md`。
2. 在 `app/project/` 与 `app/boards/` 确认目标板卡与构建上下文。
3. 按层定位需求涉及路径：
   - 启动与事件循环（`app/src/main.c`）
   - 协议处理（`app/src/xiaozhi_websocket.c` 或 `app/src/xiaozhi_mqtt.c`）
   - 音频链路（`app/src/xiaozhi_audio.c`）
   - UI 层（`app/src/xiaozhi_ui.c`）
   - 能力层（`app/src/iot/*`、`app/src/mcp/*`）
4. 在实现前输出一份简短架构快照：
   - 模块边界
   - 控制流/数据流
   - 关键入口文件
   - 风险点（线程/共享状态/定时器）

## 输出模板
- 运行时入口：
- 线程/定时器/邮箱模型：
- 协议路径：
- 音频路径：
- UI 路径：
- 能力扩展点：
- 计划修改文件：
