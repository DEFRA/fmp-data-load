#!/bin/bash

echo Main Rivers running database cleanse scripts

psql "user=${FMP_DB_USER} password=${FMP_DB_PASSWORD} host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME}" -f run.sql -X --echo-queries --set ON_ERROR_STOP=on -w

echo Finished Main Rivers cleanse

exit 0
