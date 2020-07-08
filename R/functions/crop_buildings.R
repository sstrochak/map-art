crop_buildings <- function(buildings_df,
                           buffer_df) {
  
  st_intersection(buildings_df, buffer_df)
  
}
                        




