#!/usr/bin/env zsh

# Source shared colors
source "$(dirname "$0")/../utils/colors.sh"

echo "${BLUE}<<< Starting NVM Setup >>>${NC}"

# Setup NVM directory
export NVM_DIR="$HOME/.nvm"

# Check if NVM is installed
if [ -f "$NVM_DIR/nvm.sh" ]; then
    # Load NVM
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    # Check node and npm versions
    if command -v node >/dev/null 2>&1 && command -v npm >/dev/null 2>&1; then
        echo "${GREEN}Node $(node --version) & NPM $(npm --version) already installed${NC}"
    else
        echo "${RED}NVM found but Node/NPM not installed${NC}"
        install_needed=true
    fi
else
    echo "${BLUE}Installing NVM...${NC}"
    # Clean old installation if exists
    rm -rf "$NVM_DIR"
    
    # Install NVM
    if curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash; then
        echo "${GREEN}NVM installed successfully${NC}"
        
        # Load NVM
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        install_needed=true
    else
        echo "${RED}Failed to install NVM${NC}"
        exit 1
    fi
fi

# Install LTS version if needed
if [ "$install_needed" = true ]; then
    echo "${BLUE}Installing Node LTS version...${NC}"
    if nvm install --lts; then
        echo "${GREEN}Successfully installed Node $(node --version) & NPM $(npm --version)${NC}"
    else
        echo "${RED}Failed to install Node LTS version${NC}"
        exit 1
    fi
fi

echo "${GREEN}<<< Finished NVM Setup >>>${NC}"