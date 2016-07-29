SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM u_fmp.flood_storage_areas WHERE ST_IsValid(wkb_geometry) = false;

