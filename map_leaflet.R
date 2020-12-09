library(zipcode)
data(zip_code)
zipcode_ma <-zipcode %>% 
  filter(state =="MA")

zipcode_ma

income<-read.csv("MA.csv")
income
third<-second<-merge.data.frame(income, zipcode_ma, by="city")
third
third<-third %>% 
  filter(Median.Household.Income >= 50000 & Median.Household.Income <= 70000) %>%
  
  
  
  third <-third[!duplicated(third$city),]
third
View(second)

write.csv(first, file = "A.csv")
b<-read.csv("A.csv")
b
v<-b %>% mutate(zip=recode(zip, "2143" = "02143",
                           "2144" = "02144", 
                           "2145" = "02145"))
v1<-v %>%
  dplyr::select(zip, need1, n)
v1
second<-merge.data.frame(v1, zipcode_ma, by="zip")
View(second)

seconda<-second %>%
  group_by(zip) %>%
  mutate(new=rank(need1))
seconda
library(leaflet)
library(widgetframe)
library(htmlwidgets)

leaflet(data = seconda) %>%
  ##setView(lng = -71.09908, lat = 42.38193, zoom = 40)%>%
  addTiles() %>%
  ##addRectangles(lng1=-71.09908, lat1=42.38193,
  lng2=-71.15555, lat2=42.10955,

fillColor = "transparent") %>%
  addMarkers(popup = new, label = ~need1) %>%
  frameWidget()


m<-leaflet(data = third) %>%
  addTiles() %>%
  addMarkers(label = ~city) 

%>%
  frameWidget()

library(htmlwidgets)
saveWidget(m,'m.html', selfcontained = FALSE)