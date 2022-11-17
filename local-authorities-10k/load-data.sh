#!/bin/bash

echo Loading Local Authorities 10k

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}FMfP_portal_${FMP_FILE_VERSION}.gdb -nln ${FMP_DB_SCHEMA}.local_authorities_010k LOCAL_AUTHORITIES_010K -overwrite -progress --config PG_USE_COPY YES 

echo Finished loading Local Authorities 10k

exit 0
