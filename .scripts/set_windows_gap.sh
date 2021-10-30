#!/bin/bash
echo "bspwm window gap? y/n"
read CHOICE
LEGAL=0

if [ $CHOICE == "y" -o $CHOICE == "Y" ]
then
  BWIDTH=6
  BGAP=8
  BPAD=50
  PWIDTH=70
  POFFSETX=15
  POFFSETY=1
  LEGAL=1
else
  if [ $CHOICE == "n" -o $CHOICE == "n" ]
  then
    BWIDTH=2
    BGAP=0
    BPAD=36.5
    PWIDTH=100
    POFFSETX=0
    POFFSETY=0
    LEGAL=1
  fi
fi

if [ $LEGAL == 1 ]
then
  sed -i --follow-symlinks "s/\(bspc\ config\ border\_width\).*/\1\ ${BWIDTH}/" $HOME/.config/bspwm/bspwmrc
  sed -i --follow-symlinks "s/\(bspc\ config\ window\_gap\).*/\1\ ${BGAP}/" $HOME/.config/bspwm/bspwmrc
  sed -i --follow-symlinks "s/\(bspc\ config\ top\_padding\).*/\1\ ${BPAD}/" $HOME/.config/bspwm/bspwmrc
  sed -i --follow-symlinks "s/\(width\ =\).*/\1\ ${PWIDTH}\%/" $HOME/.config/polybar/config
  sed -i --follow-symlinks "s/\(offset-x\ =\).*/\1\ ${POFFSETX}\%/" $HOME/.config/polybar/config
  sed -i --follow-symlinks "s/\(offset-y\ =\).*/\1\ ${POFFSETY}\%/" $HOME/.config/polybar/config
  bspc wm -r
else
  echo "Invalid input"
fi
