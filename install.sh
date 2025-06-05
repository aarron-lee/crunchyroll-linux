#!/usr/bin/bash

APP=crunchyroll-linux
RELEASE_URL=https://api.github.com/repos/aarron-lee/crunchyroll-linux/releases/latest

if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi

flatpak install -v --system -y --noninteractive it.mijorus.gearlever >/dev/null

echo "gearlever install complete"

echo "Downloading $APP AppImage"

wget \
    $(curl -s $RELEASE_URL | \
    jq -r ".assets[] | select(.name | test(\".*AppImage\")) | .browser_download_url") \
    -O $HOME/Downloads/$APP.AppImage
chmod +x $HOME/Downloads/$APP.AppImage


flatpak run it.mijorus.gearlever $HOME/Downloads/$APP.AppImage


echo "Installation complete"
