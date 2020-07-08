map_buildings_discrete <- function(buildings_df,
                                   var_name = group5,
                                   outline_color = NA,
                                   color_scheme = c("#DC8665", "#138086", "#534666", "#CD7672", "#EEB462")) {
  
 ggplot(buildings_df) +
    geom_sf(mapping = aes(fill = {{var_name}}),
            color = outline_color) +
    scale_fill_manual(values = color_scheme) +
    urbnthemes::theme_urbn_map() +
    guides(fill = FALSE)
  
  
}
