\echo 'Areas Benefiting - Create Spatial Index'

CREATE INDEX areas_benefiting_wkb_geometry_geom_idx
  ON areas_benefiting
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
