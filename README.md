# Basic configuration
OS:        arch linux

Terminal:  urxvt

Editor:    neovim

Server:    xorg

WM:        bspwm

Hotkeys:   sxhkd

Toolbar:   polybar

# Installation
**Prerequisite:** Finish the official Arch Installation Guide and then install git and base-devel.

**Install:** Download the repo and run the install script.
```
$ git clone https://github.com/tossenxD/OS-configs
$ cd OS-configs/
$ chmod +x install.sh
$ ./install.sh
```

# After installation
To start the X window write the command beneath. A wallpaper can be downloaded from Firefox and set with Nitrogen.
```
$ startx
```

# Detailed package list
Packages can be modified in [install.sh](https://github.com/tossenxD/OS-configs/blob/main/install.sh).

**Hardware:** *amd-ucode, xf86-video-amdgpu*. For AMD GPU- and CPU-driver.

**Windows manager:** *bspwm, sxhkd, xorg, xorg-xinit, dmenu, polybar*. A tilling-window environment for X, with keybinds, a menu and a toolbar.

**Sound** *alsa-utils, alsa-firmware, pulseaudio, pulseaudio-alsa, pulseaudio-jack, pulsemixer*. alsa-utils is used for keybinds, firmware adds extra soundcard support. Pulseaudio and modules is for out-of-the-box audio without tinkering.

**Functionality:** *neovim, rxvt-unicode, xsel, python*. The terminal emulator is urxvt which is configured by Xresources. NeoVim is the editor and comes with configurations including automatic installs/upgrades of plugins and three LaTeX plugins. xsel is used as clipboard tool primarily as a bridge between NeoVim and system clipboard. Also installs python.

**Commandline utilities:** *mlocate, man-db, man-pages, ranger*. A file-explorer, locate-function and manuals.

**Graphical utilities:** *nitrogen, firefox, nautilus, screengrab, zathura, zathura-pdf-poppler*. Wallpaper setter, browser, file-explorer, screenshot utility and pdf-viewer.

**Package managers:** *yay, python-pip*. And AUR helper and python package installer. Both are used for installing other packages.

**Others:** *siji, ttf-unifont*. Both are used in the polybar configuration.

# Notable configurations
**Color themes:** Some color themes are included in the folder .colors/. .Xresources imports a color scheme and it will be used as system default.

**Shortcuts:** Multiple alias are defined in the .bashrc, some based on scripts from scripts/. WM keybinds are defined in .config/sxhkd/sxhkdrc. Once NeoVim has been opened, many snippets will be installed from the vim-snippet package, which contains unique shortcuts/snippets in NeoVim for many file-types (view ./config/nvim/init.vim for more NeoVim binds and pluggins).

**Other:** Keyboard-layout can be set in .xinitrc. More generally, settings can be found in the different dotfiles. Polybar multi-monitor support can be outcommented in .config/polybar/launch.sh.
