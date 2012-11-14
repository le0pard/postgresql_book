SELECT foo.* FROM foo                                           
JOIN (SELECT id.val, row_number() over() FROM (VALUES(3),(2),(6),(1),(4)) AS
id(val)) AS id
ON (foo.catalog_id = id.val) ORDER BY row_number;