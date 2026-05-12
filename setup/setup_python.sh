#!/bin/bash

# Install latest python and pip
sudo pacman -S --noconfirm python
sudo pacman -S --noconfirm python-pip

# Install python3.11
sudo pacman -S --noconfirm python311

# Install virtualenvwrapper
sudo pip install virtualenvwrapper --break-system-packages
sudo pip install pre-commit --break-system-packages
