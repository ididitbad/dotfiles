#!/bin/bash

################ INSTALLER ####################################################

pkgs=(
    base-devel
    git
    stow
    ripgrep
    the_silver_searcher
    fd
    tree
    fzf
    vim
    zsh
    ttf-ubuntu-font-family
    alacritty
    # vs
    kitty
    tmux
    byobu
    telegram-desktop
    unzip
    openssh
    thefuck
    bat
    diff-so-fancy
)

aurs=(
    spotify
    universal-ctags-git
)

pacman -S --noconfirm ${pkgs[*]}

git clone https://aur.archlinux.org/yay.git /tmp/yay && cd $_
makepkg -si --noconfirm

yay -S --noconfirm ${aurs[*]}

systemctl enable sshd.service
systemctl start sshd.service

chsh -s $(which zsh)

tee -a /etc/sysctl.d/99-sysctl.conf <<< 'kernel.sysrq = 1'
sysctl kernel.sysrq=1
