
library(extrafont)
extrafont::loadfonts(device="win")

library(tidyverse)
library(sf)


walk(list.files(here::here("R", "functions"), full.names = TRUE),
     ~ source(.x))



chi <- st_read("https://data.cityofchicago.org/api/geospatial/hz9b-7nh8?method=export&format=GeoJSON")


rd <- chi %>% 
  crop_buildings(pick_a_buffer(long = -87.734557,
                               lat = 41.953758,
                               size = 1)) %>% 
  get_random_groups(var_name = group5, 
                    groups = 5)



opt1 <- c("#041736",	
          "#382a4f",
          "#743c52",	
          "#ba4a4a",
          "#ea5d39")


opt2 <- c("#a4cbca",
          "#e4aaa6",
          "#b54918",
          "#f1a000",
          "#2b2e39")


opt3 <- c("#2e4045",
          "#83adb5",
          "#c7bbc9",
          "#5e3c58",
          "#bfb5b2")

map_buildings_discrete(rd,
                       color_scheme = opt3)





star <- tribble(
  ~x, ~y, ~order, ~hole, ~piece, ~group, ~id,
  1, 0, 1, FALSE, 1, "11",  "11",
  0.3, -0.2, 2, FALSE, 1, "11",  "11",
  0.3, -0.95, 3, FALSE, 1, "11",  "11",
  -0.1, -0.375, 4, FALSE, 1, "11",  "11",
  -0.8, -0.6, 5,  FALSE, 1, "11",  "11",
  -0.39, 0, 6,  FALSE, 1, "11",  "11",
  -0.8, 0.6, 7,  FALSE, 1, "11",  "11",
  -0.1, 0.375, 8, FALSE, 1, "11",  "11",
  0.3, 0.95, 9, FALSE, 1, "11",  "11",
  0.3, 0.2, 10, FALSE, 1, "11",  "11",
  1, 0, 11, FALSE, 1, "11",  "11"
) %>%
  # roate star by mutliplying points by rotation matrix
  mutate(long = x * cos(pi / 2) + y * -sin(pi / 2),
         lat = x * sin(pi / 2) + y * cos(pi / 2)) %>%
  # scale the plots big time
  mutate(long = long,
         lat = lat) %>%
  # transpose the plot to near DC
  mutate(long = long - 87.683,
         lat = lat + 41.969) %>%
  select(-x, -y)



x <- star %>% 
  st_as_sf(coords = c("long", "lat"),
           crs = 4326) %>%
  st_coordinates() %>%
  st_linestring() %>% 
  st_polygonize() %>% 
  st_sfc(crs = 4326)

st_is_valid(x)

ggplot() +
  geom_sf(x, mapping = aes())



w_star <- chi %>% 
  st_intersection(x) %>% 
  get_random_groups(var_name = group5, 
                    groups = 5)

