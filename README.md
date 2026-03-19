# cc-subagents-repo

Portable sub-agent workflow extracted from a Claude Code configuration and repackaged for use with both Claude Code and Codex.

## What is in this repo

- `orchestrator-workflow/` — main orchestration skill for complex implementation tasks.
- `refactor-workflow/` — orchestration skill specialized for refactoring work.
- `claude-config/` — original Claude-specific global config: `CLAUDE.md`, custom agents, commands, output style, status line script.
- `codex/AGENTS.md` — Codex-compatible project instructions that mirror the same sub-agent operating model.
- `scripts/` — install helpers.

## Important limitation

`skills.sh` is a good fit for installing the two reusable skills into both Claude Code and Codex. It does **not** replace the extra Claude-only config from `claude-config/`. Use both layers:

1. Install reusable skills with `skills.sh`.
2. Install Claude-specific global config with `scripts/install-claude-config.sh`.
3. Install Codex project guidance with `scripts/install-codex-agents.sh /path/to/repo`.

## Suggested install flow

### Install both skills globally into Claude Code and Codex

```bash
npx skills add <your-git-url-or-owner/repo> --skill '*' -g -a claude-code -a codex -y
```

### Install Claude global config

```bash
./scripts/install-claude-config.sh
```

### Install Codex project instructions into a working repo

```bash
./scripts/install-codex-agents.sh /path/to/your/project
```

## Repo layout for skills.sh

The skill directories live at the repo root so they are easy to install directly:

- `orchestrator-workflow/SKILL.md`
- `refactor-workflow/SKILL.md`

Each skill also bundles portable references so it remains useful even when the external Claude files are not present.

## Adapting to a target project

Do not force the target project into the original Java/Spring-oriented role names from the source setup.

Recommended approach:

1. Keep these shared skills focused on orchestration.
2. Define stack-specific roles locally inside the target repo, for example in `AGENTS.md` and `.agents/**/SKILL.md`.
3. In Codex, prefer the project-local roles first and use the bundled references here only as fallback.

Example: a full-stack project with local role docs

- backend role -> Django / DRF / PostgreSQL ownership
- frontend role -> React / TypeScript / Vite ownership
- domain reviewer -> `DOMAIN_RULES.md`
- plan reviewer -> final gap check against the approved plan
