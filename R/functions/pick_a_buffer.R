
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
