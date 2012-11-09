select a || ' from (select ' || quote_literal(a) || b || ', ' || quote_literal(b) || '::text as b) as quine' from 
(select 'select a || '' from (select '' || quote_literal(a) || b || '', '' || quote_literal(b) || ''::text as b) as 
quine'''::text as a, '::text as a'::text as b) as quine;