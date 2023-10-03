#!/usr/bin/python

import os

os.system(f'amixer set Master toggle')
os.system('xsetroot -name "$($XDG_CONFIG_HOME/dwm/patches/statusbar/statusbar.sh)"')
