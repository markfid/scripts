#!/usr/bin/env bash

echo This script has not even been tested, its just a dumping ground for now, so please use at own risk
read -rsp $'Press any key to continue...\n' -n1 key

if [ "$(whoami)" != "root" ]
then
    echo This script must be run as root.
    exit
fi

su -c 'dnf --assumeyes install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'

cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

dnf --assumeyes update

dnf --assumeyes install vim

dnf --assumeyes install gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} --setopt=strict=0
dnf --assumeyes install gstreamer{1,}-{plugin-crystalhd,ffmpeg,plugins-{good,ugly,bad{,-free,-nonfree,-freeworld,-extras}{,-extras}}} libmpg123 lame-libs --setopt=strict=0
dnf --assumeyes install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1
dnf --assumeyes install vlc

dnf --assumeyes install google-chrome-stable
dnf --assumeyes install chromium

dnf --assumeyes install tint2
dnf --assumeyes install openbox
# yum install net-tools
# yum install lsof

dnf --assumeyes install @xfce-desktop

dnf --assumeyes install R

dnf --assumeyes install java-1.8.0-openjdk

# This should be run as a normal user, not root
# sudo -u "$USER" cd /home/$USER && mkdir ~/.config/openbox && cp /etc/xdg/openbox/rc.xml ~/.config/openbox/ && echo 'tint2 &' > ~/.config/openbox/autostart

sudo -u "$USER" bash -c "cd /home/$USER && mkdir .config/openbox"
sudo -u "$USER" bash -c "cd /home/$USER && cp /etc/xdg/openbox/rc.xml .config/openbox/"
sudo -u "$USER" bash -c "cd /home/$USER && echo 'tint2 &' > .config/openbox/autostart"

