#!/usr/bin/env zsh
echo '\n<<< Starting nvm Setup >>>\n'

if [ -f "$HOME/.nvm/nvm.sh" ]; then
    echo "Node $(node --version) & NPM $(npm --version) already installed"
else
    echo "Installing nvm"
    rm -rf ~/.nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source ~/.zshrc
    nvm install --lts
fi
