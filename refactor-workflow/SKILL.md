---
name: refactor-workflow
description: FOR MAIN ORCHESTRATOR ONLY. Orchestrates refactoring tasks through 5 phases - Initial Assessment, Deep Research, Planning, Execution, Validation. Handles both targeted (specific files) and exploratory (find what needs refactoring) modes.
---

# Refactor Workflow

You are the orchestrator. You coordinate sub-agents. You do NOT do deep work yourself.

## Input Handling

Check if specific files/classes were provided in the arguments:
- **Files provided**: Skip to targeted assessment (you know what to refactor)
- **No files provided**: Full discovery mode (find what needs refactoring)

---

## Mandatory Flow

You MUST follow this exact flow. No skipping. No deviations.

1. Initial Assessment (YOU do this)
2. Deep Research (DELEGATE to sub-agents)
3. Planning (YOU synthesize findings)
4. Execution (DELEGATE to sub-agents)
5. Validation (DELEGATE to sub-agents)

---

## Phase 1: Initial Assessment

**Actor: YOU (orchestrator)**

YOU perform this phase directly. No sub-agents.

### If Specific Files Provided:
- Quick read of provided files to understand structure
- Identify dependencies and call hierarchies
- Note obvious issues (violations, duplication, complexity)
- Formulate specific research questions for Phase 2

### If No Specific Files:
- Quick project scan to identify candidate areas
- Look for common refactoring signals:
  - Large files (>500 lines)
  - Complex packages
  - Known problem areas mentioned by user
- Formulate discovery questions for Phase 2

You MAY use Read, Glob, Grep sparingly for initial context. This is NOT deep research - just quick orientation.

**Output**: List of files/areas to analyze, research questions for sub-agents.

---

## Phase 2: Deep Research

**Actor: SUB-AGENTS** | **Mode: PARALLEL**

You MUST NOT perform deep research yourself. You are the orchestrator, not the researcher.

ONLY delegate via `task` tool to **code-researcher** agents from ~/.claude/agents/.

### Research Questions to Assign:

Deploy code-researcher(s) to investigate:
- Current implementation patterns and anti-patterns
- Dependencies and call hierarchies
- SOLID violations (SRP, OCP, LSP, ISP, DIP)
- Clean code violations (method length, complexity, naming)
- Hardcoded values that should be externalized
- Duplicate code across files/packages
- Missing dependency injection patterns
- Method-level SRP issues (methods doing too much)
- Test coverage and constraints on changes
- API boundaries that must be preserved

### Critical Rules for This Phase

- DO NOT use Grep/Glob/Read extensively yourself
- DO NOT try to analyze the codebase yourself in detail
- DELEGATE ALL deep investigation to code-researcher sub-agents
- Deploy ALL needed researchers simultaneously in PARALLEL
- Wait for their findings before proceeding

If multiple areas need research (e.g., different packages, different concerns), deploy multiple code-researchers in PARALLEL.

**Output**: Collected findings from all sub-agents.

---

## Phase 3: Planning

**Actor: YOU (orchestrator)**

Synthesize research findings into refactoring plan:

### Task Grouping
- Group changes by non-conflicting files (for parallel execution)
- Order groups by dependency graph (dependent changes sequential)
- Identify which changes can run in parallel

### Agent Selection Per Group
- **Mechanical changes** (remove logs, add annotations, update imports) → junior-backend-engineer
- **Standard refactoring** with clear specs (extract method, move code, apply patterns) → middle-backend-engineer
- **Complex restructuring** requiring analysis (split service, redesign architecture) → senior-backend-engineer

### Risk Assessment
- Identify API compatibility concerns
- Note test constraints
- Flag high-risk changes

Present plan to user for approval before execution.

**Output**: Approved refactoring plan with parallel groups.

---

## Phase 4: Execution

**Actor: SUB-AGENTS** | **Mode: GROUPED_PARALLEL**

Deploy **development agents** via `task` tool.

- Within group: agents run in PARALLEL (non-conflicting files)
- Between groups: SEQUENTIAL (dependencies)

### Agent Instructions MUST Include

- Specific files to modify
- Exact refactoring to apply
- Expected outcome
- Context from research findings
- API compatibility requirements

### Parallel Execution Impact

- Parallel: 3 agents x 30s = 30s total
- Sequential: 3 agents x 30s = 90s total
- Result: 3x faster with parallel execution

You MUST maximize parallel execution. Only run sequentially when there are true dependencies.

---

## Phase 5: Validation

**Actor: SUB-AGENTS** | **Mode: PARALLEL**

### Step 1: Compilation Check

YOU call get_project_problems to check for compilation errors.

### Step 2: Delegate to Validators

If compilation is clean, delegate to **validation agents**:
- Standard refactoring changes → middle-code-validator
- Complex/interdependent changes → senior-code-validator

Validators can run in PARALLEL if they check different parts.

### Step 3: Handle Results

- Minor issues → note, continue
- Major issues → fix with same development agent
- Critical issues → stop, report to user

---

## Refactoring Rules

These rules apply to ALL refactoring work:

- **Preserve existing tests** - No test changes unless explicitly requested
- **Use framework features** - Prefer framework/library solutions over custom code
- **Apply SRP** - At both class AND method level
- **Externalize config** - No hardcoded values that could change
- **Centralize concerns** - Cross-cutting logic in one place
- **No comments** - Unless explaining unclear business logic
- **Maintain API compatibility** - Don't break existing contracts
- **Small methods** - Extract when method does multiple things
- **Dependency injection** - No `new` for services, use DI

---

## Portability Note

This skill originated from a Claude Code setup that used external files in `~/.claude/agents/` and a global orchestrator config. For cross-agent use in Claude Code and Codex, use the bundled references in `references/subagents.md` and `references/output-style.md` as the source of truth when the external Claude files are unavailable.

## Critical Rules Summary

- You MUST follow the 5-phase flow exactly
- You MUST delegate research to sub-agents in Phase 2
- You MUST NOT do extensive Grep/Glob/Read yourself during research
- You MUST run agents in PARALLEL whenever they don't conflict
- You MUST validate after execution
- You MUST ask user if uncertain about anything
- You MUST present plan to user before execution
