Simple bash-python-sql script that changes anime season titles based on `.title` metadata files in plex Library
--


It works only for plex in docker container with name "plex".

**Install requirements:**
```
sudo apt update
sudo apt install python3 python3-pip
pip3 install argparse
```

**Usage**: `./update_metadata.py -d [path]`

It needs path to plex Library passed as argument.