#!/bin/bash

# install rpm fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install linux utils
sudo dnf install -y util-linux-user

# install fish shell
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:3/Fedora_29/shells:fish:release:3.repo
sudo dnf install -y fish

# set fish as default shell
chsh -s `which fish`

# install video codecs
sudo dnf install -y compat-ffmpeg28 ffmpeg-libs

# set caps lock key to ctrl
setxkbmap -option caps:ctrl_modifier
