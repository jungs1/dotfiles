#!/usr/bin/env zsh
echo '\n<<< Starting Homebrew Setup >>>\n'

if ! which brew; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else 
    echo 'Homebrew already installed'
fi

