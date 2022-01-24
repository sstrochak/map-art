
library(tigris)
library(tidyverse)
library(sf)


pick_a_buffer <- function(long,
                          lat,
                          size_miles,
                          end_crs = 4326) {
  
  tibble(long = long, 
         lat = lat) %>% 
    st_as_sf(coords = c("long", "lat"),
             crs = end_crs) %>% 
    st_transform(2173) %>% 
    st_buffer(dist = units::set_units(size_miles, "mi")) %>% 
    st_transform(crs = end_crs)
  
}


b <- pick_a_buffer(long = -122.269595, 
                   lat = 37.871294,
                   size_miles = 5,
                   end_crs = st_crs(streets))


ca <- states() %>% 
  filter(NAME == "California")

b_ca <- st_intersection(ca, b)

streets <- tigris::roads(state = "06", county = "001")



b_streets <- st_intersection(
  streets, b
)

ggplot() +
  geom_sf(data = b_ca, mapping = aes(),
          fill = "#1b2d56", color = "#1b2d56") +
  geom_sf(data = b_streets, mapping = aes(),
          color = "white") +
  urbnthemes::theme_urbn_map()

ggsave("C:/map-art/maps/room/berkeley.png",
       height = 12, width = 12)

423

b2 <- pick_a_buffer(long = -77.102423, 
                   lat = 39.012258,
                   size_miles = 4,
                   end_crs = st_crs(streets))


md <- states() %>% 
  filter(NAME == "Maryland")

b_md <- st_intersection(md, b2)

streets <- tigris::roads(state = "24", county = "031")



b_streets <- st_intersection(
  streets, b2
)

ggplot() +
  geom_sf(data = b_md, mapping = aes(),
          fill = "#e5b186", color = "#e5b186") +
  geom_sf(data = b_streets, mapping = aes(),
          color = "white") +
  urbnthemes::theme_urbn_map()

ggsave("C:/map-art/maps/room/bethesda.png",
       height = 12, width = 12)






dc <- pick_a_buffer(long = -77.022377, 
                    lat = 38.930030,
                    size_miles = 3,
                    end_crs = st_crs(streets))


dc1 <- states() %>% 
  filter(NAME == "District of Columbia")

dc_border <- st_intersection(dc, dc1)

streets <- tigris::roads(state = "11", county = "001")



dc_streets <- st_intersection(
  streets, dc_border
)

ggplot() +
  geom_sf(data = dc_border, mapping = aes(),
          fill = "#266a85", color = "#266a85") +
  geom_sf(data = dc_streets, mapping = aes(),
          color = "white") +
  urbnthemes::theme_urbn_map()

ggsave("C:/map-art/maps/room/dc.png",
       height = 12, width = 12)



chi <- pick_a_buffer(long = -87.682911, 
                    lat = 41.969653,
                    size_miles = 2.6,
                    end_crs = st_crs(streets))


il <- states() %>% 
  filter(NAME %in% c("Illinois"))

chi_border <- st_intersection(il, chi)

streets <- tigris::roads(state = "17", county = "031")



chi_streets <- st_intersection(
  streets, chi_border
)

ggplot() +
  geom_sf(data = chi_border, mapping = aes(),
          fill = "#dfa9a9", color = "#dfa9a9") +
  geom_sf(data = chi_streets, mapping = aes(),
          color = "white") +
  urbnthemes::theme_urbn_map()

ggsave("C:/map-art/maps/room/chi.png",
       height = 12, width = 12)



iu <- pick_a_buffer(long = -86.516263, 
                     lat = 39.170833, 
                     size_miles = 2.6,
                     end_crs = st_crs(streets))


ind <- states() %>% 
  filter(NAME %in% c("Indiana"))

iu_border <- st_intersection(ind, iu)

streets <- tigris::roads(state = "18", county = "105")



iu_streets <- st_intersection(
  streets, iu_border
)

ggplot() +
  geom_sf(data = iu_border, mapping = aes(),
          fill = "#266a85", color = "#266a85") +
  geom_sf(data = iu_streets, mapping = aes(),
          color = "white") +
  urbnthemes::theme_urbn_map()

ggsave("C:/map-art/maps/room/iu.png",
       height = 12, width = 12)
