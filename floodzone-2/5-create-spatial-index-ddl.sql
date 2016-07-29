\echo 'Flood Zone 2 - Create Spatial Index'

CREATE INDEX floodzone_2_wkb_geometry_geom_idx
  ON floodzone_2
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
