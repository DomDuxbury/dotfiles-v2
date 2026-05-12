#!/bin/bash

# Upgrade vim to a version with +clipboard 
sudo pacman -Rs --noconfirm vim
sudo pacman -S --noconfirm gvim

# Install tmux
sudo pacman -S --noconfirm tmux

# Install tpm
mkdir -p $dir/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install git-delta
sudo pacman -S --noconfirm git-delta

# Install nvm
sudo pacman -S --noconfirm nvm

# Install node
nvm install node

# Setup git terminal configuration
npm install -g gitmoji-cli
gitmoji --config
