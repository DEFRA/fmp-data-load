SELECT ogc_fid, reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.areas_benefiting WHERE ST_IsValid(wkb_geometry) = false;

