#!/usr/bin/env zsh
echo '\n<<< Starting Homebrew Setup >>>\n'

if exists nvm; then
    echo 'Homebrew already installed'
else 
    echo "Installing Homebrew"
    # nvm
    export NVM_DIR="$HOME/.nvm"
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

