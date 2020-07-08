save_map <- function(map_name,
                     map_dir = here::here("maps", "footprints"),
                     map_width = 8,
                     map_height = 10,
                     dpi = 500,
                     extension = "jpg") {
  
  ggsave(str_glue("{map_dir}/{map_name}.{extension}"),
         width = map_width,
         height = map_height,
         dpi = dpi)
  
  
  
}