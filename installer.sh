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
    ncdu
    exa
    broot
    python
    python-pip
    nmap
    noto-fonts-emoji
)

aurs=(
    spotify
    universal-ctags-git
)

pips=(
    git-fame
)

pacman -S --noconfirm ${pkgs[*]}

git clone https://aur.archlinux.org/yay.git /tmp/yay && cd $_
makepkg -si --noconfirm

yay -S --noconfirm ${aurs[*]}

pip3 install ${pips[*]}

#################################

systemctl enable sshd.service
systemctl start sshd.service

chsh -s $(which zsh)

tee -a /etc/sysctl.d/99-sysctl.conf <<< 'kernel.sysrq = 1'
sysctl kernel.sysrq=1

## rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
mkdir -pv ~/.zsh.d
rustup completions zsh rustup > ~/.zsh.d/_rustup
rustup completions zsh cargo > ~/.zsh.d/_cargo

## cht.sh

curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
chmod +x /usr/local/bin/cht.sh


## fonts

mkdir -pv ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/"Ubuntu Mono Nerd Font.ttf" \
    https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete.ttf\?raw\=true
