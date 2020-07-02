
library(tidyverse)
library(sf)


chi <- st_read("data/chicago/chicago-building-footprints.geojson")

hoods <- st_read("data/Chicago/chicago-neighborhoods.GeoJSON")

ill <- urbnmapr::get_urbn_map(map = "states", sf = TRUE) %>% 
  filter(state_name == "Illinois") %>% 
  st_transform(st_crs(hoods)) %>% 
  st_crop(st_bbox(hoods) * c(1.0004, .999, 1, 1.0008))

box <- st_make_grid(ill, n = 1) %>% 
  st_as_sf()

nhoods <- c("#305f80", "#c4b20c", "#ab557c", "#4f692f")
nhoods5 <- c("#DC8665", "#138086", "#534666", "#CD7672", "#EEB462")



set.seed(19960328)
hoods <- hoods %>% 
  mutate(group4 = sample(1:4, nrow(.), replace = TRUE),
         group5 = sample(1:5, nrow(.), replace = TRUE))

ggplot() +
  geom_sf(data = box, mapping = aes(),
          color = NA,
          fill = "#8ccad1") +
  geom_sf(data = ill, mapping = aes(),
          color = NA) +
  geom_sf(data = hoods, mapping = aes(fill = factor(group5)),
          color = "white", size = 0.4)+
  scale_fill_manual(values = nhoods5) +
  #bgeom_sf() +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)

ggsave("maps/chicago-neighborhoods-1.png",
       width = 8.5, height = 11, dpi = 400)


set.seed(19950710)
hoods <- hoods %>% 
  mutate(group4 = sample(1:4, nrow(.), replace = TRUE),
         group5 = sample(1:5, nrow(.), replace = TRUE))

ggplot() +
  geom_sf(data = box, mapping = aes(),
          color = NA,
          fill = "#8ccad1") +
  geom_sf(data = ill, mapping = aes(),
          color = NA) +
  geom_sf(data = hoods, mapping = aes(fill = factor(group5)),
          color = "white", size = 0.4)+
  scale_fill_manual(values = nhoods5) +
  #bgeom_sf() +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)

ggsave("maps/chicago-neighborhoods-2.png",
       width = 8.5, height = 11, dpi = 400)



set.seed(19960328)
hoods <- hoods %>% 
  mutate(group4 = sample(1:4, nrow(.), replace = TRUE),
         group5 = sample(1:5, nrow(.), replace = TRUE))

ggplot() +
  geom_sf(data = box, mapping = aes(),
          color = NA,
          fill = "#8ccad1") +
  geom_sf(data = ill, mapping = aes(),
          color = NA) +
  geom_sf(data = hoods, mapping = aes(fill = factor(group5)),
          color = "white", size = 0.4)+
  scale_fill_manual(values = nhoods5) +
  #bgeom_sf() +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)

ggsave("maps/chicago-neighborhoods-1.png",
       width = 8.5, height = 11, dpi = 400)


set.seed(20200702)
hoods <- hoods %>% 
  mutate(group4 = sample(1:4, nrow(.), replace = TRUE),
         group5 = sample(1:5, nrow(.), replace = TRUE))

ggplot() +
  geom_sf(data = box, mapping = aes(),
          color = NA,
          fill = "#8ccad1") +
  geom_sf(data = ill, mapping = aes(),
          color = NA) +
  geom_sf(data = hoods, mapping = aes(fill = factor(group5)),
          color = "white", size = 0.4)+
  scale_fill_manual(values = nhoods5) +
  #bgeom_sf() +
  urbnthemes::theme_urbn_map() +
  guides(fill = FALSE)

ggsave("maps/chicago-neighborhoods-3.png",
       width = 8.5, height = 11, dpi = 400)
