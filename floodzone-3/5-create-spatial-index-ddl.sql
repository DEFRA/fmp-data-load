\echo 'Flood Zone 3 - Create Spatial Index'

CREATE INDEX floodzone_3_wkb_geometry_geom_idx
  ON floodzone_3
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
