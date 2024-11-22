#!/bin/bash

# Inicializa o banco de dados, se necessário
if [ ! -f "$PGDATA/PG_VERSION" ]; then
    echo "Inicializando o banco de dados..."
    /usr/pgsql-17/bin/initdb -D $PGDATA

    echo "Copiando arquivos de configuração personalizados..."
    cp /tmp/pg_hba.conf $PGDATA/pg_hba.conf
    cp /tmp/postgresql.conf $PGDATA/postgresql.conf
    chown postgres:postgres $PGDATA/pg_hba.conf $PGDATA/postgresql.conf
fi

# Iniciar o PostgreSQL
echo "Iniciando o PostgreSQL..."
exec /usr/pgsql-17/bin/postgres -D $PGDATA
