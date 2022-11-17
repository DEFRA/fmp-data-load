SELECT reason(ST_IsValidDetail(wkb_geometry)) FROM fmp.reduction_in_rofrs WHERE ST_IsValid(wkb_geometry) = false;

