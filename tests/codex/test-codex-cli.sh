#!/usr/bin/env bash
# Test: Codex CLI skills discovery and loading
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

TEST_HOME=$(mktemp -d)
export HOME="$TEST_HOME"

cleanup() {
    rm -rf "$TEST_HOME"
}
trap cleanup EXIT

INSTALL_ROOT="$HOME/.codex/superpowers"
mkdir -p "$INSTALL_ROOT/.codex"
cp -r "$REPO_ROOT/skills" "$INSTALL_ROOT/"
cp -r "$REPO_ROOT/lib" "$INSTALL_ROOT/"
cp "$REPO_ROOT/.codex/superpowers-codex" "$INSTALL_ROOT/.codex/"
cp "$REPO_ROOT/.codex/superpowers-bootstrap.md" "$INSTALL_ROOT/.codex/"
chmod +x "$INSTALL_ROOT/.codex/superpowers-codex"

echo "=== Test: Codex CLI skill availability ==="

# Test 1: investigate is listed
find_output=$(node "$INSTALL_ROOT/.codex/superpowers-codex" find-skills)
if echo "$find_output" | grep -q "superpowers:investigate"; then
    echo "  [PASS] investigate skill appears in find-skills output"
else
    echo "  [FAIL] investigate skill missing from find-skills output"
    echo "  Output was:\n$find_output"
    exit 1
fi

# Test 2: investigate is loadable
use_output=$(node "$INSTALL_ROOT/.codex/superpowers-codex" use-skill superpowers:investigate)
if echo "$use_output" | grep -qi "Structured discovery for unfamiliar codebases"; then
    echo "  [PASS] investigate skill loads via use-skill"
else
    echo "  [FAIL] investigate skill did not load as expected"
    echo "  Output was:\n$use_output"
    exit 1
fi

echo ""
echo "=== All Codex CLI tests passed ==="
