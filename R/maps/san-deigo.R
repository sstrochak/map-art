

ca <- st_read("data/footprints/California.geojson")

sd <- st_read("data/footprints/ca_06073_footprints/ca_06073_footprints.csv") 

sd <- sd %>% 
  st_set_crs(4326) %>% 
  mutate(group = sample(1:5, nrow(.), replace = TRUE))

liz <- pick_a_buffer(long = -117.140494,
                     lat = 33.020441,
                     size_miles = 1.5)


liz_buildings <- st_intersection(sd,
                                 liz)

liz_colors <- c("#0B0742", "#120C6E", "#5E72EB", "#FF9190", "#FDC094")

ggplot() +
  geom_sf(liz_buildings, mapping = aes(fill = factor(group)),
          color = NA) +
  scale_fill_manual(values = liz_colors) +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)



al <- st_read("data/footprints/ca_06001_footprints/ca_06001_footprints.csv") 

al <- al %>% 
  st_set_crs(4326) %>% 
  mutate(group = sample(1:5, nrow(.), replace = TRUE))

ellie <- pick_a_buffer(long = -122.268759,
                     lat = 37.886438,
                     size_miles = 1.5)


ellie_buildings <- st_intersection(al,
                                 ellie)

ellie_colors <- c("#85CBCC", "#A8DEE0", "#F9E2AE", "#FBC78D", "#A7D676")

ggplot() +
  geom_sf(ellie_buildings, mapping = aes(fill = factor(group)),
          color = NA) +
  scale_fill_manual(values = ellie_colors) +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)

