CREATE USER chad WITH SUPERUSER CREATEDB CREATEROLE LOGIN ENCRYPTED PASSWORD 'chad_password' REPLICATION;
CREATE DATABASE chad_db WITH OWNER = chad;
CREATE USER virgin WITH LOGIN ENCRYPTED PASSWORD 'virgin_password' REPLICATION;
CREATE DATABASE virgin_db WITH OWNER = virgin;

\connect virgin_db

CREATE SCHEMA partman;
CREATE EXTENSION pg_partman SCHEMA partman;

CREATE ROLE partman WITH LOGIN;
GRANT ALL ON SCHEMA partman TO partman;
GRANT ALL ON ALL TABLES IN SCHEMA partman TO partman;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA partman TO partman;
GRANT EXECUTE ON ALL PROCEDURES IN SCHEMA partman TO partman;  -- PG11+ only
GRANT ALL ON SCHEMA public TO partman;
GRANT TEMPORARY ON DATABASE virgin_db to partman; -- allow creation of temp tables to move data out of default
GRANT CREATE ON DATABASE virgin_db TO partman;
GRANT TEMPORARY ON DATABASE chad_db to partman; -- allow creation of temp tables to move data out of default
GRANT CREATE ON DATABASE chad_db TO partman;
GRANT partman TO chad;
