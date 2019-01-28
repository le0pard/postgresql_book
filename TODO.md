Fixes:

 * https://www.citusdata.com/blog/2017/08/18/introducing-wal-g-faster-restores-for-postgres/
 * В главе "Репликация". "В частности, конфликты могут возникать по поводу того, в каком порядке должны применяться обновления. Например, предположим, что в результате выполнения транзакции А происходит вставка строки в реплику X, после чего транзакция B удаляет эту строку, а также допустим, что Y — реплика X. Если обновления распространяются на Y, но вводятся в реплику Y в обратном порядке (например, из-за разных задержек при передаче), то транзакция B не находит в Y строку, подлежащую удалению, и не выполняет своё действие, после чего транзакция А вставляет эту строку. Суммарный эффект состоит в том, что реплика Y содержит указанную строку, а реплика X — нет." Суть конфликта не понятна. Вообще непонятна.
 * В описании потоковой репликации ни слова про слоты репликации и настройку обратной связи. Это важный функционал репликации. Кстати там можно и про конфликты потоковой репликации рассказать.
 * В главе "Бэкап и восстановление PostgreSQL" Нет про горячее резервное копирование. Например, про pg_basebackup.
 * Нет ничего про настройку autovacuum. Крайне важная тема. https://www.citusdata.com/blog/2016/11/04/autovacuum-not-the-enemy/
 * В главе про dblink можно сказать, что модуль позволяет эмулировать автономные транзакции.
 * https://github.com/dhamaniasad/awesome-postgres

 * https://www.postgresql.org/docs/10/ddl-partitioning.html
 * https://blog.timescale.com/scaling-partitioning-data-postgresql-10-explained-cd48a712a9a1
 * https://wiki.postgresql.org/wiki/Table_partitioning
 * https://severalnines.com/blog/guide-partitioning-data-postgresql
 * https://pgdash.io/blog/partition-postgres-11.html
 * https://blog.2ndquadrant.com/partitioning-improvements-pg11/

 * https://www.postgresql.org/docs/10/parallel-query.html
 * https://blog.programster.org/postgresql-parallel-queries
 * https://blog.2ndquadrant.com/postgresql96-parallel-sequential-scan/

 * https://blog.2ndquadrant.com/databases-vs-encryption/
 * https://blog.2ndquadrant.com/partitioning-evolution-postgresql-11/
 * https://blog.2ndquadrant.com/sequential-uuid-generators/

 * https://blog.2ndquadrant.com/add-new-table-column-default-value-postgresql-11/

 * https://pgrouting.org/

 * https://pgdash.io/blog/postgres-replication-gotchas.html

 * https://www.timescale.com/
 * https://www.pipelinedb.com/
 * https://github.com/powa-team/pg_qualstats/
 * https://github.com/rjuju/pg_track_settings
 * https://github.com/powa-team/pg_stat_kcache/
 * https://github.com/HypoPG/hypopg
 * https://github.com/citusdata/pg_paxos/
 * https://pgxn.org/dist/cyanaudit
 * https://github.com/pgMemento/pgMemento
 * https://pgtap.org/
 * https://github.com/cockroachdb/cockroach
