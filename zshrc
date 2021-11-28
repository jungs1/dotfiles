source $HOME/.aliases

# Zsh plugins
source $HOME/.zsh_settings/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh_settings/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# PROMPT='
# %1~ %# '
# RPROMPT='%*'
# Disable quarantine on brew cask install
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Syntax highligthing for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

autoload -U promptinit; promptinit
prompt spaceship