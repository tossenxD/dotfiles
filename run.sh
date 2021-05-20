#!/bin/bash
pdir=$(dirname $(realpath $0))
echo ">What is the installation type? [full/basic/extras/dotfiles]"
read CHOICE
case $CHOICE in
  "full")
    install_type=(.basic.sh .extras.sh .dotfiles.sh)
    ;;
  "basic")
    install_type=(.basic.sh .dotfiles.sh)
    ;;
  "extras")
    install_type=(.extras.sh)
    ;;
  "dotfiles")
    install_type=(.dotfiles.sh)
    ;;
  *)
    echo "Invalid argument: $CHOICE"
    exit 1
    ;;
esac
echo ">Confirm $CHOICE installation? [yes]"
read CONFIRMATION
if [ $CONFIRMATION = "yes" ];
then
  source $pdir/$install_type
  echo ">run.sh complete :) Enjoy <3"
else
  echo ">Exiting"
fi
