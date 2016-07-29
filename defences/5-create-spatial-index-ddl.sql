\echo 'Defences - Create Spatial Index'

CREATE INDEX defences_wkb_geometry_geom_idx
  ON defences
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
