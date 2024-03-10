#!/usr/bin/env zsh
echo '\n<<< Starting Homebrew Setup >>>\n'

if ! which brew; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # brew bundle --file ~/dotfiles/setup/mac/Brewfile
else 
    echo 'Homebrew already installed'
fi

