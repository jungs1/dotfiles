#!/usr/bin/env zsh

# Source shared colors
source "$(dirname "$0")/../utils/colors.sh"

echo "${BLUE}<<< Starting Homebrew Setup >>>${NC}"

if ! which brew >/dev/null 2>&1; then
    echo "${BLUE}Installing Homebrew...${NC}"
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        echo "${GREEN}Successfully installed Homebrew${NC}"
    else
        echo "${RED}Failed to install Homebrew${NC}"
        exit 1
    fi
else 
    echo "${GREEN}Homebrew already installed${NC}"
fi

# Attempt to install from Brewfile if it exists
BREWFILE="$HOME/dotfiles/setup/mac/Brewfile"
if [[ -f "$BREWFILE" ]]; then
    echo "${BLUE}Installing from Brewfile...${NC}"
    if brew bundle --file="$BREWFILE"; then
        echo "${GREEN}Successfully installed packages${NC}"
    else
        echo "${RED}Failed to install packages${NC}"
        exit 1
    fi
fi

echo "${GREEN}<<< Finished Homebrew Setup >>>${NC}"