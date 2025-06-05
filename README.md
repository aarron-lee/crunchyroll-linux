# Crunchyroll for Linux

[![](https://img.shields.io/github/downloads/aarron-lee/crunchyroll-linux/total.svg)](https://github.com/aarron-lee/crunchyroll-linux/releases)

![app.jpg](https://raw.githubusercontent.com/aarron-lee/crunchyroll-tizen/master/app.jpg)

![layouts.gif](https://raw.githubusercontent.com/aarron-lee/crunchyroll-tizen/master/layouts.gif)

# Table of Contents

- [Description](#description)
- [Features](#features)
- [Installation](#install)
- [Steam Deck / Bazzite / ChimeraOS Install](#steam-deck--bazzite--chimeraos-installation)
- [Development](#development)
- [Controller Support](#controller-support)
- [Attribution](#attribution)

# Description:

This is a Linux port of the [Unofficial Tizen Crunchyroll App](https://github.com/jhassan8/crunchyroll-tizen).

# Features

Note that this is just a port of the Unofficial Tizen Crunchyroll App, there's currently no plans for to do any additional dev work or add new features. PRs are welcome.

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
- [x] Basic Game Controller support

# Install

## Manual Install

Download the latest AppImage from [releases](https://github.com/aarron-lee/crunchyroll-linux/releases)

Install it with an AppImage manager, my recommendation would be [GearLever](https://flathub.org/apps/it.mijorus.gearlever), but other alternatives like AppImageLauncher also works

## Flatpak install

flatpak currently requires a manual install, a flathub submission is being investigated.

See instructions here if you want to manually install the flatpak: https://github.com/aarron-lee/flathub/tree/crunchyroll-linux

## Quick Install

run the following script in terminal:

```
curl -H 'Cache-Control: no-cache, no-store' -L https://github.com/aarron-lee/crunchyroll-linux/raw/master/install.sh | sh
```

## Steam Deck / Bazzite / ChimeraOS Installation

Follow the regular install instructions, but afterwards also add it to Steam as a non-Steam game.

**The app should have basic controller support working, but if you prefer to use Steam Input to manage navigation, make sure to disable `Game Controller Support` in the Crunchyroll app's settings, and set a controller config in Steam Input.**

Then, in game mode, make sure to enable a Steam input community controller layout. It might require you to show all available layouts while selecting the layout.

I've tested the `Streaming Controls` Steam input community layout by Bleiodes, which works fairly well.

Also, in the Steam Game settings for the app, set the resolution as 1080p. The App was not designed for higher resolutions, you may see visual bugs at higher than 1080p resolutions.

# Controller Support

Note that the app has built in native game controller support.

However, I personally find that I prefer Steam Input for controller management, rather than the native game controller support.

To use Steam Input do the following:

1. login to the crunchyroll app
2. In the Crunchyroll app settings, disable the game controller support setting
3. If not already added to Steam, add the Crunchyroll app to Steam. Then, in Steam, make sure Steam Input is enabled for the crunchyroll app.
4. Look for a a community controller profile for the app, but if none is available, you can manually map a layout.
5. Map the following keyboard keys for the minimal mappings required for navigation:

- Enter to A (Playstation X)
- Esc to B (Playstation Circle)
- D-pad to Keyboard arrow keys

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
