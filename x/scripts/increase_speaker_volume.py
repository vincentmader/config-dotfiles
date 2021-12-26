#!/usr/bin/python

import os
import subprocess


amixer_output = subprocess.check_output('amixer')
val = int(str(amixer_output).split(' [')[1][:-2])
if val > 95:
    val = 100
else:
    val += 5

os.system(f'amixer set Master {val}%')
os.system('xsetroot -name "$($CONF/dwm/statusbar/statusbar.sh)"')
