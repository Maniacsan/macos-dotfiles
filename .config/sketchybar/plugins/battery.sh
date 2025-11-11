#!/usr/bin/env sh

# Battery is here bcause the ICON_COLOR doesn't play well with all background colors

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
[8-9][0-9] | 100)
    ICON=""
    ;;
7[0-9])
    ICON=""
    ;;
[4-6][0-9])
    ICON=""
    ;;
[1-3][0-9])
    ICON=""
    ICON_COLOR=0xffee99a0
    ;;
[0-9])
    ICON=""
    ICON_COLOR=0xffed8796
    ;;
esac

if [[ $CHARGING != "" ]]; then
    ICON=""
    ICON_COLOR=0xffeed49f
fi

sketchybar --set $NAME \
    label="${PERCENTAGE}%" \
    icon.color=${ICON_COLOR} \
    icon=$ICON \
    icon.font="Hack Nerd Font:Bold:17.0" 