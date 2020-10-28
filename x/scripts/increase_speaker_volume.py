#!/usr/bin/python

import os
import subprocess


amixer_output = subprocess.check_output('amixer')
val = int(str(amixer_output).split(' [')[1][:-2])
val += 5

os.system(f'amixer set Master {val}%')
os.system('sh ../../dwm/patches/statusbar/statusbar.sh')
