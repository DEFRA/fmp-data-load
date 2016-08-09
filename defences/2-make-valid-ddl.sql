\echo 'Defences - MakeValid'

CREATE TABLE fmp.defences_valid TABLESPACE fmp_tables AS WITH
	make_valid (layer,wkb_geometry) AS
	(SELECT layer,
		(ST_Dump(ST_MakeValid(wkb_geometry))).geom AS wkb_geometry FROM fmp.defences
	)
SELECT * FROM make_valid WHERE ST_GeometryType(wkb_geometry) IN('ST_LineString','ST_MultiLineString');

ALTER TABLE fmp.defences_valid ALTER COLUMN wkb_geometry TYPE geometry(MultiLineString,27700) USING ST_Multi(wkb_geometry);

ALTER TABLE fmp.defences_valid ADD COLUMN ogc_fid SERIAL;
UPDATE fmp.defences_valid SET ogc_fid = DEFAULT;
ALTER TABLE fmp.defences_valid ADD PRIMARY KEY(ogc_fid);
