---
name: xiaozhi-module-extension
description: Use when adding or modifying XiaoZhi capabilities such as IoT things, MCP tools, UI events, weather-time behavior, or network message handling; 适用于扩展模块能力时快速定位改动入口。
---

# Xiaozhi 模块扩展

## 概述
通过现有模块边界扩展能力，不绕过现有架构。保持初始化顺序与线程边界不被破坏。

## 扩展路径
### 新增或修改 IoT Thing
1. 在 `app/src/iot/iot_c_api.cc` 的 `iot_initialize` 中注册 Thing。
2. 在 `app/src/iot/thing*.cc` 实现或更新逻辑。
3. 确保 descriptor/state 输出为合法 JSON。

### 新增 MCP 工具
1. 在 `app/src/mcp/mcp_server.cc` 的 `McpServer::AddCommonTools` 中新增 tool。
2. 路由到 Thing 调用或已有控制 API。
3. 在 MQTT 与 WebSocket 两种模式下验证传输行为。

### 新增 UI 驱动行为
1. 在 `app/src/xiaozhi_ui.c` 增加消息类型与处理逻辑。
2. 从生产者模块触发（`main`、`xiaozhi_websocket`、`xiaozhi_mqtt`、`xiaozhi_audio`）。
3. 长耗时操作不要放在 UI 热路径中执行。

### 新增天气/时间行为
1. 在 `app/src/weather/weather.c` 实现。
2. 复用既有时间天气更新机制与 UI 更新入口。

## 约束
- 不要破坏 `main.c` 初始化顺序：mailbox -> IoT/weather -> UI thread -> BT callbacks。
- 遵循跨线程信号约定（mailbox/queue/timer）。
- 尽量缩小状态面；除非必要，不新增全局可变状态。
- 当模块边界变化时，同步更新 `skills/references/architecture-map.md`。
