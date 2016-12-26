#! /usr/bin/zsh

# get mode values with "cvt 1680 1050"

xrandr --newmode "1680x1050"  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync
xrandr --addmode DP1 1680x1050
xrandr --output DP1 --mode 1680x1050 --above eDP1
