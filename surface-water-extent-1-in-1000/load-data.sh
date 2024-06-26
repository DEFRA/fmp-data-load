#!/bin/bash

echo Loading Surface Water Extent 1 in 1000

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}FMfP_portal_${FMP_FILE_VERSION}.gdb -nln ${FMP_DB_SCHEMA}.sw_extent_1in1000 ufmfsw_extent_1_in_1000_bv_bng -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO -lco GEOMETRY_NAME=wkb_geometry -makevalid

echo Finished loading Surface Water Extent 1 in 1000

exit 0
