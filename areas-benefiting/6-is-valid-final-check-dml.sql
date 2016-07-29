SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM u_fmp.areas_benefiting WHERE ST_IsValid(wkb_geometry) = false;

