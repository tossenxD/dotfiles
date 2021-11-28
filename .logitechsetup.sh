#!/bin/bash
echo ">Installing logiops"
yay -S --noconfirm logiops
echo ">Enable/start deamon"
sudo systemctl enable logid
sudo systemctl start logid
echo ">Link files"
PDIR=$(dirname $(realpath $0))
sudo ln -sf $PDIR/.config/logid.cfg /etc/logid.cfg
echo ">Setup complete, configure at /etc/logid.cfg"
