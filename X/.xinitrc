#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

setxkbmap br &
xrdb -merge ~/.Xresources &
wicd-gtk --tray &
xbindkeys &
xset -b &
xset s 3600 3600 &
xset -dpms &
compton -b --config ~/.config/compton.conf &
exec awesome
