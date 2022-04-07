############################
# TBN OpenAPI version 2.5 #
# author: Vincent yu       #
# update: 2022-04-07       #
############################

# API documents: https://www.tbn.org.tw/data/api/openapi/v2
# A way to download TBN Open API in r

library(tidyverse)
library(jsonlite)
library(progress)

TBN_OpenAPI <- function(...,version="v25",type="occurrence",limit=300,message=TRUE){
  occ_api <-jsonlite::fromJSON(paste0("https://www.tbn.org.tw/api/v25/",type,"?",...,"&limit=",limit))
  page <- list()
  page[[1]] <- occ_api %>% .$data
  if (occ_api %>% .$meta %>% .$status == "NOT FOUND"){
    message("type= ", type, ", version= ", version, " ","No data downloaded")
  } else if(occ_api %>% .$meta %>% .$status == "SUCCESS"){
    pg <- (occ_api %>% .$meta %>% .$total/3000) %>% ceiling()
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
    else {
      message("type= ", type, ", version= ", version, " ",occ_api %>% .$meta %>% .$total," data downloaded")
      return(occ_api %>% .$data)
    }
  }
}
