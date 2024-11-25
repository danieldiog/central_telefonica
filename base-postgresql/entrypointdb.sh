#!/bin/bash

if [ ! -f "$PGDATA/PG_VERSION" ]; then
    echo "Inicializando o banco de dados..."
    /usr/pgsql-17/bin/initdb -D $PGDATA

    echo "Copiando arquivos de configuração personalizados..."
    cp /tmp/pg_hba.conf $PGDATA/pg_hba.conf
    cp /tmp/postgresql.conf $PGDATA/postgresql.conf
    chown postgres:postgres $PGDATA/pg_hba.conf $PGDATA/postgresql.conf
fi
exec /usr/pgsql-17/bin/postgres -D $PGDATA
