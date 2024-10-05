# Set display options
xrandr --output DisplayPort-1 --left-of DisplayPort-0 #--rotate left

# Reload process
bspc wm -r
nitrogen --restore &
