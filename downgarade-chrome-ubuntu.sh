#!/bin/bash

#
# Copyright (C) 2023 https://github.com/nkh-lab
#
# This is free software. You can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 3 as published by the Free Software Foundation.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY.
#

CHROME_VERSION=$1

if [ "$EUID" -ne 0 ]
    then
        echo "Please run as root, for example:"
        echo "sudo ./downgarade-chrome-ubuntu.sh 117.0.5938.132-1"
    exit
fi

if [ -z $CHROME_VERSION ]
    then
        echo "Please specify version, for example:"
        echo "sudo ./downgarade-chrome-ubuntu.sh 117.0.5938.132-1"
    exit
fi

wget http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_"$CHROME_VERSION"_amd64.deb
dpkg -i google-chrome-stable_"$CHROME_VERSION"_amd64.deb
apt-mark hold google-chrome-stable
google-chrome-stable --version