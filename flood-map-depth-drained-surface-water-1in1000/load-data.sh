#!/bin/bash

echo Load flood_map_with_depth_drained_surface_water_1in1000_present_day into database

ogr2ogr -a_srs "EPSG:27700" -f "PostgreSQL" PG:"host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME} user=${FMP_DB_USER} password=${FMP_DB_PASSWORD}" ${FMP_GDB_ROOT}fmfp-nafra2-pilot-combined.gdb -nln ${FMP_DB_SCHEMA}.flood_map_with_depth_drained_surface_water_1in1000_present_day -overwrite -progress --config PG_USE_COPY YES -nlt PROMOTE_TO_MULTI -lco SPATIAL_INDEX=${FMP_GENERATE_SPATIAL_INDEX} --config SPATIAL_INDEX NO -sql "SELECT depth_band FROM flood_map_with_depth_drained_surface_water_1in1000_present_day" -lco GEOMETRY_NAME=wkb_geometry

echo flood_map_with_depth_drained_surface_water_1in1000_present_day loaded into database

exit 0
