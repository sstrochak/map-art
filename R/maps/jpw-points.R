
library(tidyverse)
library(sf)

chi <- st_read("data/Chicago/chicago-building-footprints.geojson")

chi_points <- chi %>% 
  st_centroid()

ls <- tibble(long = -87.688014, 
             lat = 41.967945) %>% 
  st_as_sf(coords = c("long", "lat"),
           crs = st_crs(chi)) %>% 
  st_transform(2173) %>% 
  st_buffer(dist = units::set_units(0.5, "mi")) %>% 
  st_transform(crs = st_crs(chi))


ls_points <- st_intersection(chi, ls) %>% 
  mutate(group5 = sample(1:5, nrow(.), replace = TRUE)) %>% 
  mutate(grad = scales::rescale(as.numeric(x_coord), to = c(0, 1)))


ggplot() +
  geom_sf(data = ls_points, mapping = aes(fill = factor(group5)),
          color = NA) +
  scale_fill_manual(values = nhoods5) +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)


ggplot() +
  geom_sf(data = ls_points, mapping = aes(fill = grad),
          color = NA) +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)
