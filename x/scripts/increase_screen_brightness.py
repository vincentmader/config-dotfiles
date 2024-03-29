#!/usr/bin/python

import os
import subprocess


bctl_output = subprocess.check_output(
    # 'brightnessctl -d "gmux_backlight"', shell=True
    'brightnessctl', shell=True
)
val = int(str(bctl_output).split(' (')[1].split('%')[0])
val += 5

os.system(
    # f'brightnessctl -d "gmux_backlight" set {val}%'
    f'brightnessctl set {val}%'
)
os.system(
    'xsetroot -name "$($XDG_CONFIG_HOME/dwm/patches/statusbar/statusbar.sh)"'
)
