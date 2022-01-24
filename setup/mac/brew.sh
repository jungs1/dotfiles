#!/usr/bin/env zsh
echo '\n<<< Starting Homebrew Setup >>>\n'

if exists nvm; then
    echo 'Homebrew already installed'
else 
    echo "Installing Homebrew"
    # nvm
    export NVM_DIR="$HOME/.nvm"

    # Load nvm
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"     
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # brew bundle --file=setup/mac/Brewfile --verbose
fi

