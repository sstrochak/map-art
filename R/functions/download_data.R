download_data <- function(file_name,
                          my_city,
                          my_url) {
  
  if (!dir.exists(here("data", my_city))) {
    
    dir.create(here("data", my_city))
    
  }
  
  
  my_file_name <- here("data", my_city, file_name)
  
  
  if (!file.exists(my_file_name)) {
    
    download.file(my_url,
                  destfile = my_file_name)
    
  } else if (file.exists(my_file_name)) {
    
    warning("File already downloaded.")
    
  }
  
}



