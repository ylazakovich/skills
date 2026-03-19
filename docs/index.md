---
title: Skills Docs
---

# Skills for Claude Code and Codex

This repo gives you a reusable sub-agent workflow for two tools:

- Claude Code
- Codex

The short version is simple:

1. Install the skills from this repo.
2. Run one setup script.
3. Start working in your tool or target project.

## Choose Your Path

- [Quick Start](quick-start.md) for the shortest setup steps
- [How to Use These Skills](guides/how-to-use-skills.md) for the longer explanation
- [FAQ](FAQ.md) for common setup questions

## What Is In This Repo

- `orchestrator-workflow/` for complex implementation tasks
- `refactor-workflow/` for refactoring tasks
- `claude-config/` for Claude-specific global config
- `codex/AGENTS.md` for Codex project instructions
- `scripts/` for install helpers

## When To Use This Repo

Use this repo when:

- you want the same orchestration style in Claude Code
- you want Codex to work with a project-level `AGENTS.md`
- you want a shared workflow layer that target projects can extend locally

## Start Here

If you only need the practical steps, go to [Quick Start](quick-start.md).
