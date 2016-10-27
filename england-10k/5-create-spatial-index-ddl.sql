\echo 'England - Create Spatial Index'

CREATE INDEX england_wkb_geometry_geom_idx
  ON england
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
