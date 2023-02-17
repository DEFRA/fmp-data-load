#!/bin/bash

echo Loading Reduction in RoFRS

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}FMfP_portal_${FMP_FILE_VERSION}.gdb -nln ${FMP_DB_SCHEMA}.reduction_in_rofrs Reduction_in_RoFRS_${FMP_FILE_VERSION} -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO -sql "SELECT suitability FROM Reduction_in_RoFRS_${FMP_FILE_VERSION}" -lco GEOMETRY_NAME=wkb_geometry

echo Finished loading Reduction in RoFRS

exit 0
