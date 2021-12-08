library(shiny)
library(ggplot2)
library(plotly)
library(shinydashboard)

ui <- navbarPage("Pursuit of Happiness", collapsible = TRUE, inverse = TRUE, fluid = TRUE, 
                 tabPanel("What is Happiness?", icon = icon("dashboard"),
                          h1("What is Happiness?"),
                          tags$div("This seems to be a tough question to answer, but the United Nations’ Sustainable Solutions Development Network reckon they have the answer.",tags$br(), "The World Happiness Report is a publication of the Sustainable Solutions Development Network, which correlates subjective quality of life evaluations with different societal factors across different countries. Using polls from Gallup, they ask people from different countries to evaluate their life situation based on 10 being the best possible life for them and 0 being the worst. Using these results across countries and then relating them to other variables, World Happiness Reports are then able to explain how happy countries are in terms of other variables.",tags$br(),"The variables chosen by World Happiness Reports are generosity, GDP per capita, social support, healthy life expectancy, perceptions of corruption, and freedom to make life choices. They also include ‘Dystopia’, a hypothetical “least-happy country” in which each of the variables measured has the lowest evaluation from the dataset. Therefore, no country in the dataset can score lower than dystopia. This value is then the baseline for each country’s score and is added in.
",tags$br(),"Thus, the World Happiness Report tells us that right now they can explain most world happiness in terms of these variables. Let’s explore the actual data!
"),
                          tags$img(height = 100,
                                   width = 100,
                                   src = "https://i.pinimg.com/originals/3c/15/5d/3c155de14082001ac9215647f03517f9.jpg")),
                 tabPanel("Exploring the Data",
                          h1("Exploring the Data"), icon = icon("globe"),
                          fluidPage(
                            
                            sidebarPanel(
                              
                              
                              
                              radioButtons(inputId = "meas", label = "Choose your measurement",
                                           c("GDP Per Capita" = "X21GDPpc",
                                             "Social Support" = "X21Social.support",
                                             "Life Expectancy" = "X21life",
                                             "Freedom to Make Life Choices" = "X21choices",
                                             "Generosity" = "X21generosity",
                                             "Perceptions of Corruption" = "X21corruption"))), 
                            mainPanel(
                              plotOutput("dotp")))),
                 
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
                            
                            
                          )),
                 tabPanel("References", icon = icon("book"),
                          h1("References"),
                          fluidPage(
                          )),
                 tags$img(height = 100,
                          width = 100,
                          src = "https://i.pinimg.com/originals/3c/15/5d/3c155de14082001ac9215647f03517f9.jpg"))


#YouTube video for server: https://www.youtube.com/watch?v=-h6xveotXXc&t=776s
server <- function(input, output) {
  output$dotp <- renderPlot({
    if("X21GDPpc" %in% input$meas)(
      ggplot(data = wh) + 
        geom_point(mapping = aes(x = X21GDPpc, y = X21Score, color = Region)) + 
        ggtitle("Effect of GDP on Happiness") +
        xlab("GDP Per Capita (2021)") + ylab("Happiness Score (2021)"))
    
    else if("X21Social.support" %in% input$meas)(
      ggplot(data = wh) + 
        geom_point(mapping = aes(x = X21Social.support, y = X21Score, color = Region)) +
        ggtitle("Effect of Social Support on Happiness") +
        xlab("Social Support (2021)") + ylab("Happiness Score (2021)"))
    
    else if("X21life" %in% input$meas)(
      ggplot(data = wh) + 
        geom_point(mapping = aes(x = X21life, y = X21Score, color = Region))+
        ggtitle("Effect of Life Expectancy on Happiness") +
        xlab("Life Expectancy (2021)") + ylab("Happiness Score (2021)"))
    
    else if("X21choices" %in% input$meas)(
      ggplot(data = wh) + 
        geom_point(mapping = aes(x = X21choices, y = X21Score, color = Region))+
        ggtitle("Effect of Freedom on Happiness") +
        xlab("Freedom to Make Life Choices (2021)") + ylab("Happiness Score (2021)"))
    
    else if("X21generosity" %in% input$meas)(
      ggplot(data = wh) + 
        geom_point(mapping = aes(x = X21generosity, y = X21Score, color = Region))+
        ggtitle("Effect of Generosity on Happiness") +
        xlab("Generosity (2021)") + ylab("Happiness Score (2021)"))
    
    else if("X21corruption" %in% input$meas)(
      ggplot(data = wh) + 
        geom_point(mapping = aes(x = X21corruption, y = X21Score, color = Region))+
        ggtitle("Effect of Corruption on Happiness") +
        xlab("Perception of Corruption (2021)") + ylab("Happiness Score (2021)"))
    
    
  })
}



shinyApp(ui = ui, server = server) 
