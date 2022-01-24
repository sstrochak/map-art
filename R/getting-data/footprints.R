
library(tidyverse)
library(here)

download_data(file_name = "dc-footprints.zip",
              my_city = "footprints",
              my_url = "https://usbuildingdata.blob.core.windows.net/usbuildings-v1-1/DistrictofColumbia.zip")


unzip("data/footprints/dc-footprints.zip",
      exdir = "data/footprints")


download_data(file_name = "ca-footprints.zip",
              my_city = "footprints",
              my_url = "https://usbuildingdata.blob.core.windows.net/usbuildings-v1-1/California.zip")


unzip("data/footprints/ca-footprints.zip",
      exdir = "data/footprints")
