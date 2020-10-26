#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_sound_volume () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    VOLUME="$(amixer sget Master | grep 'Right:' | awk -F"[][]" '{ print $2 }' | awk -F"[%]" '{ print $1 }')"

    if [ "$VOLUME" -ge 60 ]; then
        echo "  $VOLUME%"
    elif [ "$VOLUME" -lt 60 ] && [ "$VOLUME" -gt 0 ]; then
        echo "  $VOLUME%"
    else
        echo "  $VOLUME%"
    fi
}

dwm_sound_volume

