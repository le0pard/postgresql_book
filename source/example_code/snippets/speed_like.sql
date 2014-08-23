prefix_test=# create table tags (
prefix_test(#  tag    text primary key,
prefix_test(#  name      text not null,
prefix_test(#  shortname text,
prefix_test(#  status    char default 'S',
prefix_test(#
prefix_test(#  check( status in ('S', 'R') )
prefix_test(# );
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "tags_pkey" for table "tags"
CREATE TABLE
prefix_test=# CREATE INDEX i_tag ON tags USING btree(lower(tag)  text_pattern_ops);
CREATE INDEX

prefix_test=# create table invalid_tags (
prefix_test(#  tag    text primary key,
prefix_test(#  name      text not null,
prefix_test(#  shortname text,
prefix_test(#  status    char default 'S',
prefix_test(#
prefix_test(#  check( status in ('S', 'R') )
prefix_test(# );
NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "invalid_tags_pkey" for table "invalid_tags"
CREATE TABLE



prefix_test=# select count(*) from tags;
 count
-------
 11966
(1 row)

prefix_test=# select count(*) from invalid_tags;
 count
-------
 11966
(1 row)

# EXPLAIN ANALYZE select * from invalid_tags where lower(tag) LIKE lower('0146%');
                                                 QUERY PLAN
------------------------------------------------------------------------------------------------------------
 Seq Scan on invalid_tags  (cost=0.00..265.49 rows=60 width=26) (actual time=0.359..20.695 rows=1 loops=1)
   Filter: (lower(tag) ~~ '0146%'::text)
 Total runtime: 20.803 ms
(3 rows)

# EXPLAIN ANALYZE select * from invalid_tags where lower(tag) LIKE lower('0146%');
                                                 QUERY PLAN
------------------------------------------------------------------------------------------------------------
 Seq Scan on invalid_tags  (cost=0.00..265.49 rows=60 width=26) (actual time=0.549..19.503 rows=1 loops=1)
   Filter: (lower(tag) ~~ '0146%'::text)
 Total runtime: 19.550 ms
(3 rows)

# EXPLAIN ANALYZE select * from tags where lower(tag) LIKE lower('0146%');
                                                      QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------
 Bitmap Heap Scan on tags  (cost=5.49..97.75 rows=121 width=26) (actual time=0.054..0.057 rows=1 loops=1)
   Filter: (lower(tag) ~~ '0146%'::text)
   ->  Bitmap Index Scan on i_tag (cost=0.00..5.46 rows=120 width=0) (actual time=0.032..0.032 rows=1 loops=1)
         Index Cond: ((lower(tag) ~>=~ '0146'::text) AND (lower(tag) ~<~ '0147'::text))
 Total runtime: 0.119 ms
(5 rows)

# EXPLAIN ANALYZE select * from tags where lower(tag) LIKE lower('0146%');
                                                      QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------
 Bitmap Heap Scan on tags  (cost=5.49..97.75 rows=121 width=26) (actual time=0.025..0.025 rows=1 loops=1)
   Filter: (lower(tag) ~~ '0146%'::text)
   ->  Bitmap Index Scan on i_tag (cost=0.00..5.46 rows=120 width=0) (actual time=0.016..0.016 rows=1 loops=1)
         Index Cond: ((lower(tag) ~>=~ '0146'::text) AND (lower(tag) ~<~ '0147'::text))
 Total runtime: 0.050 ms
(5 rows)