#!/bin/bash

# Dotfiles installation script
# This script symlinks dotfiles from the repo to the home directory

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Files to symlink
DOTFILES=".zshrc .bash_aliases .vimrc .gitconfig"

# Color output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Installing dotfiles ===${NC}"

for dotfile in $DOTFILES; do
    src="${SCRIPT_DIR}/${dotfile}"
    dst="${HOME}/${dotfile}"
    
    # Check if source file exists
    if [[ ! -f "$src" ]]; then
        echo -e "${YELLOW}Warning: ${src} not found, skipping${NC}"
        continue
    fi
    
    # If destination exists and is not a symlink, back it up
    if [[ -e "$dst" ]] && [[ ! -L "$dst" ]]; then
        backup="${dst}.backup.$(date +%s)"
        echo -e "${YELLOW}Backing up existing ${dotfile} to ${backup}${NC}"
        mv "$dst" "$backup"
    fi
    
    # If destination is a symlink pointing to the right place, skip
    if [[ -L "$dst" ]] && [[ "$(readlink "$dst")" == "$src" ]]; then
        echo -e "${GREEN}✓ ${dotfile} already linked correctly${NC}"
        continue
    fi
    
    # Remove old symlink if it points elsewhere
    if [[ -L "$dst" ]]; then
        rm "$dst"
    fi
    
    # Create symlink
    ln -s "$src" "$dst"
    echo -e "${GREEN}✓ Linked ${dotfile}${NC}"
done

echo -e "${GREEN}=== Installation complete ===${NC}"
echo -e "${GREEN}Personalization loaded!${NC}"

