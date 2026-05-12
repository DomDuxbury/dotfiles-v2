#!/bin/bash
source ~/.nvm/nvm.sh

# Install node
nvm install node

# Setup git terminal configuration
npm install -g gitmoji-cli
gitmoji --config
