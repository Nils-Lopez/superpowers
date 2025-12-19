# Superpowers

Superpowers is a complete software-development workflow for coding agents, built on top of composable "skills" and a small set of commands that keep every session disciplined and repeatable.
/!\ This is a fork of obra superpowers, just improved with skills I personnaly wanted and better codex integration :) 

## Official repository

- **Source:** https://github.com/Nils-Lopez/superpowers
- **License:** MIT — feel free to fork and share
- **Docs:** See `/docs` for platform-specific notes

## What Superpowers does

Superpowers starts working the moment your agent begins a project. It pauses to clarify goals, validates a design with you, and only then moves into implementation. Plans are broken into tiny, test-first tasks with built-in reviews and reporting so agents stay aligned and transparent end-to-end.

## Commands at a glance

| Command | When to use it | What it enforces |
| --- | --- | --- |
| `/superpowers:investigate` | First touch on a repo or request | Map the codebase, surface governing instructions, and gather evidence before proposing changes. |
| `/superpowers:brainstorm` | Any new feature or behavior change | Structured Q&A to pin down the ask, compare options, and produce a short design doc for approval. |
| `/superpowers:write-plan` | After design approval | Creates bite-sized tasks (2–5 minutes each) with exact files, diffs, and verification steps. |
| `/superpowers:execute-plan` | When the plan is ready | Runs tasks in batches with built-in reviews so changes stay small, tested, and reversible. |
| `/superpowers:report` | When handing off work | Generates a concise, engineering-ready summary with evidence and integration notes. |

## Example workflow

1. **Scout the repo**: `/superpowers:investigate` to list instructions, tests, and entry points for the current request.
2. **Clarify the ask**: `/superpowers:brainstorm` to capture requirements, propose approaches, and get a design document approved.
3. **Plan the work**: `/superpowers:write-plan` to produce a short checklist of tasks with file paths, code snippets, and validation steps.
4. **Ship in batches**: `/superpowers:execute-plan` to work through tasks with two-stage review (spec compliance → code quality) and continuous testing.
5. **Wrap up**: `/superpowers:report` to deliver what changed, how to verify it, and any follow-ups.

## Installation

Superpowers is distributed directly from this repository so it stays portable and fork-friendly.

1. Clone the repo somewhere your agent can read:

   ```bash
   git clone https://github.com/Nils-Lopez/superpowers.git
   ```

2. Follow the platform guide for your environment:
   - **OpenAI Codex:** [docs/README.codex.md](docs/README.codex.md)
   - **OpenCode:** [docs/README.opencode.md](docs/README.opencode.md)
   - **Other agents:** load the skills and commands from this repo directly; the workflow files live under `skills/` and `commands/`.

3. Update anytime with `git pull` from the clone you installed.

## Contributing

Skills live directly in this repository. To contribute:

1. Fork the repository
2. Create a branch for your skill or fix
3. Follow the `writing-skills` skill for creating and testing new skills
4. Submit a PR to https://github.com/Nils-Lopez/superpowers

See `skills/writing-skills/SKILL.md` for the complete guide.

## Support

- **Issues:** https://github.com/Nils-Lopez/superpowers/issues
- **Discussions:** Please file questions and ideas as GitHub issues so others can find them.
