SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.flood_map_with_depth_undefended_river_1in100_present_day WHERE ST_IsValid(wkb_geometry) = false;

