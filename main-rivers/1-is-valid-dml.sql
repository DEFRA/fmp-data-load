SELECT ogc_fid, reason(ST_IsValidDetail(wkb_geometry)) FROM u_fmp.main_rivers_10k WHERE ST_IsValid(wkb_geometry) = false;

