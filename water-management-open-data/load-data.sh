#!/bin/bash

echo Loading Water Management Open Data

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}FMfP_portal_${FMP_FILE_VERSION}.gdb -nln ${FMP_DB_SCHEMA}.water_management_open_data WATER_MANAGEMENT_AREAS_OPEN_DATA -overwrite -progress --config PG_USE_COPY YES 

echo Finished loading Water Management Open Data

exit 0
