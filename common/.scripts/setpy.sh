#!/bin/bash
VERSION1=$(python -V 2>&1)

if [ "$1" == "3" ]; then
  sudo ln -sf /usr/bin/python3 /usr/bin/python
  VERSION2=$(python -V 2>&1)
  echo "Switched from $VERSION1 to $VERSION2"
  exit 0
elif [ "$1" == "2" ]; then
  sudo ln -sf /usr/bin/python2 /usr/bin/python
  VERSION2=$(python -V 2>&1)
  echo "Switched from $VERSION1 to $VERSION2"
  exit 0
else
  echo "use - 3 | 2"
  exit 1
fi
