#!/bin/bash

# run from home
cd ~

# install rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install linux utils
sudo dnf install -y util-linux-user

# install software
sudo dnf install -y fish fzf ranger steam vim tmux tmuxinator

# set fish as default shell
chsh -s `which fish`

# install video codecs
sudo dnf install -y compat-ffmpeg28 ffmpeg-libs

# set up source
mkdir source
# set up copy paste
cd source
sudo dnf install -y wayland-devel meson
git clone https://github.com/bugaevc/wl-clipboard.git
cd wl-clipboard
meson build
cd build
ninja
sudo install ninja
cd ~

# set up configs
mkdir .configrepo
git clone --bare https://github.com/nunzioc/config.git ~/.configrepo
alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout 
