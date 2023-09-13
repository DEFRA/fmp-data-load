\echo 'flood_map_with_depth_defended_river_1in30_sea_1in30_present_day - Create Spatial Index'

CREATE INDEX flood_map_with_depth_defended_river_1in30_present_day_geom_idx
  ON flood_map_with_depth_defended_river_1in30_present_day
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
