#!/bin/bash

echo Install Ubuntu


# Add PPAs
sudo add-apt-repository ppa:webupd8team/sublime-text-3
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

sudo apt-get update

sudo apt-get install htop vim synapse sakura git curl xclip leafpad guake unrar vlc clementine chromium-browser
sudo apt-get install google-chrome-stable sublime-text-installer skype


# Import dotfiles
cd /tmp
git https://github.com/dhoko/dotfiles.git
cd dotfiles/
cp -r .bashrc ~/.bashrc
cp -r .bashrc.d ~/.bashrc.d
cp -r .tmux ~/.tmux
mkdir ~/.fonts
cp .fonts.conf ~/.fonts.conf

# Install docker
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker dhoko

# Install node.js
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
source ~/.bashrc

nvm install stable

# Install a nodejs server
npm i -g http-server

echo

echo Now you need to:
echo - Install Monaco fonts
echo - Import ssh keys
echo - Import passwords
echo - Import images
echo - Drink a beer
echo
echo

echo So long and thanks for all the fish !