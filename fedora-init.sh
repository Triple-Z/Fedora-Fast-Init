#!/bin/sh

# This shell scriptlet is provided for quick initilized the Fedora Workstation operation system.
# Version: 0.1.3
# Author: TripleZ <me@triplez.cn>

sudo dnf update -y

# Add RPM Fusion Repository
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf check-update

# Add FZUG (Mostly for Chinese users)
sudo dnf config-manager --add-repo=https://repo.fdzh.org/FZUG/FZUG.repo
sudo dnf check-update

# Install basic library
sudo dnf install -y vim git gcc-c++ cmake gdb curl wget

## Git init
echo "Your user name for Git: "
read yourName
git config --global user.name "$yourName"
echo "Your e-mail for Git: "
read yourEmail
$ git config --global user.email $yourEmail
$ git config --global core.editor vim

echo "Need Git to store credentials? (y/n, Defualt:y)"
read isStore
if ["$isStore" = "N"] || ["$isStore" = "n"]
then
    echo "Not to store credentials..."
else
    mkdir ~/.git-credentials
    git config --global credential.helper store --file=~/.git-credentials/git.credentials
fi

# Support NTFS
sudo dnf install -y ntfs-3g fuse fuse-libs

# Support exFAT
sudo dnf install -y fuse-exfat

################### Across the GFW ##################

# Install shadowsocks (Mostly for Chinese users)
sudo pip install git+https://github.com/shadowsocks/shadowsocks.git@master

## Generate config file for shadowsocks
mkdir ~/shadowsocks
echo "{
\"server\":\"your_server_ip\",
\"server_port\":\"your_server_port\",
\"local_address\":\"127.0.0.1\",
\"local_port\":\"your_local_port\",
\"password\":\"your_password\",
\"timeout\":500,
\"method\":\"your_encrypt_method\",
\"fast_open\": true,
\"workers\": 1
}" > ~/shadowsocks/config.json

## Install libsodium
sudo dnf install -y libsodium

# Install proxychains (Mostly for Chinese users)
sudo dnf install -y proxychains-ng

## Modify config file for proxychains
sudo sed -i '$d' /etc/proxychains.conf
sudo sed -i '$d' /etc/proxychains.conf
sudo sed -i '$i socks5 127.0.0.1 1080' /etc/proxychains.conf
### use `proxychains4 curl www.google.com` to verify it.

# Install genpac (Mostly for Chinese users)
sudo pip install genpac
sudo genpac --format=pac --pac-proxy="SOCKS5 127.0.0.1:1080" -o /etc/genpac.txt

#################### Dev Software #######################

# Install Sublime Text
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text

# Install VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code

# Install Zeal
sudo dnf install -y zeal

# Install Docker

# Install CLion

# Install PyCharm

################# Basic Software ########################

# Install Google Chrome (Stable Version)
sudo wget https://repo.fdzh.org/chrome/google-chrome-mirrors.repo -P /etc/yum.repos.d/
sudo dnf check-update
sudo dnf install -y google-chrome-stable

# Install Telegram Desktop
sudo dnf copr enable rommon/telegram
sudo dnf check-update
sudo dnf install -y telegram-desktop

# Install Mendelay Desktop

# Install Typora
wget https://typora.io/linux/Typora-linux-x64.tar.gz

# Install Electronic-Wechat

# Install Tim

# Install VLC Media Player
sudo dnf install -y vlc

# Install Steam

# Install WPS

# Install ibus-rime
sudo dnf install -y ibus-rime
ibus restart

## if you need futher ibus configs, enter this command:
## ibus-setup

# Install Netease Cloud Music
sudo dnf install -y musicbox

# Install Dropbox
wget https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm
sudo dnf install -y nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm
sudo proxychains4 dropbox start -i
dropbox start
## if you meet some error, please kill ALL dropbox processes then restart it.
## For Chinese users
dropbox proxy manual socks5 127.0.0.1 1080
## Boot with OS
dropbox autostart y

# Install Teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo dnf install -y teamviewer.x86_64.rpm

################## GNOME Apperance ################

# Install Tweak
sudo dnf install -y gnome-tweak-tool

# Install Chrome Extension Plugins
sudo dnf install chrome-gnome-shell

# if you need to inverse bottons like macOS, use this GNOME command:
# gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

#################### Terminal ######################

# Install Zsh
sudo dnf install -y zsh

## Install Oh-My-Zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
chsh -s /bin/zsh


################# KDE Desktop ####################
echo "Need KDE Desktop?(y/n, Default:n)"
read isKDE
if ["$isKDE" = "Y"] || ["$isKDE" = "y"];
then
    echo "Installing KDE..."
    sudo dnf install -y @kde-desktop
    echo "Reboot to enjoy KDE~"
fi


