#!/usr/bin/python3

import os


series_path="Monogatari Series/[1] Monogatari Series - Bakemonogatari"
new_title="Nisekoi"

command = "./change_title.sh \"{}\" \"{}\"".format(series_path, new_title)

os.system(command)