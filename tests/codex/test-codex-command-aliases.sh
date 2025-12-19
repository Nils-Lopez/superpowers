#!/usr/bin/env bash
# Test: superpowers-codex command-style alias parsing
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

echo "=== Test: superpowers-codex command-style alias parsing ==="

TEST_HOME="$(mktemp -d)"
export HOME="$TEST_HOME"

cleanup() {
    if [[ -n "${TEST_HOME:-}" && -d "$TEST_HOME" ]]; then
        rm -rf "$TEST_HOME"
    fi
}
trap cleanup EXIT

# Install minimal Codex tree
mkdir -p "$HOME/.codex/superpowers"
cp -r "$REPO_ROOT/skills" "$HOME/.codex/superpowers/"
cp -r "$REPO_ROOT/lib" "$HOME/.codex/superpowers/"
mkdir -p "$HOME/.codex/superpowers/.codex"
cp "$REPO_ROOT/.codex/superpowers-codex" "$HOME/.codex/superpowers/.codex/"
if [[ -f "$REPO_ROOT/.codex/superpowers-bootstrap.md" ]]; then
    cp "$REPO_ROOT/.codex/superpowers-bootstrap.md" "$HOME/.codex/superpowers/.codex/"
fi
chmod +x "$HOME/.codex/superpowers/.codex/superpowers-codex"

alias_output="$("$HOME/.codex/superpowers/.codex/superpowers-codex" /superpowers:brainstorm)"
if echo "$alias_output" | grep -q "Brainstorming Ideas Into Designs"; then
    echo "[PASS] Slash-style alias loads brainstorming skill"
else
    echo "[FAIL] Slash-style alias did not load brainstorming skill"
    echo "$alias_output"
    exit 1
fi

prefix_output="$("$HOME/.codex/superpowers/.codex/superpowers-codex" /superpowers:brainstorming)"
if echo "$prefix_output" | grep -q "Brainstorming Ideas Into Designs"; then
    echo "[PASS] Exact slash alias maps directly to skill"
else
    echo "[FAIL] Exact slash alias did not resolve correctly"
    echo "$prefix_output"
    exit 1
fi

echo "[PASS] All alias tests passed"
