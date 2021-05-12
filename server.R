library(shiny)
library(dplyr)
library(leaflet)
library(sf)

capital<-read.csv("C:\\Users\\Anu\\Documents\\R\\Shiny\\my_leaflet\\world_capital\\capital.csv")
capital<-capital[complete.cases(capital),]
colnames(capital)[1]<-"CountryName"

capital<-capital %>% mutate(info=paste("Continent:",ContinentName,"Country:",CountryName,"Capital:",CapitalName,sep="\n"))

shinyServer(function(input, output) {
    
    output$rPlot <- renderLeaflet({
          
     capital %>% leaflet() %>% addTiles() %>% 
            addCircleMarkers(lat=~Latitude,lng = ~Longitude,popup = ~CapitalName,layerId = ~info)
            
               
    })
    
    observeEvent(input$rPlot_marker_click,{ 
        clickinfo <- input$rPlot_marker_click
        output$clicktext<-renderText({clickinfo$id})
    })
    
})

shinyApp(ui=ui, server=server)
