library(shiny)
ui <- fluidPage(
  selectInput(inputId = "region", label = "Choose a region",
              c("Select..." = "",
                "Latin America/Caribbean" = "la",
                "North America" = "n",
                "Western Europe" = "w"))
  radioButtons(inputId = "reg", label = "Choose your region(s)",
               c("World" = "all",
                 "Latin America/Caribbean" = "lac",
                 "North America" = "na",
                 "Western Europe" = "we"))

)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)




