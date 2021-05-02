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

# Detailed package list
Packages can be modified in [install.sh](https://github.com/tossenxD/OS-configs/blob/main/install.sh).

**Hardware:** *amd-ucode, xf86-video-amdgpu*. For AMD GPU- and CPU-driver.

**Windows manager:** *bspwm, sxhkd, xorg, xorg-xinit, dmenu*. A tilling-window environment, with keybinds and menu, for X.

**Functionality:** *neovim, rxvt-unicode, xsel*. The terminal emulator is urxvt which is configured by Xresources. NeoVim is the editor and comes with configurations including automatic installs/upgrades of plugins and three LaTeX plugins. xsel is used as clipboard tool primarily as a bridge between NeoVim and system clipboard.

**Commandline utilities:** *mlocate, man-db, man-pages, ranger*. A file-explorer, locate-function and manuals.

nitrogen firefox nautilus  screengrab zathura   python python-pip python2 python2-pip  xdotool 
