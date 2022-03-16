#!/usr/bin/env zsh
echo '\n<<< Starting plugins Setup >>>\n'

if [ -d "$HOME/.zsh/zsh-autosuggestions" ] 
then
    echo "Already installed zsh-autosuggestion!" 
else
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.zsh/zsh-autosuggestions
fi

if [ -d "$HOME/.zsh/zsh-syntax-highlighting" ] 
then
    echo "Already installed zsh-syntax-highlighting!" 
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
fi
