source $HOME/.aliases

PROMPT='
%1~ %# '
RPROMPT='%*'
# Disable quarantine on brew cask install
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Syntax highligthing for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
