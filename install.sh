#!/usr/bin/bash

APP=crunchyroll-linux
RELEASE_URL=https://api.github.com/repos/aarron-lee/crunchyroll-linux/releases/latest

if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi

if grep -q 'it.mijorus.gearlever' <<< $(flatpak list); then
    echo "GearLever installed, $APP install will proceed"

else
    read -p "This $APP install script requires GearLever. Do you want to install GearLever? (y/n): " yn

    case $yn in
        [Yy]* )
            echo "Installing GearLever..."
            flatpak install it.mijorus.gearlever --system -y
            ;;
        [Nn]* )
            echo "GearLever Installation aborted."
            exit
            ;;
        * )
            echo "Please answer yes or no."
            exit
            ;;
    esac
fi


echo "Downloading $APP AppImage"

wget \
    $(curl -s $RELEASE_URL | \
    jq -r ".assets[] | select(.name | test(\".*AppImage\")) | .browser_download_url") \
    -O $HOME/Downloads/$APP.AppImage
chmod +x $HOME/Downloads/$APP.AppImage


flatpak run it.mijorus.gearlever $HOME/Downloads/$APP.AppImage


echo "Installation complete"
