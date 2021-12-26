#!/usr/bin/python

import os

os.system(f'amixer set Master toggle')
os.system('xsetroot -name "$($CONF/dwm/patches/statusbar/statusbar.sh)"')
