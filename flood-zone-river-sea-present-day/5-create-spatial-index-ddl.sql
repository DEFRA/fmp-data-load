\echo 'flood zone river sea present day - Create Spatial Index'

CREATE INDEX flood_zone_river_sea_present_day_geom_idx
  ON flood_zone_river_sea_present_day
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
