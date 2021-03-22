#!/usr/bin/env bash

echo -e "\e[33m\xe2\x8f\xb3 Locating gradle-<VERSION>-bin.zip...\e[m"
VERSION=$(curl -L --silent 'https://gradle.org/install/' | grep -oP "(\d+)(\.\d+)+(?=-bin\.zip\"\s)")
DOWNLOADURL="$(curl -L --silent 'https://gradle.org/install/' | grep -oP "(?<=href=\")(https:\/\/[a-zA-Z0-9_\.\/-]*-bin\.zip)(?=\"\s)")"
echo -e "\e[33m\xE2\x9C\x93 latest version is: $VERSION"
echo -e "\e[33m\xE2\x9C\x93 download URL is: $DOWNLOADURL"
curl -L -C - -O $DOWNLOADURL
INSTALLER="$(find . -maxdepth 1 | sort -r | grep --max-count=1 -oP "\.\/gradle-(\d+)(\.\d+)+-bin\.zip")"
if [ "$INSTALLER" = '' ]; then
## Cannot download or find installer
    echo -e "\e[31m\xe2\x9d\x8c Cannot download or find gradle-$VERSION-bin.zip under current directory\e[m"
    exit 1
else
    echo -e "\e[33m\xE2\x9C\x93 Found gradle-$VERSION-bin.zip\e[m"
    unzip -o gradle-*.zip
    mv gradle-*/* .
fi
