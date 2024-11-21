#!/bin/bash
# Verificar se o banco de dados já foi inicializado
if [ ! -f "$PGDATA/PG_VERSION" ]; then
    echo "Inicializando o banco de dados..."
    /usr/pgsql-${POSTGRES_VERSION}/bin/initdb -D $PGDATA
fi

# Executar o comando padrão do PostgreSQL
exec "$@"
