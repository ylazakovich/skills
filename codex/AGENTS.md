# Codex sub-agent orchestration profile

This repository contains two portable skills adapted from a Claude Code sub-agent setup:
- `orchestrator-workflow`
- `refactor-workflow`

## How Codex should use this repo

1. Treat the current assistant as the **main orchestrator**.
2. Prefer decomposition into specialist sub-tasks before large code changes.
3. Prefer project-local guidance in the target repo such as `AGENTS.md` and `.agents/` over bundled generic roles.
4. Use the skill instructions as the workflow source of truth.
5. Use the bundled references in each skill directory instead of assuming Claude-specific files exist.
6. When sub-agents are unavailable natively, emulate them explicitly by splitting work into these roles:
   - research
   - implementation
   - validation
   - test engineering

## Role mapping

### Prefer project-local roles when present
- `planner`: task decomposition and execution plan.
- `architect`: architecture fit, boundaries, dependency impact.
- `backend-developer`: server-side implementation for the target stack.
- `frontend-developer`: client-side implementation for the target stack.
- `domain-rules-reviewer`: domain logic and business-rule compliance.
- `plan-reviewer`: final cross-check against the approved plan.

### Portable fallback roles
- `code-researcher`: exhaustive codebase analysis.
- `diff-researcher`: git history and diff analysis.
- `web-researcher`: official docs and best practices.
- `ui-researcher`: UI structure and behavior analysis.
- `implementation-generalist`: standard implementation within one slice.
- `validation-generalist`: standard correctness checks.
- `test-engineer`: regression-focused coverage updates.

## Operating rules
- Make architectural decisions at orchestrator level.
- Run independent research or implementation tracks in parallel when the environment supports it.
- If parallel sub-agents are unavailable, still keep the phases explicit: assessment -> research -> planning -> execution -> validation.
- In full-stack repos, split backend and frontend work by ownership boundary before deciding whether the tracks can run in parallel.
- In domain-heavy repos, run a separate domain-rules review whenever business rules, statuses, calculations, or critical flows change.
- Prefer concise decision-focused reporting over long code walkthroughs.
- After code changes, always validate compilation, logic, and code quality.

## Recommended project usage

Copy or symlink this file into a target repo as `AGENTS.md` when you want Codex to apply the same sub-agent orchestration style inside that project.

For a project like `car-service-platform`, prefer the repo's own local role docs and stack constraints:
- backend: `Python 3.12`, `Django`, `Django REST Framework`
- frontend: `React`, `TypeScript`, `Vite`
- domain rules: `DOMAIN_RULES.md`

The shared skills in this repository should act as orchestration glue, not as a replacement for project-local agent definitions.
