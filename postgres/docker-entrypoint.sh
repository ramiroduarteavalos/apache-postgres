#!/usr/bin/env bash

if [ ! -d "$PG_DATA" ]; then

  echo "${PG_PASSWORD}" > ${PG_PASSWORD_FILE}
  chmod 600 ${PG_PASSWORD_FILE}

  ${PG_BINDIR}/initdb --pgdata=${PG_DATA} --pwfile=${PG_PASSWORD_FILE} \
    --username=postgres --encoding=UTF8 --auth=trust
  
  psql --command "CREATE USER ${USER} WITH SUPERUSER PASSWORD '${PASSWORD}';"
  
  createdb -O ${DATABASE} ${USER}
  
  unset PG_PASSWORD
fi

exec ${PG_BINDIR}/postgres -D ${PG_DATA} -c config_file=${PG_CONFIG_FILE}
