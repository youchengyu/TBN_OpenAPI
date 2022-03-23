############################
# TBN OpenAPI version 2.01 #
# author: Vincent yu       #
# update: 2022-03-01       #
############################

# API documents: https://www.tbn.org.tw/data/api/openapi/v2
# A way to download TBN Open API in r

library(tidyverse)
library(jsonlite)
library(progress)

TBN_OpenAPI <- function(...,version="v2",type="occurrence",message=TRUE){
  occ_api <-jsonlite::fromJSON(paste0("https://www.tbn.org.tw/api/",version,"/",type,"?",...))
  page <- list()
  page[[1]] <- occ_api %>% .$data
  pg <- (occ_api %>% .$meta %>% .$total/300) %>% ceiling()
  pb <- progress_bar$new(total = pg-1)
  if(pg>1){
    for ( i in 2:pg) { #download and combine data
      occ_api <- occ_api %>% .$links %>% .$`next` %>% jsonlite::fromJSON()
      pb$tick()
      page[[i]] <- occ_api %>% .$data
    }
    result <- jsonlite::rbind_pages(page) 
    message("type= ", type, ", version= ", version, " ",dim(result)[1],"data downloaded")
    return(result)
  }
  else{
    message("type= ", type, ", version= ", version, " ",occ_api %>% .$meta %>% .$total," data downloaded")
    return(occ_api %>% .$data)
  }
}