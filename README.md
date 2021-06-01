# Essence of setup
OS:        arch linux

Terminal:  urxvt

Editor:    neovim

Server:    xorg

WM:        bspwm

Hotkeys:   sxhkd

Toolbar:   polybar

# Installation
**Prerequisite:** Finish the official Arch Installation Guide and then install git and base-devel.

**Install:** Download the repo and run the startup script.
```
$ git clone https://github.com/tossenxD/dotfiles
$ ./dotfiles/run.sh
```
There are 4 installation types. [run](https://github.com/tossenxD/dotfiles/blob/main/run.sh) will ask you for a type and to confirm the selected type.
| includes | [basic packages, directories & wallpaper](https://github.com/tossenxD/dotfiles/blob/main/.basic.sh) | [extra packages](https://github.com/tossenxD/dotfiles/blob/main/.extras.sh) | [dotfiles](https://github.com/tossenxD/dotfiles/blob/main/.dotfiles.sh) |
| ---------|:----------------------:|:--------------:|:--------:|
| full     | x                      | x              | x        |
| basic    | x                      |                | x        |
| extras   |                        | x              |          |
| dotfiles |                        |                | x        |


# After full installation
To start X window write the command beneath. If you have sound-problems a reboot should fix it.
```
$ startx
```

# Detailed package list of basic packages
Packages can be modified in [.basic.sh](https://github.com/tossenxD/dotfiles/blob/main/.basic.sh). This list does not include [.extras.sh](https://github.com/tossenxD/dotfiles/blob/main/.extras.sh).

**Hardware:** *amd-ucode, xf86-video-amdgpu*. For AMD GPU- and CPU-driver.

**Windows manager:** *bspwm, sxhkd, xorg, xorg-xinit, dmenu, polybar*. A tilling-window environment for X, with keybinds, a menu and a toolbar.

**Sound** *alsa-utils, alsa-firmware, pulseaudio, pulseaudio-alsa, pulseaudio-jack, pulsemixer*. alsa-utils is used for keybinds, firmware adds extra soundcard support. Pulseaudio and modules is for out-of-the-box audio without tinkering.

**Functionality:** *neovim, rxvt-unicode, xsel, python*. The terminal emulator is urxvt which is configured by Xresources. NeoVim is the editor and comes with configurations including automatic installs/upgrades of plugins and three LaTeX plugins. xsel is used as clipboard tool primarily as a bridge between NeoVim and system clipboard. Also installs python.

**Commandline utilities:** *mlocate, man-db, man-pages, ranger (ueberzug, python-pygments), trash-cli, w3m*. A locate-function, manuals, file-explorer (with previews), trash client and browser.

**Graphical utilities:** *nitrogen, firefox, nautilus, screengrab, zathura, zathura-pdf-poppler, sxiv*. Wallpaper setter, browsers, file-explorer, screenshot utility, image-viewer and pdf-viewer.

**Package managers:** *yay, python-pip*. And AUR helper and python package installer. Both are used for installing other packages.

**Others:** *siji, ttf-unifont*. Both are used in the polybar configuration.

# Notable configurations
**Color themes:** Color themes are located in the directory [.colors/](https://github.com/tossenxD/dotfiles/blob/main/.colors/). Color themes is declared in [.Xresources](https://github.com/tossenxD/dotfiles/blob/main/.Xresources) and is used systemwide after declaration. A script to change color theme is aliased to "systheme". Calling this command in a terminal will allow you to choose a theme and it will automaticly be declared in .Xresources and refresh.

**Shortcuts:** Multiple alias are defined in the .bashrc, some based on scripts from scripts/. WM keybinds are defined in .config/sxhkd/sxhkdrc. On first NeoVim launch pluggins will be installed. These pluggins include shortcuts and snippets in NeoVim. View [.config/nvim/](https://github.com/tossenxD/dotfiles/blob/main/.config/nvim/)) for further information on how NeoVim binds and pluggins are setup.

**Other:** Keyboard-layout can be set in .xinitrc. Configurations are in the different dotfiles. Polybar multi-monitor support can be outcommented in .config/polybar/launch.sh.
