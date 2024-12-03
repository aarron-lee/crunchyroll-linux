# Crunchyroll for Linux

![layouts.gif](https://raw.githubusercontent.com/aarron-lee/crunchyroll-tizen/master/layouts.gif)

# Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#install)
- [Steam Deck / Bazzite / ChimeraOS Install](#steam-deck--bazzite--chimeraos-installation)
- [Development](#development)
- [Attribution](#attribution)

# Description:

This is a Linux port of the [Unofficial Tizen Crunchyroll App](https://github.com/jhassan8/crunchyroll-tizen).

**INFO: Application is incomplete, some features are missing that will be added later.**

# Features

- [x] Auth workflow
- [x] Home screen
- [x] Profiles
- [x] Details screen
- [x] Episodes screen
- [x] Video player
- [x] Menu options screen
- [x] Search element
- [x] Auto next episode
- [x] History screen and workflow
- [x] Change audio and subtitles language inside player
- [x] Settings screen
- [x] Browse elements by categories
- [x] My list screen and workflow
- [x] Basic external keyboard support for inputting username/password and search

### Todo Features

- [] Game Controller support - steam deck workaround is to use a steam input community controller profile
- [] Standard keyboard controls, such as spacebar for pause/play
- [] make bundled onscreen keyboard optional
- [] (optional) touchscreen support

# Install

## Manual Install

Download the latest AppImage from [releases](https://github.com/aarron-lee/crunchyroll-linux/releases)

Install it with an AppImage manager, my recommendation would be [GearLever](https://flathub.org/apps/it.mijorus.gearlever), but other alternatives like AppImageLauncher also works

## Quick Install

run the following script in terminal:

```
curl -L https://github.com/aarron-lee/crunchyroll-linux/raw/main/install.sh | sh
```

## Steam Deck / Bazzite / ChimeraOS Installation

Follow the regular install instructions, but afterwards also add it to Steam as a non-Steam game.

Then, in game mode, make sure to enable a Steam input community controller layout. It might require you to show all available layouts while selecting the layout.

I've tested the `Streaming Controls` Steam input community layout by Bleiodes, which works fairly well.

Also, in the Steam Game settings for the app, set the resolution as 1080p. The App was not designed for higher resolutions, you may see visual bugs at higher than 1080p resolutions.

# Development

node and npm are required dependencies.

run `npm start` for to run the app.

There is no hot-reloading, so you must re-run the command after code changes are made.

## Build

run `npm run electron-build`

This will generate an AppImage in `electron/dist`

## Attribution

Massive shoutout to [jhassan8](https://github.com/jhassan8), the original dev of the Crunchyroll app

Electron App Icon: https://www.flaticon.com/free-icons/crunchyroll
