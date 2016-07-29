\echo 'Main Rivers - MakeValid'

CREATE TABLE u_fmp.main_rivers_10k_valid TABLESPACE fmp_tables AS WITH
	make_valid (status,length_km,wkb_geometry) AS
	(SELECT status,length_km,
		(ST_Dump(ST_MakeValid(wkb_geometry))).geom AS wkb_geometry FROM u_fmp.main_rivers_10k
	)
SELECT * FROM make_valid WHERE ST_GeometryType(wkb_geometry) IN('ST_LineString','ST_MultiLineString');

ALTER TABLE u_fmp.main_rivers_10k_valid ALTER COLUMN wkb_geometry TYPE geometry(MultiLineString,27700) USING ST_Multi(wkb_geometry);

ALTER TABLE u_fmp.main_rivers_10k_valid ADD COLUMN ogc_fid SERIAL;
UPDATE u_fmp.main_rivers_10k_valid SET ogc_fid = DEFAULT;
ALTER TABLE u_fmp.main_rivers_10k_valid ADD PRIMARY KEY(ogc_fid);
