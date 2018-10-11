#!/bin/bash

echo Loading Areas Benefiting

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}FMfP_portal_${FMP_FILE_VERSION}.gdb -nln ${FMP_DB_SCHEMA}.areas_benefiting nat_areasbenefit_${FMP_FILE_VERSION} -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO nat_areasbenefit_${FMP_FILE_VERSION}

echo Finished loading Areas Benefiting

exit 0
