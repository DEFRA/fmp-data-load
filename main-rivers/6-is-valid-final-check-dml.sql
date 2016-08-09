SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.main_rivers_10k WHERE ST_IsValid(wkb_geometry) = false;

