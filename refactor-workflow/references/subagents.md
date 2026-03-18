# Sub-agent catalog

These role profiles are extracted from the original Claude configuration so the skill stays useful outside Claude-only installs.

## Research agents
- `code-researcher`: deep code analysis, trace execution paths, map dependencies, cite files and lines.
- `diff-researcher`: inspect git history, commits, diffs, change intent, and impact.
- `web-researcher`: research official documentation and current best practices.
- `ui-researcher`: inspect live UI structure and interaction flows.

## Development agents
- `junior-backend-engineer`: mechanical, pattern-based edits in up to 3 files.
- `middle-backend-engineer`: default implementation agent for standard multi-file backend work.
- `senior-backend-engineer`: complex refactoring, architecture-heavy implementation.
- `middle-backend-test-engineer`: standard backend test coverage.
- `senior-backend-test-engineer`: edge cases and complex test scenarios.

## Validation agents
- `middle-code-validator`: standard validation.
- `senior-code-validator`: complex validation for interdependent changes.

## Selection rules
1. Analyze complexity, not file count.
2. Start with the simplest capable agent.
3. Mechanical work -> junior.
4. Clear multi-file implementation -> middle.
5. Architectural or high-ambiguity work -> senior.
