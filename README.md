# Fedora Fast Init

Scriptlets for quick initilized the Fedora Workstation series operation systems.

<!-- TOC depthFrom:2 -->

- [Fedora 27](#fedora-27)
    - [Catalog](#catalog)
- [TODO](#todo)
- [How to use?](#how-to-use)
- [Why I do this?](#why-i-do-this)
- [Copyright](#copyright)

<!-- /TOC -->

## Fedora 27

Source code: [Fedora 27](/Fedora27-init.sh)

### Catalog

- [x] Add RPM Fusion Repository
- [x] Add FZUG (Mostly for Chinese users)
- [x] Install basic library
- [ ] Install linux user utilis
- [x] Git init
- [x] Support NTFS filesystem
- [x] Support exFAT filesystem
- [ ] BumbleBee
- [x] NetworkManager plugins 
- [x] Install shadowsocks (Mostly for Chinese users)
- [x] Generate config file for shadowsocks
- [x] Install shadowsocks-qt5
- [x] Install libsodium
- [x] Install proxychains (Mostly for Chinese users)
- [x] Modify config file for proxychains
- [x] Install genpac (Mostly for Chinese users)
- [x] Install Sublime Text
- [x] Install VS Code
- [x] Install Zeal
- [x] Install Docker
- [x] Install Vagrant with VirtualBox
- [ ] Install CLion
- [ ] Install PyCharm
- [x] Install OBS
- [x] Install Calibre
- [x] Install Google Chrome (Stable Version)
- [x] Install Telegram Desktop
- [x] Install Mendelay Desktop
- [x] Install Typora
- [ ] Install Electronic-Wechat
- [ ] Install Tim
- [x] Install VLC Media Player
- [x] Install Steam
- [x] Install WPS
- [x] Install ibus-rime
- [x] Install Netease Cloud Music (Musicbox)
- [x] Install Dropbox
- [x] Install Teamviewer
- [x] Install Xsensors
- [x] Install Tweak
- [x] Install Chrome GNOME Shell
- [x] Install Zsh
- [x] Install Oh-My-Zsh
- [x] Node.js
- [x] NRM
- [ ] Python 3.x
- [ ] JDK
- [x] (Optional) Install KDE Desktop

## TODO

- Make choices to install softwares.
- Use `.yaml` to config packages. (Dependent shyaml)

## How to use?

```bash
$ git clone https://github.com/Triple-Z/Fedora-Fast-Init.git
$ cd Fedora-Fast-Init/
$ ./Fedora27-init.sh
```

## Why I do this?

Fedora Workstation is a user-friendly `unix-like` operating system, and I think it will helpful to learn `Linux` systems rather than Ubuntu. So I want to write this shell scriptlet to enlarge the users who are using the Fedora.

## Copyright

[MIT License](/LICENSE)

Copyright &copy; [TripleZ](https://github.com/Triple-Z)