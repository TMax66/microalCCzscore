library("shiny")
library("tidyverse")
library("readxl")
library("hrbrthemes")
library("googledrive")
library("googlesheets4")



########################

# #IL CODICE SEGUENTE SI FA SOLO LA PRIMA VOLTA CHE SI ACCEDE AL DRIVE DI GOOGLE
# options(gargle_oauth_cache = ".secrets")
# gargle::gargle_oauth_cache()
# drive_auth()
# list.files(".secrets/")

###il seguente codice va fatto girare sempre####________________________________
options(
  gargle_oauth_cache = ".secrets",
  gargle_oauth_email = TRUE
)
drive_auth()
gs4_auth(token = drive_token())
mydrive <- drive_find(type = "spreadsheet")
id <- filter(mydrive, mydrive$name == "cc-circuiti")

##______________________________________________________________________________




dati <-reactive ({read_sheet(id$id)})
