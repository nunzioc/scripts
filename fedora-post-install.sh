#!/bin/bash

# run from home
cd ~

# install rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install linux utils
sudo dnf install -y util-linux-user

# enable kakoune repo
dnf copr enable jkonency/kakoune

# install software
sudo dnf install -y fish kakoune qutebrowser fzf ranger steam vim

# set fish as default shell
chsh -s `which fish`

# install video codecs
sudo dnf install -y compat-ffmpeg28 ffmpeg-libs

# set up configs
mkdir .configrepo
git clone https://github.com/nunzioc/config.git ~/.configrepo
alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'
config checkout -f
