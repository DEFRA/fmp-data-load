-- Create tablespaces
CREATE TABLESPACE fmp_tables OWNER fmp LOCATION '/fmp_tables';
CREATE TABLESPACE fmp_indexes OWNER fmp LOCATION '/fmp_indexes';

-- Create fmp schema
CREATE SCHEMA fmp AUTHORIZATION fmp;
