#!/usr/bin/env bash

if [ "$(whoami)" != "root" ]
then
    echo This script must be run as root.
    exit
fi

apt-get update
apt-get upgrade
apt-get --assume-yes install vim
apt-get install ubuntu-restricted-extras
apt-get install openjdk-8-jdk

