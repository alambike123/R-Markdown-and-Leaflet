library(leaflet)
library(dplyr)
library(htmltools)

brazil.cities <- subset(read.csv("worldcities.csv"), country == "Brazil")

map <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng = brazil.cities$lng,
             lat = brazil.cities$lat,
             popup =paste(brazil.cities$city, "<br>Population: ",
                          formatC(brazil.cities$population, format = "d", big.mark = ",")
             )
  ) %>% 
  addCircles(lng    = brazil.cities$lng, 
             lat    = brazil.cities$lat, 
             weight = 1,
             radius = sqrt(brazil.cities$population) * 20)
map
