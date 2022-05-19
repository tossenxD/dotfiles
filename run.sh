#!/bin/bash
PDIR=$(dirname $(realpath $0))
echo ">What is the installation type? [full/basic/extras/dotfiles]"
read CHOICE
case $CHOICE in
"full")
  FILES=".basic.sh .extras.sh .dotfiles.sh"
  ;;
"basic")
  FILES=".basic.sh .dotfiles.sh"
  ;;
"extras")
  FILES=".extras.sh"
  ;;
"dotfiles")
  FILES=".dotfiles.sh"
  ;;
*)
  echo "Invalid argument: $CHOICE"
  exit
  ;;
esac
echo ">Confirm $CHOICE installation? [yes]"
read CONFIRMATION
if [ $CONFIRMATION = "yes" ]; then
  for FILE in $FILES; do
    ($PDIR/$FILE)
  done
  echo ">run.sh complete :) Enjoy <3"
else
  echo ">Exiting"
fi
