git clone git@github.com:zsh-users/zsh-autosuggestions.git ~/.zsh_settings/zsh-autosuggestions
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.zsh_settings/zsh-syntax-highlighting
git clone https://github.com/powerline/fonts.git --depth=1 ~/.zsh_settings/fonts

cd ~/.zsh_settings/fonts
./install.sh
cd ..
rm -rf fonts



curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

nvmrc=~/.nvm/nvm.sh
if [ -e $nvmrc ]; then
  source $nvmrc
  nvm install --lts
fi

curl https://pyenv.run | bash

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda

minicondarc=~/miniconda/etc/profile.d/conda.sh
if [ -e $minicondarc ]; then
  source $minicondarc
  conda config --set auto_activate_base false
fi