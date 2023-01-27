#!/bin/bash

# Parse argv
path=$1
new_season_title=$2

cp get_id_template.sql get_id_final.sql
sed -i "s|XXX|$path|g" get_id_final.sql

cp update_metadata_template.sql update_metadata_final.sql
sed -i "s|YYY|$new_season_title|g" update_metadata_final.sql

docker cp modify_database.sh plex:/modify_database.sh
docker cp get_id_final.sql plex:/get_id_final.sql
docker cp update_metadata_final.sql plex:/update_metadata_final.sql

rm get_id_final.sql
rm update_metadata_final.sql

docker exec plex /modify_database.sh

docker exec plex bash -c "rm -f /update_metadata_final.sql /get_id_final.sql /modify_database.sh"