git clone git@github.com:zsh-users/zsh-autosuggestions.git ~/.zsh_settings/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.zsh_settings/zsh-syntax-highlighting
git clone https://github.com/powerline/fonts.git --depth=1 ~/.zsh_settings/fonts
cd ~/.zsh_settings/fonts
./install.sh
cd ..
rm -rf fonts
