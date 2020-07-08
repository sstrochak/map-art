
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
  st_buffer(dist = units::set_units(1, "mi")) %>% 
  st_transform(crs = st_crs(chi))


ls_points <- st_intersection(chi, ls) %>% 
  mutate(group5 = sample(1:5, nrow(.), replace = TRUE)) %>% 
  mutate(grad = scales::rescale(as.numeric(x_coord), to = c(0, 1))) %>% 
  mutate(grady = scales::rescale(as.numeric(y_coord), to = c(0, 1)))


nhoods5 <- c("#DC8665", "#138086", "#534666", "#CD7672", "#EEB462")

ggplot() +
  geom_sf(data = ls_points, mapping = aes(fill = factor(group5)),
          color = NA) +
  scale_fill_manual(values = nhoods5) +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)
ggsave("maps/lincoln-square-buldings.png",
       height = 9, width = 9, dpi = 500)
ggsave("maps/lincoln-square-buldings.jpg",
       height = 9, width = 9, dpi = 500)

pal1 <- c("#d2fbd4","#a5dbc2","#7bbcb0","#559c9e","#3a7c89","#235d72","#123f5a")
pal2 <- c("#008080","#70a494","#b4c8a8","#f6edbd","#edbb8a","#de8a5a","#ca562c")

ggplot() +
  geom_sf(data = ls_points, mapping = aes(fill = grad),
          color = NA) +
  scale_fill_gradientn(colors = pal2) +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)
ggsave("maps/lincoln-square-x.png", height = 9, width = 9)

ggplot() +
  geom_sf(data = ls_points, mapping = aes(fill = grady),
          color = NA) +
  scale_fill_gradientn(colors = pal2) +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)
ggsave("maps/lincoln-square-y.png", height = 9, width = 9)



iu <- st_read("data/Bloomington/bloomington-master-addresses.GeoJSON") %>% 
  st_transform(st_crs(chi))


iu_rad <- tibble(long = -86.519708, 
             lat = 39.166815) %>% 
  st_as_sf(coords = c("long", "lat"),
           crs = st_crs(chi)) %>% 
  st_transform(2173) %>% 
  st_buffer(dist = units::set_units(2, "mi")) %>% 
  st_transform(crs = st_crs(chi)) %>% 
  st_intersection(iu)


ggplot() +
  geom_sf(iu_rad, mapping = aes(color = xcoord)) +
  scale_color_gradientn(colors = pal1) +
  urbnthemes::theme_urbn_map() +
  guides(color = FALSE)
ggsave("maps/bloomington-points-2mi.png",
       height = 9, width = 9, dpi = 500)
