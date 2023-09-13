\echo 'flood zone surface water present day - Create Spatial Index'

CREATE INDEX flood_zone_surface_water_present_day_geom_idx
  ON flood_zone_surface_water_present_day
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
