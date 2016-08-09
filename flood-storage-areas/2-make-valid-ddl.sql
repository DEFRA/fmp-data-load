\echo 'Flood Storage Areas - MakeValid'

CREATE TABLE fmp.flood_storage_areas_valid TABLESPACE fmp_tables AS WITH
	make_valid (layer,wkb_geometry) AS
	(SELECT layer,
		(ST_Dump(ST_MakeValid(wkb_geometry))).geom AS wkb_geometry FROM fmp.flood_storage_areas
	)
SELECT * FROM make_valid WHERE ST_GeometryType(wkb_geometry) IN('ST_Polygon','ST_MultiPolygon');

ALTER TABLE fmp.flood_storage_areas_valid ALTER COLUMN wkb_geometry TYPE geometry(MultiPolygon,27700) USING ST_Multi(wkb_geometry);

ALTER TABLE fmp.flood_storage_areas_valid ADD COLUMN ogc_fid SERIAL;
UPDATE fmp.flood_storage_areas_valid SET ogc_fid = DEFAULT;
ALTER TABLE fmp.flood_storage_areas_valid ADD PRIMARY KEY(ogc_fid);
