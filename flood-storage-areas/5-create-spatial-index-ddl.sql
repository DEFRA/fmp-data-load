\echo 'Flood Storage Areas - Create Spatial Index'

CREATE INDEX flood_storage_areas_wkb_geometry_geom_idx
  ON flood_storage_areas
  USING gist
  (wkb_geometry)
TABLESPACE fmp_indexes;
