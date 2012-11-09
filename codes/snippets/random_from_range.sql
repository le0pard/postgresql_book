CREATE OR REPLACE FUNCTION random(numeric, numeric)
RETURNS numeric AS
$$
   SELECT ($1 + ($2 - $1) * random())::numeric;
$$ LANGUAGE 'sql' VOLATILE;