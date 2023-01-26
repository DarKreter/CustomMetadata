#!/bin/bash

# Parse argv
series_title=$1
season_number=$2
new_season_title=$3

# sql query
sql_statement()
{
  echo "
WITH SERIES AS( 
SELECT 
    id, title
FROM 
    metadata_items
WHERE
    title=\"$series_title\"
)


UPDATE
    metadata_items
SET
    title=\"$new_season_title\"
FROM 
    metadata_items AS SEASON, SERIES
WHERE
    SEASON.parent_id = SERIES.id AND
    metadata_items.[index] = $season_number
;"
}

# Run plex-sqlite interpreter on main database
cd /usr/lib/plexmediaserver/
./Plex\ Media\ Server --sqlite /config/Library/Application\ Support/Plex\ Media\ Server/Plug-in\ Support/Databases/com.plexapp.plugins.library.db < <(sql_statement)

