\echo 'Reduction in RoFRS- MakeValid'

CREATE TABLE fmp.reduction_in_rofrs_valid TABLESPACE fmp_tables AS WITH
	make_valid (def_prob, suitability, def_date, undef_prob, undef_date, reduction, wkb_geometry) AS
	(SELECT def_prob, suitability, def_date, undef_prob, undef_date, reduction,
		(ST_Dump(ST_MakeValid(wkb_geometry))).geom AS wkb_geometry FROM fmp.reduction_in_rofrs
	)
SELECT * FROM make_valid WHERE ST_GeometryType(wkb_geometry) IN('ST_Polygon','ST_MultiPolygon');

ALTER TABLE fmp.reduction_in_rofrs_valid ALTER COLUMN wkb_geometry TYPE geometry(MultiPolygon,27700) USING ST_Multi(wkb_geometry);

ALTER TABLE fmp.reduction_in_rofrs_valid ADD COLUMN ogc_fid SERIAL;
UPDATE fmp.reduction_in_rofrs_valid SET ogc_fid = DEFAULT;
ALTER TABLE fmp.reduction_in_rofrs_valid ADD PRIMARY KEY(ogc_fid);
