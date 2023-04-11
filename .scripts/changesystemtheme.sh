#!/bin/bash
echo "-------------------------"

colors=$(ls $HOME/.colors/)
i=1

for c in $colors; do
  echo "$i $c"
  file[i]=$c
  i=$((i + 1))
done

echo "-------------------------"
echo "Choose a theme by number:"
read COLOR
while [ $COLOR -ge $i -o $COLOR -le 0 ]; do
  echo "Please select a valid number"
  read COLOR
done

echo "Setting theme: ${file[$COLOR]}"
sed -i --follow-symlinks "s/\(\#include\ \".colors\/\).*/\1${file[$COLOR]}\"/" $HOME/.Xresources
sed -i --follow-symlinks "s/\(\#include\ \".colors\/\).*/\1${file[$COLOR]}\"/" $HOME/.Xdefaults
bspc wm -r
xrdb -merge $HOME/.Xresources
