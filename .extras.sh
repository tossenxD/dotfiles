#!/bin/bash 
echo ">Beginning installation of extra packages"
sudo pacman -Syu --noconfirm texlive-most dotnet-runtime jdk-openjdk neofetch
echo ">Finished installation of extra packages"
