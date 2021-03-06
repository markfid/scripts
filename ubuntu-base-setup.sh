#!/usr/bin/env bash

if [ "$(whoami)" != "root" ]
then
    echo This script must be run as root.
    exit
fi

add-apt-repository -y ppa:webupd8team/sublime-text-3

apt-get update ; echo "Exit status: $?"
apt-get --assume-yes upgrade
apt-get --assume-yes install vim
apt-get --assume-yes install sshpass
#echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections sudo apt-get install ttf-mscorefonts-installer
#echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
apt-get --assume-yes install xclip
apt-get --assume-yes install git
apt-get --assume-yes install ubuntu-restricted-extras
apt-get --assume-yes install sublime-text-installer
apt-get --assume-yes install openjdk-8-jdk
apt-get --assume-yes install build-essential
apt-get --assume-yes install python python-pip python-dev
apt-get --assume-yes install ansible
apt-get --assume-yes install libxml2-dev libxslt1-dev zlib1g-dev
apt-get --assume-yes install maven
apt-get --assume-yes install chromium-browser
apt-get --assume-yes install nodejs
apt-get --assume-yes --quiet install wireshark
apt-get --assume-yes install filezilla
apt-get --assume-yes install mysql-workbench
apt-get --assume-yes install openconnect
apt-get --assume-yes install network-manager-openconnect-gnome
apt-get --assume-yes install xchat-gnome xchat-gnome-indicator
apt-get --assume-yes install keepassx
apt-get --assume-yes install unity-tweak-tool
apt-get --assume-yes install bleachbit
apt-get --assume-yes install golang
apt-get --assume-yes install galternatives
apt-get --assume-yes install dos2unix

# apt-get install linux-headers-`uname -r`
# apt-get install linux-headers-$(uname -r)
# xubuntu-community-wallpapers-xenial

#TODO put as params
#git config --global user.name ""
#git config --global user.email ""
git config --global http.postBuffer 524288000
git config --global color.ui true
git config --global credential.helper 'cache --timeout=3600'

cd ~
pip install boto
mkdir -p git
cd git
[ -d jenkins-job-builder ] || git clone https://git.openstack.org/openstack-infra/jenkins-job-builder
cd jenkins-job-builder/
git pull
pip install -e .

# pip install requests
# pip install lxml
# pip install BeautifulSoup

echo "Now install eclipse and Idea"
