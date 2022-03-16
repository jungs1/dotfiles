#!/usr/bin/env zsh
echo '\n<<< Starting plugins Setup >>>\n'

if [ -d "/Users/swj/.zsh/zsh-autosuggestions" ] 
then
    echo "Already installed zsh-autosuggestion!" 
else
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
fi

if [ -d "/Users/swj/.zsh/zsh-syntax-highlighting" ] 
then
    echo "Already installed zsh-syntax-highlighting!" 
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
