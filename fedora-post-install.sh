#!/bin/bash

# install rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install linux utils
sudo dnf install -y util-linux-user

# install software
sudo dnf install -y fish qutebrowser fzf ranger steam

# set fish as default shell
chsh -s `which fish`

# install video codecs
sudo dnf install -y compat-ffmpeg28 ffmpeg-libs
