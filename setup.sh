#!/bin/bash

SCRIPTS_REPO=scripts
DOTFILES_REPO=dotfiles

# Quick install
# curl https://raw.githubusercontent.com/borisjoffe/scripts/master/setup.sh | sh

git clone https://github.com/borisjoffe/$DOTFILES_REPO.git dotfiles
cp -R ./dotfiles/.* .


git clone https://github.com/borisjoffe/$SCRIPTS_REPO.git bin
