library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    titlePanel("World Capital Cities"),

    sidebarLayout(
        sidebarPanel(
            print("You've Selected:"),
            verbatimTextOutput("clicktext")
        ),
       
        mainPanel(
            print(h3("Select a Marker to see details")),
            leafletOutput("rPlot")
        )
    )
))
