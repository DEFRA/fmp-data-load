-- CREATE postgis schema
CREATE SCHEMA postgis AUTHORIZATION fmp;
GRANT ALL ON SCHEMA postgis TO fmp;

-- Create fmp schema
CREATE SCHEMA fmp AUTHORIZATION fmp;

ALTER DATABASE fmp-development SET search_path = "$user", public, postgis, topology;
ALTER EXTENSION postgis set schema postgis;
