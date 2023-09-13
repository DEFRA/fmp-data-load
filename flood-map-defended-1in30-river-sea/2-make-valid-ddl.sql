\echo 'flood map defended 1 in 30 river sea present day - MakeValid'

CREATE TABLE fmp.flood_map_defended_1in30_river_sea_present_day_valid TABLESPACE fmp_tables AS WITH
	make_valid (origin,flood_zone,flood_source_and_state,wkb_geometry) AS
	(SELECT origin,flood_zone,flood_source_and_state,
		(ST_Dump(ST_MakeValid(wkb_geometry))).geom AS wkb_geometry FROM fmp.flood_map_defended_1in30_river_sea_present_day
	)
SELECT * FROM make_valid WHERE ST_GeometryType(wkb_geometry) IN('ST_Polygon','ST_MultiPolygon');

ALTER TABLE fmp.flood_map_defended_1in30_river_sea_present_day_valid ALTER COLUMN wkb_geometry TYPE geometry(MultiPolygon,27700) USING ST_Multi(wkb_geometry);

ALTER TABLE fmp.flood_map_defended_1in30_river_sea_present_day_valid ADD COLUMN ogc_fid SERIAL;
UPDATE fmp.flood_map_defended_1in30_river_sea_present_day_valid SET ogc_fid = DEFAULT;
ALTER TABLE fmp.flood_map_defended_1in30_river_sea_present_day_valid ADD PRIMARY KEY(ogc_fid);
