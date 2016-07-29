SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM u_fmp.floodzone_3 WHERE ST_IsValid(wkb_geometry) = false;

