# Skills for Architecture Mapping Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** 在项目仓库内交付 3 个技能和 1 个共享架构参考文件。

**Architecture:** 使用一个共享架构底稿承载事实信息，3 个技能文档通过触发条件和执行步骤调用该底稿，分别服务于认知、开发、扩展三个场景。

**Tech Stack:** Markdown, SKILL.md frontmatter, repo source-of-truth files under `app/` and `docs/`

---

### Task 1: Prepare skill directories

**Files:**
- Create: `skills/project-architecture-overview/SKILL.md`
- Create: `skills/sf32-feature-development-workflow/SKILL.md`
- Create: `skills/xiaozhi-module-extension/SKILL.md`
- Create: `skills/references/architecture-map.md`

**Step 1: Ensure directories exist**
Run: `mkdir -p skills/references skills/project-architecture-overview skills/sf32-feature-development-workflow skills/xiaozhi-module-extension`
Expected: Command exits `0`.

### Task 2: Write shared architecture reference

**Files:**
- Create: `skills/references/architecture-map.md`

**Step 1: Write architecture map**
Include: repo boundaries, build chain, runtime thread model, communication path, module ownership, file index.

**Step 2: Verify path correctness**
Run: `rg -n "app/src/main.c|app/src/xiaozhi_websocket.c|app/src/xiaozhi_audio.c|app/src/xiaozhi_ui.c|app/src/mcp/mcp_server.cc|app/src/iot/iot_c_api.cc" skills/references/architecture-map.md`
Expected: All paths found.

### Task 3: Write skill documents

**Files:**
- Create: `skills/project-architecture-overview/SKILL.md`
- Create: `skills/sf32-feature-development-workflow/SKILL.md`
- Create: `skills/xiaozhi-module-extension/SKILL.md`

**Step 1: Add valid frontmatter**
Each file uses only:
- `name`
- `description`

**Step 2: Add usage workflow**
Ensure each skill defines:
- first actions
- decision gates
- output format expectation

**Step 3: Validate basic structure**
Run: `for f in skills/*/SKILL.md; do echo "== $f =="; sed -n '1,12p' "$f"; done`
Expected: All skill files have valid frontmatter and non-empty body.

### Task 4: Final verification

**Files:**
- Verify: `docs/plans/2026-02-28-skills-architecture-design.md`
- Verify: `docs/plans/2026-02-28-skills-architecture.md`
- Verify: `skills/references/architecture-map.md`
- Verify: `skills/*/SKILL.md`

**Step 1: Check file inventory**
Run: `find skills -maxdepth 3 -type f | sort`
Expected: Exactly 4 new files under `skills` for this task.

**Step 2: Check for empty files**
Run: `find skills docs/plans -type f -name '*.md' -size 0`
Expected: No output.
