#!/bin/bash

set -e

# Configuration
REPO_URL="https://raw.githubusercontent.com/deniszm/gitleaks-hook/main"
HOOK_FILE="gitleaks-pre-commit"
TARGET_DIR=".git/hooks"
TARGET_FILE="$TARGET_DIR/pre-commit"

echo "Installing gitleaks pre-commit hook..."

# Check if we're in a git repository
if [[ ! -d ".git" ]]; then
    echo "Error: Not in a git repository"
    exit 1
fi

# Create hooks directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Download the hook script
if command -v curl &> /dev/null; then
    curl -fsSL "$REPO_URL/$HOOK_FILE" -o "$TARGET_FILE"
else
    echo "Error: curl required for installation"
    exit 1
fi

# Make the hook executable
chmod +x "$TARGET_FILE"

echo "Gitleaks pre-commit hook installed successfully!"
echo "To disable: git config gitleaks.enabled false"
