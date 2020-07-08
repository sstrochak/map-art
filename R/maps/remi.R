
library(tidyverse)
library(sf)

walk(list.files(here::here("R", "functions"), full.names = TRUE),
     ~ source(.x))

sf <- st_read("data/footprints/ca_06075_footprints/ca_06075_footprints.csv") %>% 
  st_set_crs(4326)



remi <- sf %>% 
  crop_buildings(pick_a_buffer(long = -122.415633,
                               lat = 37.802322,
                               size = 1)) %>% 
  get_random_groups(var_name = group5, 
                    groups = 5)

map_buildings_discrete(remi,
                       color_scheme = c("#525564", "#74828F", "#96C0CE", "#BEB9B5", "#C25B56", "#FEF6EB"))

save_map(map_name = "remi")
