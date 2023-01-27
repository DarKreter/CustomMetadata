#!/bin/bash

cd /usr/lib/plexmediaserver/

# Run plex-sqlite interpreter on main database
series_id=$(./Plex\ Media\ Server --sqlite /config/Library/Application\ Support/Plex\ Media\ Server/Plug-in\ Support/Databases/com.plexapp.plugins.library.db < /get_id_final.sql)

echo $series_id
sed -i "s|XXX|$series_id|g" /update_metadata_final.sql


./Plex\ Media\ Server --sqlite /config/Library/Application\ Support/Plex\ Media\ Server/Plug-in\ Support/Databases/com.plexapp.plugins.library.db < /update_metadata_final.sql

exit