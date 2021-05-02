# Basic configuration
OS:        arch linux

Terminal:  urxvt

Editor:    neovim

Server:    xorg

WM:        bspwm

Hotkeys:   sxhkd

Toolbar:   polybar

# Installation
**Prerequisite:** Go through the official Arch Installation Guide and install git.

**Install:** Download the repo and run the install script.
```
$ git clone https://github.com/tossenxD/OS-configs
$ cd OS-configs/
$ chmod +x install.sh
$ ./install.sh
```

# Detailed list
Packages can be modified in [install.sh](https://github.com/tossenxD/OS-configs/blob/main/install.sh).

**Hardware:** *amd-ucode, xf86-video-amdgpu*. For AMD GPU- and CPU-driver.

**Windows manager:** *bspwm, sxhkd, xorg, xorg-xinit, dmenu*. A tilling-window environment, with keybinds and menu, for X.

neovim  rxvt-unicode  nitrogen firefox nautilus ranger screengrab zathura  man-db man-pages python python-pip python2 python2-pip xsel xdotool mlocate
