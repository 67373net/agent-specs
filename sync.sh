#!/usr/bin/env bash
set -e

SPEC_URL="https://raw.githubusercontent.com/67373net/agent-specs/main/agent.md"
TARGET_FILE="agent.md"

echo "Downloading latest agent.md..."
curl -fsSL "$SPEC_URL" -o "$TARGET_FILE"

# Links for common tools
[ ! -f AGENTS.md ] && ln -sf "$TARGET_FILE" AGENTS.md
[ ! -f .cursorrules ] && ln -sf "$TARGET_FILE" .cursorrules
[ ! -f CLAUDE.md ] && ln -sf "$TARGET_FILE" CLAUDE.md

ALIAS_LINE="alias update-agent='curl -fsSL https://raw.githubusercontent.com/67373net/agent-specs/main/agent.md -o agent.md'"

setup_alias() {
    local rc_file="$1"
    if [ -f "$rc_file" ]; then
        if ! grep -q "alias update-agent=" "$rc_file"; then
            echo "" >> "$rc_file"
            echo "$ALIAS_LINE" >> "$rc_file"
            echo "Added update-agent alias to $rc_file"
        fi
    fi
}

setup_alias "$HOME/.bashrc"
setup_alias "$HOME/.zshrc"

echo "Done."
