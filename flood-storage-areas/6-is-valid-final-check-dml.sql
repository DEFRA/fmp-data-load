SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.flood_storage_areas WHERE ST_IsValid(wkb_geometry) = false;

