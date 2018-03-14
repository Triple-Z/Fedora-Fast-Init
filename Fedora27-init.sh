#!/bin/sh

# This shell scriptlet is provided for quick initilized the Fedora Workstation 27 operation system.
# Version: 0.2.1
# Author: TripleZ <me@triplez.cn>

sudo dnf update -y

# Config DNS
sudo sed -i '$i nameserver 8.8.8.8' /etc/resolv.conf
sudo sed -i '$i nameserver 9.9.9.9' /etc/resolv.conf
sudo systemctl restart NetworkManager
sleep 60

# Add RPM Fusion Repository
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf check-update

# Add FZUG (Mostly for Chinese users)
sudo dnf config-manager --add-repo=https://repo.fdzh.org/FZUG/FZUG.repo
sudo dnf check-update

# Install basic library
sudo dnf install -y vim git gcc-c++ cmake gdb curl wget

# Install linux user utils
sudo dnf install -y util-linux-user

## Git init
echo "Your user name for Git: "
read yourName
git config --global user.name \"$yourName\"
echo "Your e-mail for Git: "
read yourEmail
git config --global user.email $yourEmail
git config --global core.editor vim

echo "Need Git to store credentials? (y/n, Defualt:y)"
read isStore
if [ $isStore = "N" -o $isStore = "n" ];
then
    echo "Not to store credentials..."
else
    git config --global credential.helper 'store --file ~/.git-credentials' --add
    echo "Your git credentials will be stored in ~/.git-credentials file."
fi

# Support NTFS filesystem
sudo dnf install -y ntfs-3g fuse fuse-libs

# Support exFAT filesystem
sudo dnf install -y fuse-exfat

# BumbleBee for NVIDIA Optimus


################### Across the GFW ##################

# Install shadowsocks (Mostly for Chinese users)
sudo pip install git+https://github.com/shadowsocks/shadowsocks.git@master

## Generate config file for shadowsocks
echo "Do you need a template shadowsocks config file?(y/n, Default:y): "
read isConfigFile
if [ $isConfigFile = "n" -o $isConfigFile = "N" ];
then
    echo "No need for a config file."
else
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
fi

## Install shadowsocks-qt5


sudo dnf copr enable librehat/shadowsocks
sudo dnf update
sudo dnf install shadowsocks-qt5

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
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
echo "Are you want to use Aliyun mirror to speed your docker download speed if you are in China?(y/n, Default:y): "
read isAli
if [ $isAli = "n" -o $isAli = "N" ];
then
    echo "Do not add Aliyun mirror for docker."
else
    ## Add Aliyun mirror for Chinese users
    sudo dnf config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
fi
sudo dnf install -y docker-ce
## if you want to use docker-ce without sudo, check this: https://docs.docker.com/engine/installation/linux/linux-postinstall/
## if you are in China, highly recommad to use DaoCloud / Aliyun Docker speed up services.

# Install Vagrant with VirtualBox
## Install VirtualBox
cd /etc/yum.repos.d/
sudo wget -q --show-progress http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo dnf check-update
sudo dnf install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms
sudo dnf install -y VirtualBox
## Install Vagrant
sudo dnf install -y vagrant

# Install CLion

# Install PyCharm

################# Basic Software ########################

# Install Google Chrome (Stable Version)
sudo wget -q --show-progress https://repo.fdzh.org/chrome/google-chrome-mirrors.repo -P /etc/yum.repos.d/
sudo dnf check-update
sudo dnf install -y google-chrome-stable

# Install Telegram Desktop
sudo dnf copr enable rommon/telegram
sudo dnf check-update
sudo dnf install -y telegram-desktop

# Install Mendelay Desktop
wget -q --show-progress https://github.com/hmaarrfk/mendeley-rpm/releases/download/1.17.12/mendeleydesktop-1.17.12-1.fc27.x86_64.rpm
sudo dnf install -y mendeleydesktop-1.17.12-1.fc27.x86_64.rpm

# Install Typora
git clone https://github.com/RPM-Outpost/typora.git
cd typora
./create-package.sh x64

# Install Electronic-Wechat
## Waiting for the RPM packages ##
# https://drive.google.com/open?id=1cMy04RiOL1Diba1NVclpYaQnbM17l04C

# Install Tim

# Install VLC Media Player
sudo dnf install -y vlc

# Install Steam
sudo dnf config-manager --add-repo=https://negativo17.org/repos/fedora-steam.repo
sudo dnf check-update
sudo dnf -y install steam

# Install WPS
wget -q --show-progress http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office-10.1.0.5672-1.a21.x86_64.rpm
sudo dnf install wps-office-10.1.0.5672-1.a21.x86_64.rpm

# Install ibus-rime
sudo dnf install -y ibus-rime
ibus restart
## if you need futher ibus configs, enter this command:
## ibus-setup

# Install Netease Cloud Music
sudo dnf install -y musicbox

# Install Dropbox
wget -q --show-progress https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm
sudo dnf install -y nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm
sudo proxychains4 dropbox start -i
dropbox start
## if you meet some error, please kill ALL dropbox processes then restart it.
## For Chinese users
dropbox proxy manual socks5 127.0.0.1 1080
## Boot with OS
dropbox autostart y

# Install Teamviewer
wget -q --show-progress https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
sudo dnf install -y teamviewer.x86_64.rpm

# Install Xsensors
sudo dnf install -y xsensors

# Install ImageMagick
sudo dnf install -y ImageMagick

# Install libicns-utils
sudo dnf install -y libicns-utils

################## GNOME Apperance ################

# Install Tweak
sudo dnf install -y gnome-tweak-tool

# Install Chrome GNOME Shell
sudo dnf install -y chrome-gnome-shell

# if you need to inverse bottons like macOS, use this GNOME command:
# gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'

#################### Terminal ######################

# Install Zsh
sudo dnf install -y zsh

## Install Oh-My-Zsh
wget -q --show-progress --no-check-certificate http://install.ohmyz.sh -O - | sh
chsh -s /bin/zsh
### open ~/.zshrc to do more config

################## Dev Enviornment ##################

# Node.js 8.x LTS
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum -y install nodejs

## NRM (Node registry manager)
echo -n "Need NRM(Node registry manager)? (y/n, Default:y)"
read isNRM
if [ $isNRM = "n" -o $isNRM = "N" ];
then
	echo "No need NRM"
else
    sudo npm install -g nrm --registry=http://registry.npm.taobao.org
fi

## Yarn
echo -n "Need Yarn? (y/n, Default:y)"
read isYarn
if [ $isYarn = "n" -o $isYarn = "N" ];
then
	echo "No need Yarn"
else
    sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
	sudo dnf install -y yarn
fi

# Python 3.x

# Java Development Kit

################# KDE Desktop ####################
echo "Need KDE Desktop?(y/n, Default:n)"
read isKDE
if [ $isKDE = "Y" -o $isKDE = "y" ];
then
    # Install KDE Desktop
    echo "Installing KDE..."
    sudo dnf install -y @kde-desktop
    echo "Reboot to enjoy KDE~"
fi


