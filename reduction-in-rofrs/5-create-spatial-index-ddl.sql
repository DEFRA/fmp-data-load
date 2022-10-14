\echo 'Areas Benefiting - Create Spatial Index'

CREATE INDEX reduction_in_rofrs_wkb_geometry_geom_idx
  ON reduction_in_rofrs
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
