\echo 'flood map defended 1 in 30 river sea present day - Create Spatial Index'

CREATE INDEX flood_map_defended_1in30_river_sea_present_day_geom_idx
  ON flood_map_defended_1in30_river_sea_present_day
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
