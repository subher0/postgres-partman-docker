#!/bin/bash
set -e

su - postgres -c "PGDATA=$PGDATA /usr/lib/postgresql/13/bin/initdb"

echo "######### INSTALLING PARTMAN ##############"
git clone https://github.com/pgpartman/pg_partman.git
cd pg_partman
make install

echo "######### STARTING POSTGRES ##############"
su - postgres -c "PGDATA=$PGDATA /usr/lib/postgresql/13/bin/pg_ctl -w start"

echo "######### INITIALISING DB ##############"
su - postgres -c "psql -f /postgres_scripts/init.sql"
