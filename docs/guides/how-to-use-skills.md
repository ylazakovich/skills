---
title: How to Use These Skills
---

# How to Use These Skills

This repo is meant to stay small and reusable.

It gives you:

- shared orchestration skills
- Claude-specific global config
- Codex project instructions

## The Main Idea

There are two layers:

1. Shared skills that both Claude Code and Codex can use
2. Tool-specific setup for the tool you actually work with

That is why setup happens in two steps instead of one.

## Claude Flow

Claude uses:

- installed skills from this repo
- files copied into `~/.claude` by `./scripts/install-claude-config.sh`

This gives Claude the reusable workflow plus the Claude-specific global setup.

## Codex Flow

Codex uses:

- installed skills from this repo
- `AGENTS.md` inside the target repo

This gives Codex the reusable workflow plus project-level instructions.

## How To Adapt This To Your Own Project

Keep this repo focused on orchestration.

Put stack-specific roles in the target project, for example:

- `AGENTS.md`
- `.agents/**/SKILL.md`
- project-specific rules files

The target repo should describe its own stack and domain. This repo should stay generic.

## Recommended Reading Order

If you are new to this repo:

1. Read [Quick Start](../quick-start.md)
2. Use the Claude or Codex path
3. Come back here only if you need the longer explanation

## Related Pages

- [Home](../index.md)
- [Quick Start](../quick-start.md)
- [FAQ](../FAQ.md)
