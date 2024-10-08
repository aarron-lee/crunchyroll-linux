#!/bin/bash

rm -rf electron/static

mkdir -p electron/static/build
cp ./index.html electron/static/build
cp -rf server/ electron/static/build
cp -rf img/ electron/static/build
cp -rf js/ electron/static/build
cp -rf css/ electron/static/build

# add game controller listenser
sed -i 's/<!-- end js -->/<script src="server\/js\/electron\/controllerListener.js"><\/script>/g' electron/static/build/index.html