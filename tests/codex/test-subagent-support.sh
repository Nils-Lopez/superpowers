#!/usr/bin/env bash
# Test: Codex subagent fallback/emulation helper
# Verifies the subagents command emits guidance for both emulated batching and fallback modes
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

TMP_DIR="$(mktemp -d)"

cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

export HOME="$TMP_DIR/home"
mkdir -p "$HOME"

echo "=== Test: Codex subagent support helper ==="

cd "$REPO_ROOT"

echo "Running subagents (default emulate)..."
emulated_output=$(node .codex/superpowers-codex subagents 2>&1)

if echo "$emulated_output" | grep -q "Codex cannot spawn parallel subagents" && \
   echo "$emulated_output" | grep -q "Emulated batching flow"; then
    echo "  [PASS] Emulated batching guidance is present"
else
    echo "  [FAIL] Expected emulated batching guidance missing"
    echo "$emulated_output"
    exit 1
fi

echo "Running subagents fallback..."
fallback_output=$(node .codex/superpowers-codex subagents fallback 2>&1)

if echo "$fallback_output" | grep -q "Fallback flow" && \
   echo "$fallback_output" | grep -q "Codex cannot spawn parallel subagents"; then
    echo "  [PASS] Fallback guidance is present"
else
    echo "  [FAIL] Expected fallback guidance missing"
    echo "$fallback_output"
    exit 1
fi

echo "=== Subagent support helper test passed ==="
