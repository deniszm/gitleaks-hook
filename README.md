# Gitleaks Pre-commit Hook

Automatic secrets detection in git commits using [gitleaks](https://github.com/gitleaks/gitleaks).

## What is this?

This repository contains a `pre-commit` hook script that automatically checks for secrets (API keys, passwords, tokens, etc.) before each commit. If secrets are detected, the commit will be rejected.

## Installing gitleaks

Before using the hook, you need to install gitleaks:

### macOS
```bash
brew install gitleaks
```

### Linux/Windows
Download binary from [GitHub releases](https://github.com/gitleaks/gitleaks/releases) and put it in your PATH.

### Docker
```bash
docker pull zricethezav/gitleaks:latest
```

### Go
```bash
go install github.com/gitleaks/gitleaks/v8@latest
```

Full installation guide: https://github.com/gitleaks/gitleaks#installing

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

- Scans only staged changes
- Verbose output with redacted secrets
- Clear error messages

## Roadmap

- [ ] Automatic gitleaks installation + git config options
- [ ] "curl pipe sh" installation method

