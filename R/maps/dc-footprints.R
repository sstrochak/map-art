
library(tidyverse)
library(sf)



dc<- st_read("data/footprints/DistrictofColumbia.geojson")


ss <- pick_a_buffer(long = -77.002408,
                    lat = 38.901092,
                    size = 1)

ss_buildings <- st_intersection(dc, ss)



lamont <- pick_a_buffer(long = -77.037458,
                        lat = 38.931036,
                        size = 1)

lamont_buildings <- st_intersection(dc, lamont)



urban <- pick_a_buffer(long = -77.046916,
                        lat = 38.904822,
                        size = 1)

urban_buildings <- st_intersection(dc, urban)


ggplot() +
  geom_sf(urban_buildings, mapping = aes())


