#!/bin/sh

weather=($(curl wttr.in/?format="%c+%l+%t+%f+%w+%h"))

echo -e "{\"text\":\""${weather[0]} ${weather[3]}"\", \"tooltip\":\""${weather[0]} ${weather[1]} ${weather[2]}: ${weather[3]} \(${weather[4]}\), ${weather[5]}, ${weather[6]}"\"}"
