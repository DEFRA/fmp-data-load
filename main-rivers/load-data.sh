#!/bin/bash

# echo copying data from S3 repository

# s3cmd sync --delete-removed s3://ltfri/main_rivers_10k/ ${LTFRI_GDB_ROOT}main_rivers_10k/

echo Loading Main Rivers into database

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}main_rivers_10k${FMP_GDB_POSTFIX}.shp -nln ${FMP_DB_SCHEMA}.main_rivers_10k -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO main_rivers_10k

echo Main Rivers running database scripts

psql "user=${FMP_DB_USER} password=${FMP_DB_PASSWORD} host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME}" -f run.sql -X --echo-queries --set ON_ERROR_STOP=on -w 

echo Finished loading Main Rivers

exit 0








