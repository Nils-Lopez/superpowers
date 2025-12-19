---
name: investigate
description: Use when you must quickly understand an unfamiliar codebase or answer technical questions with repository evidence
---

# Investigate

## Overview
Structured discovery for unfamiliar codebases. Build a concise map of the project, surface governing instructions, and answer questions with grounded evidence instead of guesses.

## When to Use
- New repository or large refactor area
- Answering "where is X implemented?" or "how does Y work?"
- Before planning or debugging when context is missing
- When reconciling differences between Claude and Codex environments

## Core Loop
1. **Scan instructions**
   - Open `AGENTS.md`, `README.md`, and docs in scope. Note coding conventions, command preferences, and required outputs.
2. **Map the repo**
   - List top-level directories and obvious entry points (package manifests, lockfiles, Dockerfiles, Makefiles, scripts, tests, `docs/`).
   - Identify primary languages, frameworks, and package managers from manifests and config files.
3. **Trace the feature/question**
   - Use targeted search (`rg`, `find`, or directory `ls` — avoid `ls -R`) for key terms, APIs, and file names.
   - Read nearby tests to learn expected behavior before diving into implementation.
4. **Summarize and verify**
   - Build a short outline: ownership (paths, modules), execution flow, key dependencies, and open questions.
   - Answer with file-based evidence. If something is unclear, say so and propose the next probe.

## Codex / Claude Parity
- Prefer portable commands (`rg`, `find`, `ls`, `cat`, `sed -n`); avoid tooling that differs between platforms.
- Normalize paths as fully qualified (e.g., `src/utils/parser.js`) so either agent can jump directly.
- When Codex lacks a tool that Claude has, include the fallback command alongside it.
- Keep the same outline and bullet structure in responses to make reviews comparable.

## Helper References
- **Search:** `rg "keyword" <path>`; for file discovery, `find <path> -maxdepth 2 -type f -name "*pattern*"`.
- **Context building:** prioritize `README*`, `docs/`, package manifests, and `tests/` before diving into deep implementation files.
- **Evidence:** cite files and line ranges where possible; call out ambiguity and next steps instead of guessing.

## Common Mistakes
- Skipping instruction files and tripping repo-specific rules.
- Over-browsing (e.g., `ls -R`) instead of targeted search.
- Answering without confirming behavior in tests or configs.
- Ignoring platform differences (Codex vs Claude) when recommending commands.
