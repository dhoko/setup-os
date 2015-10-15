#!/bin/bash

echo Install Ubuntu


# Add PPAs
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo add-apt-repository ppa:synapse-core/ppa
# for kdeconnect
sudo add-apt-repository ppa:vikoadi/ppa
# for guake
sudo add-apt-repository ppa:webupd8team/unstable 
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

sudo apt-get update

sudo apt-get install -y tmux htop vim synapse sakura git curl xclip leafpad guake unrar vlc clementine chromium-browser pcmanfm gnome-sushi
sudo apt-get install -y google-chrome-stable sublime-text-installer skype ufw gufw
sudo apt-get install -y indicator-kdeconnect kdeconnect

# Import dotfiles
cd /tmp
git https://github.com/dhoko/dotfiles.git
cd dotfiles/
cp -r .bashrc ~/.bashrc
cp -r .bashrc.d ~/.bashrc.d
cp -r .tmux ~/.tmux
cp -r .tmux.conf ~/.tmux.conf

mkdir ~/.fonts
mkdir -p ~/backup/shaarli
mkdir -p ~/dev/scripts

cp cp -r backupShaarli.sh ~/dev/scripts/backupShaarli.sh
cp .fonts.conf ~/.fonts.conf

# Install docker
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker dhoko

# Install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install node.js
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.bashrc

nvm install stable

# Install a nodejs server
npm i -g http-server

# Allow KDE Connect
sudo ufw allow 1714:1764/tcp
sudo ufw allow 1714:1764/udp

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
