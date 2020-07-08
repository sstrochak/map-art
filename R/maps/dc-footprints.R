
library(tidyverse)
library(sf)

walk(list.files(here::here("R", "functions"), full.names = TRUE),
     ~ source(.x))

dc <- st_read("data/footprints/DistrictofColumbia.geojson")

ss <- dc %>% 
  crop_buildings(pick_a_buffer(long = -77.002408,
                               lat = 38.901092,
                               size = 1)) %>% 
  get_random_groups(var_name = group5, 
                    groups = 5)

map_buildings_discrete(ss)

save_map(map_name = "senate-square")


ellie <- dc %>% 
  crop_buildings(pick_a_buffer(long = -77.041516,
                               lat = 38.925133,
                               size = 1.5)) %>% 
  get_random_groups(var_name = group5, 
                    groups = 5)


map_buildings_discrete(ellie,
                       color_scheme = c("#99B898", "#FECEAB", "#FF847C", "#E84A5F", "#2A363B"))

save_map(map_name = "ellie-1")



map_buildings_discrete(ellie,
                       color_scheme = c("#21B6A8", "#177F75", "#B6212D", "#7F171F", "#B67721"))

save_map(map_name = "ellie-2")



hannah <- dc %>% 
  crop_buildings(pick_a_buffer(long = -77.034847,
                               lat = 38.931708,
                               size = 1.0)) %>% 
  get_random_groups(var_name = group5, 
                    groups = 5)



map_buildings_discrete(hannah,
                       color_scheme = c("#74A6BD", "#7195A3", "#D4E7ED", "#EB8540", "#B06A3B"))

save_map(map_name = "hannah-1")

map_buildings_discrete(hannah,
                       color_scheme = pal1)
save_map(map_name = "hannah-2")

pal1 <- c("#7D9C9F", "#BDD8DA", "#DFEFF0", "#AD235E", "#B1B1B1")



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


