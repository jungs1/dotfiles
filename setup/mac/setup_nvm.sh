#!/usr/bin/env zsh
echo '\n<<< Starting nvm Setup >>>\n'

if exists node; then
    echo "Node $(node --version) & NPM $(npm --version) already installed"
else
    echo "Installing nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source setup/mac/setup_nvm.sh
    nvm install --lts
fi

