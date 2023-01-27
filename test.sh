#!/bin/bash

# Parse argv
series_title=$1
season_number=$2
new_season_title=$3

# sql read series id query
sql_read_series_id()
{
  echo "
SELECT
    id
FROM
    metadata_items
WHERE 
    title='$series_title'
;"
}

# Run plex-sqlite interpreter on main database
cd /usr/lib/plexmediaserver/
series_id=$(./Plex\ Media\ Server --sqlite /config/Library/Application\ Support/Plex\ Media\ Server/Plug-in\ Support/Databases/com.plexapp.plugins.library.db < <(sql_read_series_id))


sql_modify_season()
{
  echo "
UPDATE
    metadata_items
SET
    title='$new_season_title'
WHERE 
    parent_id='$series_id' AND
    [index]=$season_number
;"
}

./Plex\ Media\ Server --sqlite /config/Library/Application\ Support/Plex\ Media\ Server/Plug-in\ Support/Databases/com.plexapp.plugins.library.db < <(sql_modify_season)
