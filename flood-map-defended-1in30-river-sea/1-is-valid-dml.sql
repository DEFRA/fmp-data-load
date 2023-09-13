SELECT ogc_fid, reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.flood_map_defended_1in30_river_sea_present_day WHERE ST_IsValid(wkb_geometry) = false;

