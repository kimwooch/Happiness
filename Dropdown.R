llibrary(shiny)
library(ggplot2)
library(plotly)
library(shinydashboard)

ui <- navbarPage("Pursuit of Happiness", collapsible = TRUE, inverse = TRUE, fluid = TRUE, 
                 tabPanel("What is Happiness?", icon = icon("dashboard"),
                          h1("What is Happiness?"),
                          "Explain what the WHR does and how they define happiness",
                          tags$img(height = 100,
                                   width = 100,
                                   src = "https://i.pinimg.com/originals/3c/15/5d/3c155de14082001ac9215647f03517f9.jpg")),
                 tabPanel("Exploring the Data",
                          h1("Exploring the Data"), icon = icon("globe"),
                          fluidPage(
                            mainPanel(
                              sidebarPanel(
                                selectInput(
                                inputId = "region", 
                                label = "Choose a region",
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
                                   "World" = "wo")),
                     
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
                                          "Free Will"))), 
                     tags$img(height = 100,
                              width = 100,
                              src = "https://i.pinimg.com/originals/3c/15/5d/3c155de14082001ac9215647f03517f9.jpg"),
                     tags$img(height = 100,
                              width = 100,
                              src = "https://i.pinimg.com/564x/57/d4/27/57d427b8b067fa790399f301bbe177c0.jpg"),

                   ))),
                 tabPanel("A Paradox", icon = icon("question"),
                          h1("A Paradox"),
                          "Explain disparity between 'happiness' levels and 'depression' levels",
                          tags$img(height = 100,
                                   width = 100,
                                   src = "https://i.pinimg.com/originals/3c/15/5d/3c155de14082001ac9215647f03517f9.jpg")),
                 tabPanel("What is Happiness (seriously)?",
                          icon = icon("diamond"),
                          "Explain our own modified way to calculate happiness",
                          h1("What is Happiness (seriously)?"),
                          fluidPage(
                   selectInput(inputId = "region", 
                               label = "Choose a region",
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
                 tabPanel("References", icon = icon("book"),
                          h1("References"),
                          fluidPage(
                            selectInput(
                              inputId = "region", 
                              label = "Choose a region",
                               c("Select..." = "",
                                 "Latin America/Caribbean" = "la",
                                 "North America" = "n",
                                 "Western Europe" = "w")),
                   radioButtons(
                     inputId = "reg",
                     label = "Choose your region(s)",
                     c("World" = "all",
                       "Latin America/Caribbean" = "lac",
                       "North America" = "na",
                       "Western Europe" = "we")))),
                 tags$img(height = 100,
                          width = 100,
                          src = "https://i.pinimg.com/originals/3c/15/5d/3c155de14082001ac9215647f03517f9.jpg"))
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

#YouTube video for server: https://www.youtube.com/watch?v=-h6xveotXXc&t=776s
server <- function(input, output) {
  output$plot2 <- renderPlotly(
    if("GDP per Capita" %in% input$varSelect)(
      plot2b <- plot_ly( )
    )
  )
}

shinyApp(ui = ui, server = server)
