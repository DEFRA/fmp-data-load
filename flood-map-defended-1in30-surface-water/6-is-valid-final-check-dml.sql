SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.flood_map_defended_1in30_surface_water_present_day WHERE ST_IsValid(wkb_geometry) = false;

