# Codex sub-agent orchestration profile

This repository contains two portable skills adapted from a Claude Code sub-agent setup:
- `orchestrator-workflow`
- `refactor-workflow`

## How Codex should use this repo

1. Treat the current assistant as the **main orchestrator**.
2. Prefer decomposition into specialist sub-tasks before large code changes.
3. Use the skill instructions as the workflow source of truth.
4. Use the bundled references in each skill directory instead of assuming Claude-specific files exist.
5. When sub-agents are unavailable natively, emulate them explicitly by splitting work into these roles:
   - research
   - implementation
   - validation
   - test engineering

## Role mapping

### Research roles
- `code-researcher`: exhaustive codebase analysis.
- `diff-researcher`: git history and diff analysis.
- `web-researcher`: official docs and best practices.
- `ui-researcher`: UI structure and behavior analysis.

### Implementation roles
- `junior-backend-engineer`: mechanical changes with clear patterns.
- `middle-backend-engineer`: default backend implementation.
- `senior-backend-engineer`: complex restructuring.

### Validation roles
- `middle-code-validator`: standard checks.
- `senior-code-validator`: complex interdependent validation.

### Testing roles
- `middle-backend-test-engineer`: standard test coverage.
- `senior-backend-test-engineer`: complex edge-case tests.

## Operating rules
- Make architectural decisions at orchestrator level.
- Run independent research or implementation tracks in parallel when the environment supports it.
- If parallel sub-agents are unavailable, still keep the phases explicit: assessment -> research -> planning -> execution -> validation.
- Prefer concise decision-focused reporting over long code walkthroughs.
- After code changes, always validate compilation, logic, and code quality.

## Recommended project usage

Copy or symlink this file into a target repo as `AGENTS.md` when you want Codex to apply the same sub-agent orchestration style inside that project.
