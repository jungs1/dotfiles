sudo dnf update
sudo dnf upgrade
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video
sudo dnf install exa
sudo dnf install bat
sudo apt install gimp
sudo dnf install gnome-tweak-tool
sudo apt install vlc
sudo dnf install zsh
chsh -s $(which zsh)
sudo dnf install nvim