\echo 'England - MakeValid'

CREATE TABLE fmp.england_valid TABLESPACE fmp_tables AS WITH
	make_valid (region_id, reg_name, reg_prop_n, reg_addr_1, reg_addr_2, reg_town, reg_pcode, wkb_geometry) AS
	(SELECT region_id, reg_name, reg_prop_n, reg_addr_1, reg_addr_2, reg_town, reg_pcode,
		(ST_Dump(ST_MakeValid(wkb_geometry))).geom AS wkb_geometry FROM fmp.england
	)
SELECT * FROM make_valid WHERE ST_GeometryType(wkb_geometry) IN('ST_Polygon','ST_MultiPolygon');

ALTER TABLE fmp.england_valid ALTER COLUMN wkb_geometry TYPE geometry(MultiPolygon,27700) USING ST_Multi(wkb_geometry);

ALTER TABLE fmp.england_valid ADD COLUMN ogc_fid SERIAL;
UPDATE fmp.england_valid SET ogc_fid = DEFAULT;
ALTER TABLE fmp.england_valid ADD PRIMARY KEY(ogc_fid);
