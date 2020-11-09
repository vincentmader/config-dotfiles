#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ $STATUS = "Charging" ]; then
        CHARGE_ICON="↯"
    else
        CHARGE_ICON=""
    fi

    if [ "$CHARGE" -ge 80 ]; then
        echo " $CHARGE_ICON $CHARGE%"
    elif [ "$CHARGE" -le 80 ] && [ "$CHARGE" -gt 60 ]; then
        echo " $CHARGE_ICON $CHARGE%"
    elif [ "$CHARGE" -le 60 ] && [ "$CHARGE" -gt 40 ]; then
        echo " $CHARGE_ICON $CHARGE%"
    elif [ "$CHARGE" -le 40 ] && [ "$CHARGE" -gt 20 ]; then
        echo " $CHARGE_ICON $CHARGE%"
    else
        echo " $CHARGE_ICON $CHARGE%"
    fi
}

dwm_battery

