#!/bin/bash
set -e

su - postgres -c "PGDATA=$PGDATA /usr/lib/postgresql/13/bin/pg_ctl -w start"

cat postgres_conf/pg_hba.conf > $PGDATA/pg_hba.conf
cat postgres_conf/postgresql.conf > $PGDATA/postgresql.conf

su - postgres -c "PGDATA=$PGDATA /usr/lib/postgresql/13/bin/pg_ctl -w restart"

sleep infinity
