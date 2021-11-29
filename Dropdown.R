library(shiny)
library(ggplot2)
library(plotly)
ui <- navbarPage("Pursuit of Happiness",
                 tabPanel("What is Happiness?",h1("What is Happiness?"),"Explain what the WHR does and how they define happiness"),
                 tabPanel("Exploring the Data",h1("Exploring the Data"),fluidPage(
                   mainPanel(
                     selectInput(inputId = "region", label = "Choose a region",
                               c("Select..." = "",
                                 "Latin America and Caribbean" = "la",
                                 "North America and ANZ" = "no",
                                 "Western Europe" = "we",
                                 "Central and Eastern Europe" = "ce",
                                 "Middle East and North Africa" = "mi",
                                 "Sub-Saharan Africa" = "su",
                                 "East Asia" = "ea",
                                 "Southeast Asia" = "so",
                                 "Commonwealth of Independent States" = "co",
                                 "World" = "wo"))
                                ,
                   radioButtons(inputId = "reg", label = "Choose your region(s)",
                                c("Latin America and Caribbean" = "la",
                                  "North America and ANZ" = "no",
                                  "Western Europe" = "we",
                                  "Central and Eastern Europe" = "ce",
                                  "Middle East and North Africa" = "mi",
                                  "Sub-Saharan Africa" = "su",
                                  "East Asia" = "ea",
                                  "Southeast Asia" = "so",
                                  "Commonwealth of Independent States" = "co",
                                  "World" = "wo")),
                   
                   checkboxGroupInput("varSelect", "Choose Measures of Happiness",
                                      c("GDP per Capita",
                                      "Generosity",
                                      "Perceived Corruption",
                                      "Social Support",
                                      "Life Expectancy",
                                      "Free Will"))
                 
                 #  img(src = 'quokka.png', align = "right"),
                   ))),
                 tabPanel("A Paradox",h1("A Paradox"),"Explain disparity between 'happiness' levels and 'depression' levels"),
                 tabPanel("What is Happiness (seriously)?","Explain our own modified way to calculate happiness",h1("What is Happiness (seriously)?"),fluidPage(
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
                 tabPanel("References",h1("References"),fluidPage(
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
