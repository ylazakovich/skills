---
title: FAQ
---

# FAQ

## Do I need both Claude and Codex?

No. You can use only one path.

- If you use Claude Code, install the skills and run `./scripts/install-claude-config.sh`.
- If you use Codex, install the skills and run `./scripts/install-codex-agents.sh /path/to/your/project`.

## Why are skills and Claude config separate steps?

Because they do different jobs.

- the skills add reusable workflow logic
- the Claude config installs Claude-specific files into `~/.claude`

For Claude, you usually want both.

## Does Codex need `claude-config/`?

No.

For Codex, the important pieces are:

- the installed skills
- `AGENTS.md` inside the target project

## Do I run the scripts from my target project?

No.

Clone this repo and run the scripts from this repo root.

Example:

```bash
cd /path/to/skills
./scripts/install-claude-config.sh
./scripts/install-codex-agents.sh /path/to/your/project
```

## What does `install-codex-agents.sh` actually do?

It copies the repository file `codex/AGENTS.md` into your target repo as `AGENTS.md`.

That file tells Codex how to use this orchestration workflow.

## Can my target project still have its own local rules?

Yes.

This repo is the shared orchestration layer. Your target project can still define its own local roles and rules in `AGENTS.md` or `.agents/**/SKILL.md`.
