#!/bin/sh

info=$(playerctl metadata\
                 --player=spotify --format '{{artist}}\r{{album}}\r{{title}}')
echo -e "{\"tooltip\":\""$info"\"}"
