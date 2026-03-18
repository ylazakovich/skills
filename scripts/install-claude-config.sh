#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
mkdir -p "$HOME/.claude"
cp "$ROOT/claude-config/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
mkdir -p "$HOME/.claude/agents" "$HOME/.claude/commands" "$HOME/.claude/output-styles"
cp -R "$ROOT/claude-config/agents/." "$HOME/.claude/agents/"
cp -R "$ROOT/claude-config/commands/." "$HOME/.claude/commands/"
cp -R "$ROOT/claude-config/output-styles/." "$HOME/.claude/output-styles/"
cp "$ROOT/claude-config/statusline-command.sh" "$HOME/.claude/statusline-command.sh"
chmod +x "$HOME/.claude/statusline-command.sh"
printf 'Installed Claude config into %s\n' "$HOME/.claude"
