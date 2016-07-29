\echo 'Main Rivers - Create Spatial Index'

CREATE INDEX main_rivers_10k_wkb_geometry_geom_idx
  ON main_rivers_10k
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
