# Dotfiles

A minimal dotfiles repository for bootstrapping Linux development environments.

## Contents

- `.zshrc` - Zsh shell configuration
- `.bash_aliases` - Useful command aliases
- `.vimrc` - Vim editor configuration
- `.gitconfig` - Git configuration
- `install.sh` - Installation script

## Installation

Clone the repository and run the install script:

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

The script will:
- Symlink dotfiles to your home directory
- Back up any existing files before overwriting
- Be safe to run multiple times (idempotent)

## Aliases

- `ll` - List files with details (`ls -lah`)
- `la` - List all files including hidden (`ls -A`)
- `gst` - Git status
- `rainbowify` - Echo "Personalization loaded!"

## Notes

This is a minimal proof-of-concept for cloning and initializing a dotfiles repo on cloud dev box instances.
