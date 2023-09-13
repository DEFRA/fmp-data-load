SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.flood_zone_river_sea_present_day WHERE ST_IsValid(wkb_geometry) = false;

