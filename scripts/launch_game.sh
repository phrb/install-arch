#!/bin/bash

#
# Set resolution for gaming:
#
xrandr --output eDP1 --mode 1280x720

#
# Restore launch command:
#
GAME=$(echo ${1} | sed 's/ /\\ /g')

BUMBLEBEE_OPTIONS="optirun -b primus "

STEAM_OPTIONS="-novid -console"

COMMAND="${BUMBLEBEE_OPTIONS} ${GAME} ${STEAM_OPTIONS}"

#
# Run game:
#
eval "${COMMAND}"

#
# Restore FullHD resolution:
#
xrandr --output eDP1 --mode 1920x1080
