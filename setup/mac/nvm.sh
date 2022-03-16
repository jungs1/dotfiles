#!/usr/bin/env zsh
echo '\n<<< Starting nvm Setup >>>\n'

nvmrc=~/.nvm/nvm.sh
if [ -e $nvmrc ]; then
    echo "Node $(node --version) & NPM $(npm --version) already installed"
    source $nvmrc
else
    echo "Installing nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source ~/.zshrc
    nvm install --lts
fi
