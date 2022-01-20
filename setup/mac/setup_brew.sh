#!/usr/bin/env zsh
echo '\n<<< Starting Homebrew Setup >>>\n'

if exists brew; then
    echo 'Homebrew already installed'
else 
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew bundle --file=setup/mac/Brewfile --verbose
fi

