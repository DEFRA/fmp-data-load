SELECT ogc_fid, reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.england WHERE ST_IsValid(wkb_geometry) = false;

