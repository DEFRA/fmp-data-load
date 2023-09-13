SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.flood_map_with_depth_drained_surface_water_1in30_present_day WHERE ST_IsValid(wkb_geometry) = false;

