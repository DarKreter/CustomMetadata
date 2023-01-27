#!/usr/bin/python3
import os
import argparse
from pathlib import Path

# Call parameters
parser = argparse.ArgumentParser()
parser.add_argument("-d",  type=str, required=True, 
                    help="path to plex library")
args = parser.parse_args()


for path in Path(args.d).rglob('.title'):
    f = open(path, "r")
    new_title = f.read()
    
    series_path = "{}/{}".format(path.parent.parent.name, path.parent.name)
    
    start = path.parent.name.find('[')
    stop = path.parent.name.find(']')
    season_number = path.parent.name[start+1:stop]
    
    print("Changing season title for: \"{}\"!".format(path.parent.parent.name))
    print("Season {} -----> '{}'... ".format(season_number, new_title), end='')

    command = "./change_title.sh \"{}\" \"{}\"".format(series_path, new_title)
    os.system(command)
    
    print("DONE\n")

