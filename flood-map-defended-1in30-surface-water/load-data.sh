#!/bin/bash

echo flood map defended 1 in 30 surface water present day into database

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}fmfp-nafra2-pilot-combined.gdb -nln ${FMP_DB_SCHEMA}.flood_map_defended_1in30_surface_water_present_day -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO -sql "SELECT origin,flood_zone,flood_source_and_state FROM flood_map_defended_1in30_surface_water_present_day" -lco GEOMETRY_NAME=wkb_geometry

echo flood map defended 1 in 30 surface water present day

exit 0
