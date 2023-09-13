\echo 'flood_map_with_depth_drained_surface_water_1in1000_present_day - Create Spatial Index'

CREATE INDEX flood_map_with_depth_drained_surface_water_1in1000_geom_idx
  ON flood_map_with_depth_drained_surface_water_1in1000_present_day
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
