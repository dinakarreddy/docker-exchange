#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER broker WITH PASSWORD 'broker';
    CREATE DATABASE broker;
    GRANT ALL PRIVILEGES ON DATABASE broker TO broker;
    CREATE USER exchange WITH PASSWORD 'exchange';
    CREATE DATABASE exchange;
    GRANT ALL PRIVILEGES ON DATABASE exchange TO exchange;
EOSQL
