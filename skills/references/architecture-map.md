# Hiveton Wodle Xiaozhi Architecture Map

## 1. Repository Boundaries
- `app/`: business application and board integration.
- `sdk/`: vendor SDK and third-party libraries (large, usually avoid direct edits unless required).
- `docs/`: user-facing hardware/flash/get-started docs.

## 2. Build and Packaging Path
- Entry build script: `app/project/SConstruct`
- App source aggregation: `app/src/SConscript`
- Board/project configs: `app/project/sf32lb52-*_hcpu/`, `app/boards/`
- Build system behavior:
  - checks `SIFLI_SDK` env,
  - prepares env,
  - builds app target,
  - adds bootloader/LCPU/DFU/FTAB artifacts.

## 3. Runtime Bootstrap (Main Chain)
Primary boot sequence is in `app/src/main.c`:
1. power reason and battery pre-check.
2. create mailboxes (`g_button_event_mb`, `g_battery_mb`, `g_bt_app_mb`).
3. initialize IoT registry and MCP tools (`iot_initialize`).
4. initialize weather/time service (`xiaozhi_time_weather_init`).
5. initialize audio/button path (WebSocket mode) and pinmux.
6. start UI thread (`xiaozhi_ui_task`).
7. register BT callbacks and enable BLE.
8. start battery monitor thread.
9. enter event loop on `g_bt_app_mb` for PAN/reconnect/sleep state transitions.

## 4. Core Runtime Modules
- Connectivity:
  - WebSocket path: `app/src/xiaozhi_websocket.c`
  - MQTT path: `app/src/xiaozhi_mqtt.c`
- Audio pipeline:
  - encode/decode, VAD/AEC, UDP uplink/downlink: `app/src/xiaozhi_audio.c`
- UI and interaction:
  - LVGL screens, UI message queue, status updates: `app/src/xiaozhi_ui.c`, `app/src/xiaozhi_screen.c`
- IoT abstraction:
  - C API bridge and thing registration: `app/src/iot/iot_c_api.cc`
  - thing registry/state delta: `app/src/iot/thing_manager.cc`
- MCP server/tools:
  - tool registry and execution transport: `app/src/mcp/mcp_server.cc`
- Time/weather:
  - NTP + weather API + UI-friendly formatting: `app/src/weather/weather.c`

## 5. Data and Control Flows
- BT/PAN state events -> `main.c` mailbox loop -> UI/network transitions.
- Voice input -> `xiaozhi_audio.c` (VAD/AEC/Opus) -> UDP data send.
- Server messages (`tts`, `stt`, `llm`, `mcp`, etc.) -> websocket/mqtt parser -> UI updates + audio control + IoT invoke.
- MCP tool call -> `McpServer` -> Thing invoke / direct control funcs -> optional reply over MQTT/WebSocket.

## 6. Concurrency Model
- Multiple RT-Thread threads + timers + mailboxes.
- Main control loop is mailbox-driven (BT/PAN/reconnect states).
- UI thread and audio thread are independent; cross-thread signaling happens via mailbox/queue and shared state.
- Keep blocking operations out of hot callbacks where possible.

## 7. Extension Points
- Add device capabilities:
  - register new `Thing` in `iot_initialize` (`app/src/iot/iot_c_api.cc`)
  - implement behavior in `app/src/iot/thing*.cc`
- Add MCP tool:
  - define in `McpServer::AddCommonTools` (`app/src/mcp/mcp_server.cc`)
  - map to Thing invoke or direct board/UI control API
- Add UI behavior:
  - add message enum/handler in `app/src/xiaozhi_ui.c`
  - trigger from main/network/audio modules through existing message path

## 8. Fast Navigation Index
- Main bootstrap: `app/src/main.c`
- Build include graph: `app/src/SConscript`, `app/project/SConstruct`
- Network protocol handling: `app/src/xiaozhi_websocket.c`, `app/src/xiaozhi_mqtt.c`
- Audio core: `app/src/xiaozhi_audio.c`
- UI core: `app/src/xiaozhi_ui.c`
- MCP: `app/src/mcp/mcp_server.cc`
- IoT layer: `app/src/iot/iot_c_api.cc`, `app/src/iot/thing_manager.cc`
- Weather/time: `app/src/weather/weather.c`
