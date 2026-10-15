#!/usr/bin/env bash
set -e

# ==============================================================================
# Agent Specification Sync & Alias Setup Script
# Repository: https://github.com/67373net/agent-specs
# ==============================================================================

SPEC_URL="https://raw.githubusercontent.com/67373net/agent-specs/main/AGENTS.md"
TARGET_FILE="AGENTS.md"

echo "==> [1/3] Downloading latest AGENTS.md..."
curl -fsSL "$SPEC_URL" -o "$TARGET_FILE"
echo "    ✓ Downloaded to $(pwd)/$TARGET_FILE"

echo "==> [2/3] Linking to agent-specific rule files..."
# Link for Cursor
if [ ! -f .cursorrules ]; then
    ln -sf "$TARGET_FILE" .cursorrules
    echo "    ✓ Linked to .cursorrules"
fi

# Link for Claude Code
if [ ! -f CLAUDE.md ]; then
    ln -sf "$TARGET_FILE" CLAUDE.md
    echo "    ✓ Linked to CLAUDE.md"
fi

echo "==> [3/3] Setting up 'update-agent' shell alias..."
ALIAS_LINE="alias update-agent='curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/AGENTS.md -o AGENTS.md'"

setup_alias() {
    local rc_file="$1"
    if [ -f "$rc_file" ]; then
        if ! grep -q "alias update-agent=" "$rc_file"; then
            echo "" >> "$rc_file"
            echo "# Universal Agent Spec update alias" >> "$rc_file"
            echo "$ALIAS_LINE" >> "$rc_file"
            echo "    ✓ Added 'update-agent' alias to $rc_file"
        else
            echo "    ✓ 'update-agent' alias already exists in $rc_file"
        fi
    fi
}

setup_alias "$HOME/.bashrc"
setup_alias "$HOME/.zshrc"

echo ""
echo "✅ All done! You can run 'update-agent' anytime to pull the latest specification."
