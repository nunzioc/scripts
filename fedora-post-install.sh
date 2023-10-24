#!/bin/bash

# run from home
cd ~

# install rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install software
sudo dnf install -y util-linux-user fish vim micro vlc

# set fish as default shell
chsh -s `which fish`

# set up common dirs
mkdir source projects downloads
rm -rf Downloads Music Templates Videos Desktop Public Pictures Documents

# set up configs
mkdir .configrepo
git clone --bare https://github.com/nunzioc/config.git ~/.configrepo
alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout 
