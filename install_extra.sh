#!/bin/bash 
printf "\n>Installing extra packages\n\n"
# Install extra packages
sudo pacman -Syu --noconfirm texlive-most dotnet-runtime jdk-openjdk neofetch

