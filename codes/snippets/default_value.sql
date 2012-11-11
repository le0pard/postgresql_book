CREATE FUNCTION ret_def(text,text,text) RETURNS text AS $$
SELECT 
  COLUMNS.column_default::text
FROM 
  information_schema.COLUMNS
  WHERE table_name = $2
  AND table_schema = $1
  AND column_name = $3
$$ LANGUAGE sql IMUTABLE;