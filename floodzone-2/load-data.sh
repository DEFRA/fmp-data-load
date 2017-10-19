#!/bin/bash

echo Loading Flood Zone 2 into database

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}nat_floodzone2_${FMP_FILE_VERSION}_5k_portal${FMP_GDB_POSTFIX}.shp -nln ${FMP_DB_SCHEMA}.floodzone_2 -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO -sql "SELECT fid_nat_fl,layer,type,fid_os_5km,name FROM nat_floodzone2_${FMP_FILE_VERSION}_5k_portal"

echo Finished loading Flood Zone 2

exit 0
