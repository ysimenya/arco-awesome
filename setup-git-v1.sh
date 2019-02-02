#!/bin/bash
set -e

read -p ":: Your Github username: " username
git config --global user.name "Yves Simenya"
git config --global user.email ""
git config --global user.username "$username"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=25000'
git config --global push.default simple

sudo git config --system core.editor vim
echo ":: Your git configuration(~/.gitconfig):"
cat ~/.gitconfig
echo ":: Done!"
