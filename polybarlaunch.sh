#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using defult config location ~/.config/polybar/launch.sh
#polybar default &


# Polybar setup for multiple displays
if type "xrandr"; then
  # Find and save primary screen
  primary=$(xrandr --query | grep -w primary | cut -d" " -f1)
  # If primary screen; set default bar: else; set alternative bar
  for m in $(xrandr --query | grep -w connected | cut -d" " -f1); do
    if [ $m == $primary ]; then
      MONITOR=$m polybar --reload default &
    else
      MONITOR=$m polybar --reload alternative &
    fi
  done
else
  polybar --reload default &
fi

echo "Bars launched..."
