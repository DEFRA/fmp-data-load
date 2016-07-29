SELECT ogc_fid, reason(ST_IsValidDetail(wkb_geometry)) FROM u_fmp.defences WHERE ST_IsValid(wkb_geometry) = false;

