library(extrafont)
extrafont::loadfonts(device="win")

library(tidyverse)
library(sf)



walk(list.files(here::here("R", "functions"), full.names = TRUE),
     ~ source(.x))

chi <- st_read("data/Chicago/chicago-building-footprints.geojson")


walsh <- chi %>% 
  crop_buildings(pick_a_buffer(long = -87.688014,
                               lat = 41.967945,
                               size = 1)) %>% 
  get_random_groups(var_name = group5, 
                    groups = 6)


lab <- walsh %>% 
  select(geometry) %>% 
  st_centroid() %>% 
  st_coordinates() %>% 
  as_tibble() %>% 
  summarize(x = mean(X),
            y = min(Y) - 0.002)

point <- lab %>% 
  st_as_sf(coords = c("x", "y"),
           crs = 4326) %>% 
  mutate(label = "KEW")

map_buildings_discrete(walsh,
                       color_scheme = c("#218C8D", "#6CCECB", "#F9E559", "#EF7126", "#EF7126",  "#8EDC9D")) +
  geom_sf_text(data = point, mapping = aes(label = label),
               size = 7, family = "Courier New", fontface = "bold",
               color = "#218C8D")

save_map(map_name = "kayla",
         map_height = 7, map_width = 5)






walsh <- chi %>% 
  crop_buildings(pick_a_buffer(long = -87.688014,
                               lat = 41.967945,
                               size = 1)) %>% 
  get_random_groups(var_name = group5, 
                    groups = 5)

point <- lab %>% 
  st_as_sf(coords = c("x", "y"),
           crs = 4326) %>% 
  mutate(label = "MRW")

map_buildings_discrete(walsh,
                       color_scheme = c("#7FACD6", "#BFB8DA", "#E8B7DA", "#A5678E", "#33539E")) +
  geom_sf_text(data = point, mapping = aes(label = label),
               size = 7, family = "Courier New", fontface = "bold",
               color = "#A5678E")

save_map(map_name = "maddie",
         map_height = 7, map_width = 5)


