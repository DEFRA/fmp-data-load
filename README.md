# Flood Map for Planning. Spatial database load scripts

The Flood Map for Planning service asseses the flood risk of a proposed development.

This repository contains Unix scripts to load the spatial data (shapefiles) into the Flood Map for Planning Postgresql database.

This service is not currently released but is intended to replace the existing method soon. The key difference is that it will have been developed in accordance with the [Digital by Default service standard](https://www.gov.uk/service-manual/digital-by-default), putting user needs first and delivered iteratively.

## Development Environment

### Local Installation

#### Local system dependencies

* [Gdal 2.1.1](http://www.gdal.org/)
* [Postgresql](http://www.postgresql.org/download)
* [Postgis extension](http://postgis.net)

#### Data

All spatial data for this project is available from the data.gov.uk website.

* [data.gov.uk Environment Agency](https://data.gov.uk/publisher/environment-agency)

Download the data as Shapefiles and store in a data directory.

#### Please note that the application requires the "WIYBY" versions of floodzone 2 and 3, which have been tiled into 5km square tiles.

#### Environment variables

The following environment variables must be set before the scripts are run. An example file is contained in the etc directory.

##### FMP database host
FMP_DB_HOST

##### FMP database port
FMP_DB_PORT

##### FMP database instance
FMP_DB_NAME

##### FMP database schema
FMP_DB_SCHEMA

##### FMP database user
FMP_DB_USER

##### FMP database password
FMP_DB_PASSWORD

##### FMP source data directory
FMP_GDB_ROOT

##### FMP source data file name suffix (used for switching between national and non-national subsets).
FMP_GDB_POSTFIX

##### FMP spatial index name
FMP_GENERATE_SPATIAL_INDEX

##### FMP load Scripts root directory
FMP_SCRIPTS_ROOT

#### Running the scripts

Open the folder for the dataset that you want to load.

Edit the ogr2ogr command to reflect the exact file name of the shapefile.

##### Execute the load

./load-data.sh

## Contributing to this project

If you have an idea you'd like to contribute please log an issue.

All contributions should be submitted via a pull request.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3

The following attribution statement MUST be cited in your products and applications when using this information.

> Contains public sector information licensed under the Open Government license v3

### About the license

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable information providers in the public sector to license the use and re-use of their information under a common open licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.
