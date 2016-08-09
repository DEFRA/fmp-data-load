#!/bin/bash

# echo copying data from S3 repository

# s3cmd sync --delete-removed s3://ltfri/flood_storage_areas/ ${LTFRI_GDB_ROOT}flood_storage_areas/

echo Loading Flood Storage Areas into database

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}nat_fsa_v201602${FMP_GDB_POSTFIX}.shp -nln ${FMP_DB_SCHEMA}.flood_storage_areas -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO nat_fsa_v201602

echo Flood Storage Areas running database scripts

psql "user=${FMP_DB_USER} password=${FMP_DB_PASSWORD} host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME}" -f run.sql -X --echo-queries --set ON_ERROR_STOP=on -w 

echo Finished loading Flood Storage Areas 

exit 0







