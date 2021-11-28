library(shiny)
ui <- navbarPage("Pursuit of Happiness",
                 #format to add content to pages is tabPanel(title, content)
                 tabPanel("What is Happiness?",fluidPage(
                   selectInput(inputId = "region", label = "Choose a region",
                               c("Select..." = "",
                                 "Latin America/Caribbean" = "la",
                                 "North America" = "n",
                                 "Western Europe" = "w")),
                   radioButtons(inputId = "reg", label = "Choose your region(s)",
                                c("World" = "all",
                                  "Latin America/Caribbean" = "lac",
                                  "North America" = "na",
                                  "Western Europe" = "we"))
                   
                 )),
                 tabPanel("Exploring the Data",fluidPage(
                   selectInput(inputId = "region", label = "Choose a region",
                               c("Select..." = "",
                                 "Latin America/Caribbean" = "la",
                                 "North America" = "n",
                                 "Western Europe" = "w")),
                   radioButtons(inputId = "reg", label = "Choose your region(s)",
                                c("World" = "all",
                                  "Latin America/Caribbean" = "lac",
                                  "North America" = "na",
                                  "Western Europe" = "we"))
                   
                 )),
                 tabPanel("A Paradox",fluidPage(
                   selectInput(inputId = "region", label = "Choose a region",
                               c("Select..." = "",
                                 "Latin America/Caribbean" = "la",
                                 "North America" = "n",
                                 "Western Europe" = "w")),
                   radioButtons(inputId = "reg", label = "Choose your region(s)",
                                c("World" = "all",
                                  "Latin America/Caribbean" = "lac",
                                  "North America" = "na",
                                  "Western Europe" = "we"))
                   
                 )),
                 tabPanel("What is Happiness (seriously)?",fluidPage(
                   selectInput(inputId = "region", label = "Choose a region",
                               c("Select..." = "",
                                 "Latin America/Caribbean" = "la",
                                 "North America" = "n",
                                 "Western Europe" = "w")),
                   radioButtons(inputId = "reg", label = "Choose your region(s)",
                                c("World" = "all",
                                  "Latin America/Caribbean" = "lac",
                                  "North America" = "na",
                                  "Western Europe" = "we"))
                   
                 )),
                 tabPanel("References",fluidPage(
                   selectInput(inputId = "region", label = "Choose a region",
                               c("Select..." = "",
                                 "Latin America/Caribbean" = "la",
                                 "North America" = "n",
                                 "Western Europe" = "w")),
                   radioButtons(inputId = "reg", label = "Choose your region(s)",
                                c("World" = "all",
                                  "Latin America/Caribbean" = "lac",
                                  "North America" = "na",
                                  "Western Europe" = "we"))
                   
                 )))
# fluidPage(
#   selectInput(inputId = "region", label = "Choose a region",
#               c("Select..." = "",
#                 "Latin America/Caribbean" = "la",
#                 "North America" = "n",
#                 "Western Europe" = "w")),
#   radioButtons(inputId = "reg", label = "Choose your region(s)",
#                c("World" = "all",
#                  "Latin America/Caribbean" = "lac",
#                  "North America" = "na",
#                  "Western Europe" = "we"))
# 
# )

server <- function(input, output) {}

shinyApp(ui = ui, server = server)



