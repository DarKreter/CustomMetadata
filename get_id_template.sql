SELECT 
    season.id
FROM 
    directories
INNER JOIN
    media_parts ON
    directories.id = media_parts.directory_id
INNER JOIN 
    media_items ON
    media_items.id = media_parts.media_item_id
INNER JOIN
    metadata_items AS episodes ON
    episodes.id = media_items.metadata_item_id
INNER JOIN
    metadata_items AS season ON
    season.id = episodes.parent_id
WHERE 
    directories.path='XXX'
GROUP BY 
    season.id
;