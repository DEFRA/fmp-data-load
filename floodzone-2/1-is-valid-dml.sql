SELECT ogc_fid, reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.floodzone_2 WHERE ST_IsValid(wkb_geometry) = false;

