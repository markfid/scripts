#!/usr/bin/env bash

echo This script has not even been run or tested, its just a dumping ground for now, so please use at own risk
exit

if [ "$(whoami)" != "root" ]
then
    echo This script must be run as root.
    exit
fi

su -c 'dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'

cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

dnf update

dnf install vim

dnf install gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} --setopt=strict=0
dnf install gstreamer{1,}-{plugin-crystalhd,ffmpeg,plugins-{good,ugly,bad{,-free,-nonfree,-freeworld,-extras}{,-extras}}} libmpg123 lame-libs --setopt=strict=0
dnf install gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1
dnf install vlc

dnf install google-chrome-stable

dnf install tint2
dnf install openbox

dnf install @xfce-desktop

dnf install R

dnf install java-1.8.0-openjdk

# This should be run as a normal user, not root
sudo -u "$USER" "mkdir ~/.config/openbox && cp /etc/xdg/openbox/rc.xml ~/.config/openbox/ && echo 'tint2 &' > ~/.config/openbox/autostart"

