
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
                    groups = 4)

map_buildings_discrete(remi,
                       color_scheme =c("#478BA2", "#DE5B6D", "#F2A490", "#B9D4DB")) 

c("#FF7B89", "#8A5082", "#6F5F90", "#758EB7", "#A5CAD2")
c("#257E78", "#40B8AF", "#6C2D58", "#B2577A", "#FFEEBB")
c("#525564", "#74828F", "#96C0CE", "#BEB9B5", "#C25B56", "#FEF6EB")

save_map(map_name = "remi-2")
