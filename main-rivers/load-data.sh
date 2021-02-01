#!/bin/bash

echo Loading Main Rivers into database

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}main_rivers_10k${FMP_GDB_POSTFIX}.shp -nln ${FMP_DB_SCHEMA}.main_rivers_10k -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO -sql "SELECT status,length_km FROM main_rivers_10k" -lco GEOMETRY_NAME=wkb_geometry

echo Finished loading Main Rivers

exit 0
