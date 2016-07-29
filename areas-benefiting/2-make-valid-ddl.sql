\echo 'Areas Benefiting - MakeValid'

CREATE TABLE u_fmp.areas_benefiting_valid TABLESPACE fmp_tables AS WITH
	make_valid (layer,wkb_geometry) AS
	(SELECT layer,
		(ST_Dump(ST_MakeValid(wkb_geometry))).geom AS wkb_geometry FROM u_fmp.areas_benefiting
	)
SELECT * FROM make_valid WHERE ST_GeometryType(wkb_geometry) IN('ST_Polygon','ST_MultiPolygon');

ALTER TABLE u_fmp.areas_benefiting_valid ALTER COLUMN wkb_geometry TYPE geometry(MultiPolygon,27700) USING ST_Multi(wkb_geometry);

ALTER TABLE u_fmp.areas_benefiting_valid ADD COLUMN ogc_fid SERIAL;
UPDATE u_fmp.areas_benefiting_valid SET ogc_fid = DEFAULT;
ALTER TABLE u_fmp.areas_benefiting_valid ADD PRIMARY KEY(ogc_fid);
