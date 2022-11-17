#!/bin/bash

echo Loading C and E Team Email

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}FMfP_portal_${FMP_FILE_VERSION}.gdb -nln ${FMP_DB_SCHEMA}.c_and_e_team_email C_AND_E_TEAM_EMAIL -overwrite -progress --config PG_USE_COPY YES

echo Finished loading C and E Team Email

exit 0
