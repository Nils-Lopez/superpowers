# Superpowers for Codex

Complete guide for using Superpowers with OpenAI Codex.

## Quick Install

Tell Codex:

```
Fetch and follow instructions from https://raw.githubusercontent.com/Nils-Lopez/superpowers/refs/heads/main/.codex/INSTALL.md
```

## Manual Installation

### Prerequisites

- OpenAI Codex access
- Shell access to install files

### Installation Steps

#### 1. Clone Superpowers

```bash
mkdir -p ~/.codex/superpowers
git clone https://github.com/Nils-Lopez/superpowers.git ~/.codex/superpowers
```

#### 2. Install Bootstrap

The bootstrap file is included in the repository at `.codex/superpowers-bootstrap.md`. Codex will automatically use it from the cloned location.

#### 3. Verify Installation

Tell Codex:

```
Run ~/.codex/superpowers/.codex/superpowers-codex find-skills to show available skills
```

You should see a list of available skills with descriptions (including `superpowers:investigate` for repository analysis).

Verify slash-style aliases resolve correctly:

```
Run ~/.codex/superpowers/.codex/superpowers-codex /superpowers:brainstorm
```

You should see the Brainstorming skill content, confirming the alias mapping works.

## Usage

### Finding Skills

```
Run ~/.codex/superpowers/.codex/superpowers-codex find-skills
```

### Loading a Skill

```
Run ~/.codex/superpowers/.codex/superpowers-codex use-skill superpowers:brainstorming
```

To map an unfamiliar repository or answer architecture questions with evidence:

```
Run ~/.codex/superpowers/.codex/superpowers-codex use-skill superpowers:investigate
```

### Slash-Style Aliases

Use Codex slash commands that map directly to skills:

```
Run ~/.codex/superpowers/.codex/superpowers-codex /superpowers:brainstorm
```

This resolves to `superpowers:brainstorming` and loads the matching skill while keeping normal CLI commands intact.

### Bootstrap All Skills

```
Run ~/.codex/superpowers/.codex/superpowers-codex bootstrap
```

This loads the complete bootstrap with all skill information.

### Personal Skills

Create your own skills in `~/.codex/skills/`:

```bash
mkdir -p ~/.codex/skills/my-skill
```

Create `~/.codex/skills/my-skill/SKILL.md`:

```markdown
---
name: my-skill
description: Use when [condition] - [what it does]
---

# My Skill

[Your skill content here]
```

Personal skills override superpowers skills with the same name.

### Subagent requests (fallback/emulation)

Codex can't spawn parallel subagents. When a user asks for subagents or parallel dispatch, run:

```
Run ~/.codex/superpowers/.codex/superpowers-codex subagents
```

That prints the emulated batching flow (small sequential batches with self-review) plus a minimal fallback. You can switch to the concise fallback guidance with:

```
Run ~/.codex/superpowers/.codex/superpowers-codex subagents fallback
```

Tell the user you're emulating subagents before you continue so expectations stay aligned.

## Architecture

### Codex CLI Tool

**Location:** `~/.codex/superpowers/.codex/superpowers-codex`

A Node.js CLI script that provides four commands:
- `bootstrap` - Load complete bootstrap with all skills
- `use-skill <name>` - Load a specific skill
- `subagents [mode]` - Show emulated batching or fallback instructions when subagents are requested
- `find-skills` - List all available skills

### Shared Core Module

**Location:** `~/.codex/superpowers/lib/skills-core.js`

The Codex implementation uses the shared `skills-core` module (ES module format) for skill discovery and parsing. This is the same module used by the OpenCode plugin, ensuring consistent behavior across platforms.

### Tool Mapping

Skills written for Claude Code are adapted for Codex with these mappings:

- `TodoWrite` → `update_plan`
- `Task` with subagents → Use `~/.codex/superpowers/.codex/superpowers-codex subagents` to emulate batches or fall back transparently (tell the user subagents aren't available, then run the work directly with updates)
- `Skill` tool → `~/.codex/superpowers/.codex/superpowers-codex use-skill`
- File operations → Native Codex tools

## Updating

```bash
cd ~/.codex/superpowers
git pull
```

## Troubleshooting

### Skills not found

1. Verify installation: `ls ~/.codex/superpowers/skills`
2. Check CLI works: `~/.codex/superpowers/.codex/superpowers-codex find-skills`
3. Verify skills have SKILL.md files

### CLI script not executable

```bash
chmod +x ~/.codex/superpowers/.codex/superpowers-codex
```

### Node.js errors

The CLI script requires Node.js. Verify:

```bash
node --version
```

Should show v14 or higher (v18+ recommended for ES module support).

## Getting Help

- Report issues: https://github.com/Nils-Lopez/superpowers/issues
- Main documentation: https://github.com/Nils-Lopez/superpowers
- Blog post: https://blog.fsck.com/2025/10/27/skills-for-openai-codex/

## Note

Codex support is experimental and may require refinement based on user feedback. If you encounter issues, please report them on GitHub.
