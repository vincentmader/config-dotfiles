#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"
dwm_taskwarrior () {
    inbox="$(task +in +PENDING count)"
    today="$(task +TODAY +PENDING count)"
    overdue="$(task +OVERDUE -DUE count)"

    # YELLOW="\033[0;33m"
    # RED="\033[0;31m"
    # BLUE="\033[0;34m"

    # NOCOLOR="\033[0m"

    # echo -e "${YELLOW} $today ${RED} $overdue ${BLUE} $inbox${NOCOLOR}"
    echo -e " $inbox  $overdue  $today"
}

dwm_taskwarrior
