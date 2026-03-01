# Xiaozhi Skills Architecture Design

**Date:** 2026-02-28

## Goal
在仓库内创建一组可复用 skills，帮助后续会话快速理解项目架构、执行开发闭环、扩展模块能力。

## Scope
- 新增 `skills/` 目录（项目内管理）。
- 新增 3 个 skill：架构总览、开发流程、模块扩展。
- 新增 1 个共享参考文件：`skills/references/architecture-map.md`。
- 不改动业务代码与构建配置。

## Design
1. 以 `skills/references/architecture-map.md` 作为单一事实来源，沉淀当前代码结构、启动链路、核心数据流、关键文件索引。
2. 3 个 skill 分工明确：
   - `project-architecture-overview`：建立全局心智模型。
   - `sf32-feature-development-workflow`：从构建到板端验证的最小闭环。
   - `xiaozhi-module-extension`：面向 IoT/MCP/UI/Weather 的增量扩展路径。
3. 所有 skill 的描述字段使用触发条件（`Use when...`），便于未来自动发现与触发。

## Tradeoffs
- 选择轻量文档化 skill，而非脚本化自动架构图生成：实现快、维护成本低。
- 共享参考减少重复，但需要后续改动时同步更新该文件。

## Acceptance Criteria
- `skills/` 内存在 3 个可触发的 `SKILL.md`。
- `skills/references/architecture-map.md` 包含可执行的定位信息（目录/文件/流程）。
- 内容与当前仓库结构一致，不引用不存在的路径。
