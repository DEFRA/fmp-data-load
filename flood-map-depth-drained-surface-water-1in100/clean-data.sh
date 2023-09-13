#!/bin/bash

echo flood_map_with_depth_drained_surface_water_1in100_present_day running database cleanse scripts

psql "user=${FMP_DB_USER} password=${FMP_DB_PASSWORD} host=${FMP_DB_HOST} port=${FMP_DB_PORT} dbname=${FMP_DB_NAME}" -f run.sql -X --echo-queries --set ON_ERROR_STOP=on -w

echo Finished flood_map_with_depth_drained_surface_water_1in100_present_day cleanse

exit 0
