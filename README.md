# Gitleaks Pre-commit Hook

Automatic secrets detection in git commits using [gitleaks](https://github.com/gitleaks/gitleaks) with auto-installation.

## What is this?

This repository contains a `pre-commit` hook script that automatically checks for secrets (API keys, passwords, tokens, etc.) before each commit. If secrets are detected, the commit will be rejected.

**Key features:**
- Automatic gitleaks installation if not present
- Cross-platform support (macOS, Linux, Windows with Git Bash)
- Enable/disable via git config
- Verbose output with redacted secrets

## Installation

No manual gitleaks installation required! The hook will automatically:

- **macOS**: Install via Homebrew (if available) or binary download
- **Linux**: Download and install binary from GitHub releases  
- **Windows**: Download and install via PowerShell from GitHub releases

If automatic installation fails, see: https://github.com/gitleaks/gitleaks#installing

## Usage

### Installing the hook

1. Clone this repository:
```bash
git clone <your-repo-url>
cd gitleaks-hook
```

2. Copy the script to your project:
```bash
cp gitleaks-pre-commit /path/to/your/project/.git/hooks/pre-commit
chmod +x /path/to/your/project/.git/hooks/pre-commit
```

### Testing

Create a file with test GitHub token for verification:

```bash
echo "export GITHUB_TOKEN=ghp_1234567890123456789012345678901234567890" > test-secrets.txt
git add test-secrets.txt
git commit -m "test commit with secret"
```

The commit should be rejected with a message about detected secrets.

## Features

- Automatic gitleaks installation (no manual setup required)
- Cross-platform support (macOS, Linux, Windows Git Bash)
- Enable/disable via git config: `git config gitleaks.enabled false`
- Scans only staged changes (fast)
- Verbose output with redacted secrets
- Clear error messages

## Configuration

### Enable/Disable

```bash
# Disable gitleaks for this repository
git config gitleaks.enabled false

# Enable gitleaks (default)
git config gitleaks.enabled true

# Check current status
git config gitleaks.enabled
```

## Roadmap

- [x] Automatic gitleaks installation + git config options
- [ ] "curl pipe sh" installation method