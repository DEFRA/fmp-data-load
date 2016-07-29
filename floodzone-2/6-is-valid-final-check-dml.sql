SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM u_fmp.floodzone_2 WHERE ST_IsValid(wkb_geometry) = false;

