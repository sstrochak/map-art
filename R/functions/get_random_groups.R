get_random_groups <- function(buildings_df,
                              var_name = group5,
                              groups = 5) {
  
  
 buildings_df %>% 
    mutate({{var_name}} := factor(sample(1:groups, nrow(.), replace = TRUE)))
  
}










