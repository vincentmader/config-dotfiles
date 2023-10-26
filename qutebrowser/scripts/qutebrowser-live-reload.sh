#!/bin/bash

######
#
# The MIT License (MIT)
# 
# Copyright (c) 2021 Austin Lowery
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
######

######
#
# Qutebrowser Live Reload UserScript
#
# Dependencies: Qutebrowser, entr, bash, find, sed
# 
# Purpose: 
#     Enables a user to live reload any webpage when a file is added,
#     removed, or modified within a directory on their local filesystem.
#     Standard application would be for a web developer who is editing a website
#     that is being served from his/her local computer. Atypical use might be to
#     reload an arbitrary webpage in Qutebrowser based on some filesystem event on
#     the local computer.
# 
# Intended for use on Linux. Specifically created and tested on Ubuntu 20.10.
# 
# This is a BASH script as opposed to a sh script due to entr's requirement to
# to have locally defined functions exported before it can exec them.
#
# Be Aware:
#     Qutebrowser doesn't provide a way to kill a userscript from the browser
#     that I am aware of. This means that you'll need to close Qutebrowser 
#     in order to stop this script. It is possible to have multiple of this script
#     running at the same time if you haven't stopped Qutebrowser in between new
#     invocations of the script.
#
######

######
#
# INSTALLATION
#
# 1. Install the depenencies listed above 
#     (Typically entr is the only one you may not already have)
#
# 2. Copy this script to: 
#     ~/.local/share/qutebrowser/userscripts/qutebrowser-live-reload.sh
#
# 3. Make it executable with:
#     chmod +x ~/.local/share/qutebrowser/userscripts/qutebrowser-live-reload.sh
#
# 4. Optionally edit this script below to hard code a custom $QLRUWATCHDIR
#    which is the directory that holds the codebase that you're editing.
#
# 5. Optionally bind this script to a shorcut with the following steps:
#     a. Open Qutebrowser
#     b. Open the command prompt with: 
#        SHIFT + :
#     c. Paste in the following: 
#        bind <Ctrl+Shift+r> spawn --userscript -v -m qutebrowser-live-reload.sh
#          Note: You may optionally pass in the path to your codebase at the 
#          end of the above bind command.
#     d. Press Enter to bind the the shorcut to the command
#
######

######
#
# USAGE
#
# 1. Open your locally hosted site in qutebrowser
# 2. If you configured the shorcut from step 5 above, use that to start the script
# 3. Or press: SHIFT + : and enter the following command:
#    spawn --userscript -v -m qutebrowser-live-reload.sh [ /path/to/your/codebase ]
# 4. Now that the script is running, your site will automatically reload on any edit
#
######

# This whole QUTE_COUNT business below has to happen because I have not found
# a way to identify the currently focused tab ID in qutebrowser from userscripts.
# If the target browser tab is not specified by the user through QUTE_COUNT, 
# I just use :tab-move without an argument to move the currently focused tab to 
# the 0 position so that I know which tab I'm working with.
if [ -z "$QUTE_COUNT" ];then
        echo ":tab-move" > $QUTE_FIFO
        QUTE_COUNT=0
        echo ":message-info 'Custom tab not specified. Moving this tab to position 0.'" > $QUTE_FIFO
fi

if [ -z "$1" ];then
        QLRUWATCHDIR=/home/vinc/code/mader.xyz/frontend-js
else
        QLRUWATCHDIR="$1"
        # Remember that the quotes on $1 would prevent ~ from being expanded if it
        # were passed to the script in an unexpanded state.
fi

# Manually set and export SHELL to keep entr happy in all situations
export SHELL=/bin/bash
export QUTE_COUNT
export QUTE_FIFO

reportAndReload () {
        # echo ":message-info 'Changed: '$1" > $QUTE_FIFO
        # echo ":message-info 'Now Reloading.'" > $QUTE_FIFO
        echo ":run-with-count $QUTE_COUNT reload " > $QUTE_FIFO
        # echo ":reload -f" > $QUTE_FIFO
}

export -f reportAndReload

while true
do
        # Removing all .swp files from the watch list prevents double reloads when editing with vim
        find $QLRUWATCHDIR -type f | sed '/.swp$/d' | entr -dn -s 'reportAndReload $0'
done
