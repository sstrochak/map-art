
library(tidyverse)
library(here)


# DC ----------------------------------------------------------------------

download_data(file_name = "dc-master-addresses.GeoJSON",
              my_city = "DC",
              my_url = "https://opendata.arcgis.com/datasets/aa514416aaf74fdc94748f1e56e7cc8a_0.geojson")



# Bloomington -------------------------------------------------------------

download_data(file_name = "bloomington-master-addresses.GeoJSON",
              my_city = "Bloomington",
              my_url = "https://bloomington.in.gov/geoserver/publicgis/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=publicgis:AddressPointsBloomington&outputFormat=application%2Fjson")



# Chicago -----------------------------------------------------------------

download_data(file_name = "chicago-building-footprints.geojson",
              my_city = "Chicago",
              my_url = "https://data.cityofchicago.org/api/geospatial/hz9b-7nh8?method=export&format=GeoJSON")


download_data(file_name = "chicago-neighborhoods.GeoJSON",
              my_city = "Chicago",
              my_url = "https://data.cityofchicago.org/api/geospatial/bbvz-uum9?method=export&format=GeoJSON")




