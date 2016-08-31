#!/usr/bin/env bash

if [ "$(whoami)" != "root" ]
then
    echo This script must be run as root.
    exit
fi

echo You are root

