SELECT ogc_fid, reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.sw_extent_1in100 WHERE ST_IsValid(wkb_geometry) = false;

