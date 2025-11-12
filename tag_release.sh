#!/usr/bin/bash

git checkout master

if [ "$EUID" -eq 0 ]
  then echo "Please do not run as root"
  exit
fi

NEW_TAG=$1

sed -i "s/version\": \"[0-9]\+\.[0-9]\+\.[0-9]\+\"/version\": \"$NEW_TAG\"/" ./package.json

git add ./package.json

# update package-lock.json
npm install

git commit -m "Release version $NEW_TAG"

git tag v$NEW_TAG

git push

git push --tags
