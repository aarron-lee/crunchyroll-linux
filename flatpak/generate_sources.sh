#!/bin/bash

DIR=$(dirname "$0")
LOCK_FILE="$DIR/../package-lock.json"
OUTPUT="$DIR/generated-sources.json"

echo $DIR

if ! command -v flatpak-node-generator >/dev/null 2>&1
then
    echo "flatpak-node-generator from https://github.com/flatpak/flatpak-builder-tools is required to generate the sources"

    if [ -d "venv" ]; then
        echo "Virtual environment directory 'venv' exists."
        source venv/bin/activate
    else
        echo "Virtual environment directory 'venv' does not exist."
        python3 -m venv --system-site-packages venv
        # pip install git+https://github.com/flatpak/flatpak-builder-tools.git#subdirectory=node
        source venv/bin/activate
        pip install git+https://github.com/flatpak/flatpak-builder-tools.git@refs/pull/382/head#subdirectory=node
    fi
fi

flatpak-node-generator npm $LOCK_FILE -o $OUTPUT

# LOCK_FILE="$DIR/../yarn.lock"
# flatpak-node-generator yarn $LOCK_FILE -o $OUTPUT.yarn