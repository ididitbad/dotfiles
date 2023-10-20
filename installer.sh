#!/bin/bash

################ INSTALLER ####################################################

pacman -S --noconfirm base-devel git stow vim zsh ttf-ubuntu-font-family alacritty tmux byobu telegram-desktop unzip openssh

git clone https://aur.archlinux.org/yay.git /tmp/yay && cd $_
makepkg -si --noconfirm

yay -S --noconfirm spotify

systemctl enable sshd.service
systemctl start sshd.service

chsh -s $(which zsh)
