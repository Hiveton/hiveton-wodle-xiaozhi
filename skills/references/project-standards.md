# Hiveton Wodle Xiaozhi Project Standards

## 1. Repository Boundaries
- `app/` is the primary change surface for product logic, board integration, UI, protocol handling, IoT/MCP, fonts, and packaged assets.
- `sdk/` is vendor SDK plus third-party code. Treat it as upstream dependency space and avoid editing it unless the requirement is impossible to solve in `app/`.
- `docs/` contains flash/get-started material and is the source of truth for device bring-up steps.
- `skills/` is already part of the repo workflow. Prefer adding new project knowledge here instead of scattering ad-hoc notes.

## 2. Build and Board Selection
- Main build entry: `app/project/SConstruct`.
- App aggregation entry: `app/project/SConscript`.
- Source aggregation: `app/src/SConscript`.
- The build depends on `SIFLI_SDK` being set in the environment.
- Board-specific linker/config context lives under `app/project/sf32lb52-*_hcpu/`.
- Generated outputs live under `app/project/build_*`; treat them as build artifacts, not source files.
- Root README shows the common configuration entrypoint:
  - `scons --board=sf32lb52-lcd_n16r8 --menuconfig`
- Use the real target board for build and flash validation. Do not assume the LCD board unless the task or current workspace context points to it.

## 3. Runtime Architecture Rules
- Bootstrap owner: `app/src/main.c`.
- Keep the established startup order intact unless the task is explicitly about boot sequencing:
  1. power/battery checks
  2. mailbox creation
  3. `iot_initialize()`
  4. weather/time init
  5. audio/button/pinmux setup
  6. UI thread startup
  7. BT callback registration and BLE enable
  8. battery thread startup
  9. mailbox-driven main loop
- Shared behavior often crosses these modules:
  - network transport: `app/src/xiaozhi_websocket.c`, `app/src/xiaozhi_mqtt.c`
  - audio path: `app/src/xiaozhi_audio.c`
  - UI thread and message queue: `app/src/xiaozhi_ui.c`
  - IoT registry: `app/src/iot/*`
  - MCP tools: `app/src/mcp/*`
  - time/weather: `app/src/weather/*`

## 4. Concurrency and State
- This is an RT-Thread project with multiple threads, mailboxes, timers, and callbacks.
- Prefer existing signaling mechanisms over new globals:
  - mailboxes for coarse events
  - `ui_msg_queue` and `xiaozhi_ui_*` wrappers for UI work
  - timers for periodic refresh or deferred work
- Keep blocking work out of hot paths:
  - ISR-adjacent callbacks
  - audio callbacks
  - network receive callbacks
  - UI hot loop
- If a change introduces new mutable shared state, document who owns it, which thread writes it, and how races are prevented.

## 5. UI and Resource Conventions
- UI runs through `xiaozhi_ui_task()` and a message queue in `app/src/xiaozhi_ui.c`.
- When other modules need UI updates, follow the existing helper pattern such as:
  - `xiaozhi_ui_chat_status`
  - `xiaozhi_ui_chat_output`
  - `xiaozhi_ui_update_emoji`
  - `xiaozhi_ui_trigger_activity`
- Avoid direct LVGL object manipulation from non-UI modules unless the file already owns that pattern and thread safety is clear.
- Home screen layout is encapsulated in `app/src/ui/home/home_screen.c`; prefer extending that component instead of duplicating layout logic in `xiaozhi_ui.c`.
- Image resources are packaged through `app/asset/SConscript`. When adding a new asset directory, update the matching `Glob()` list.
- Font/resource conversion already exists in the project build; reuse the current pipeline instead of inventing a parallel one.

## 6. IoT and MCP Extension Rules
- Register Things in `app/src/iot/iot_c_api.cc` inside `iot_initialize()`.
- Implement capability logic in `app/src/iot/thing*.cc`.
- Keep descriptor/state output valid JSON because both transport and MCP flow depend on it.
- Register common MCP tools in `McpServer::AddCommonTools()` in `app/src/mcp/mcp_server.cc`.
- If a capability is surfaced to the assistant, check whether it also needs:
  - UI feedback
  - transport serialization
  - state readback
  - board-specific implementation

## 7. Transport Rules
- The repo supports both WebSocket and MQTT paths.
- For changes in session lifecycle, TTS/STT handling, ability invocation, or reconnect behavior, inspect both:
  - `app/src/xiaozhi_websocket.c`
  - `app/src/xiaozhi_mqtt.c`
- If only one path is updated, state clearly why the other path is unaffected.
- Audio behavior may also depend on the transport mode, so verify `app/src/xiaozhi_audio.c` for coupling before changing message semantics.

## 8. Board-Specific Changes
- Board hardware abstractions live in `app/src/board/`.
- Board selection is compile-time gated in `app/src/board/SConscript`.
- New hardware behavior should go through board-level APIs like `board_hardware.h` instead of scattering `#ifdef BSP_USING_BOARD_*` across unrelated modules unless the file is already the right owner.

## 9. Coding Style
- Follow the RT-Thread / SiFli non-HAL style from `sdk/docs/source/en/contribute/coding_style.md` when creating new code:
  - lowercase file and function names
  - uppercase macros
  - 4-space indentation
  - braces on their own lines
  - `void` for empty parameter lists in C
  - English comments preferred
- Project reality is mixed: some existing files use Chinese comments, custom macros, and local naming variations.
- Practical rule:
  - preserve the local style of the file you touch when doing a small change
  - prefer RT-Thread style when adding a new file, new module, or large refactor
- Static variables commonly use the `s_` prefix in cleaner modules; module-global names often use `g_` or a module prefix. Match the surrounding file instead of forcing a repo-wide rename.

## 10. File Placement Rules
- New C/C++ sources under `app/src/` should be placed by ownership:
  - transport logic in top-level `xiaozhi_*`
  - UI components under `app/src/ui/`
  - board integration under `app/src/board/`
  - device capability logic under `app/src/iot/`
  - assistant tool plumbing under `app/src/mcp/`
  - weather/time under `app/src/weather/`
- If a new directory is introduced, wire it into the relevant `SConscript`.

## 11. Validation Expectations
- Minimum validation for code changes:
  - confirm affected board target
  - run the relevant `scons` build if the environment is available
  - note whether validation is compile-only or board-tested
- For runtime-sensitive changes, the ideal validation loop is:
  1. build for the target board
  2. flash using the documented flow in `docs/src/get-started/README.md`
  3. verify BT/PAN
  4. verify server connection
  5. verify audio/UI behavior
- For pure UI/resource changes, confirm resource packaging and screen initialization paths.
- For IoT/MCP changes, verify invoke path plus visible/device state changes.

## 12. Review Checklist
- Is the change confined to the smallest owning module?
- Did it avoid unnecessary `sdk/` edits?
- Does it preserve `main.c` init order and thread ownership assumptions?
- Does it use existing UI/event plumbing instead of bypassing it?
- If transport behavior changed, were both MQTT and WebSocket considered?
- If assets or sources were added, was `SConscript` updated?
- Are generated files excluded from the patch unless the task explicitly asked for them?
