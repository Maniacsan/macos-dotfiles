#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set "$NAME" \
             label="$INFO" \
             label.font="SF Pro:Heavy:13.0" \
             label.padding_left=8 \
             label.padding_right=10 \
             background.height=25 \
             #background.color=0x44FFFFFF \
             #background.corner_radius=12 \
fi
#  