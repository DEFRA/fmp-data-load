\echo 'flood_map_with_depth_drained_surface_water_1in30_present_day - MakeValid'

CREATE TABLE fmp.flood_map_with_depth_drained_surface_water_1in30_valid TABLESPACE fmp_tables AS WITH
	make_valid (depth_band,wkb_geometry) AS
	(SELECT depth_band,
		(ST_Dump(ST_MakeValid(wkb_geometry))).geom AS wkb_geometry FROM fmp.flood_map_with_depth_drained_surface_water_1in30_present_day
	)
SELECT * FROM make_valid WHERE ST_GeometryType(wkb_geometry) IN('ST_Polygon','ST_MultiPolygon');

ALTER TABLE fmp.flood_map_with_depth_drained_surface_water_1in30_valid ALTER COLUMN wkb_geometry TYPE geometry(MultiPolygon,27700) USING ST_Multi(wkb_geometry);

ALTER TABLE fmp.flood_map_with_depth_drained_surface_water_1in30_valid ADD COLUMN ogc_fid SERIAL;
UPDATE fmp.flood_map_with_depth_drained_surface_water_1in30_valid SET ogc_fid = DEFAULT;
ALTER TABLE fmp.flood_map_with_depth_drained_surface_water_1in30_valid ADD PRIMARY KEY(ogc_fid);
