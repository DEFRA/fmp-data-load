\echo 'Flood Zone 2 - MakeValid'

CREATE TABLE fmp.floodzone_2_valid TABLESPACE fmp_tables AS WITH
	make_valid (fid_nat_fl,layer,type,fid_os_5km,name,shape_leng,shape_area,wkb_geometry) AS
	(SELECT fid_nat_fl,layer,type,fid_os_5km,name,shape_leng,shape_area,
		(ST_Dump(ST_MakeValid(wkb_geometry))).geom AS wkb_geometry FROM fmp.floodzone_2
	)
SELECT * FROM make_valid WHERE ST_GeometryType(wkb_geometry) IN('ST_Polygon','ST_MultiPolygon');

ALTER TABLE fmp.floodzone_2_valid ALTER COLUMN wkb_geometry TYPE geometry(MultiPolygon,27700) USING ST_Multi(wkb_geometry);

ALTER TABLE fmp.floodzone_2_valid ADD COLUMN ogc_fid SERIAL;
UPDATE fmp.floodzone_2_valid SET ogc_fid = DEFAULT;
ALTER TABLE fmp.floodzone_2_valid ADD PRIMARY KEY(ogc_fid);
