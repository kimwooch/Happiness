library(shiny)
library(ggplot2)
library(plotly)
library(shinydashboard)

ui <- navbarPage("Pursuit of Happiness", collapsible = TRUE, inverse = TRUE, fluid = TRUE, 
                 tabPanel("What is Happiness?", icon = icon("dashboard"),
                          h1("What is Happiness?"),
                          tags$div("This seems to be a tough question to answer, but the United Nations’ Sustainable Solutions Development Network reckon they have the answer.",
                                   tags$br(), "The World Happiness Report is a publication of the Sustainable Solutions Development Network, which correlates subjective quality of life evaluations 
                                      with different societal factors across different countries. Using polls from Gallup, they ask people from different countries to evaluate their life 
                                      situation based on 10 being the best possible life for them and 0 being the worst. Using these results across countries and then relating them to other variables, 
                                      World Happiness Reports are then able to explain how happy countries are in terms of other variables.",
                                   tags$br(), "The variables chosen by World Happiness Reports are generosity, GDP per capita, social support, healthy life expectancy, perceptions of corruption, and freedom to 
                                      make life choices. They also include ‘Dystopia’, a hypothetical “least-happy country” in which each of the variables measured has the lowest evaluation from the dataset. 
                                      Therefore, no country in the dataset can score lower than dystopia. This value is then the baseline for each country’s score and is added in.",
                                   tags$br(),"Thus, the World Happiness Report tells us that right now they can explain most world happiness in terms of these variables. Let’s explore the actual data!"),
                      
                         ),
                 tabPanel("Exploring the Data",
                          h1("Exploring the Data"), icon = icon("globe"),
                          fluidPage(
                            "Click around! You can see visualizations of different variables on world happiness by selecting the different options.",
                            tags$br(),
                            tags$br(),
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
                 
                 tabPanel("Before and After Covid",
                          icon = icon("virus"),
                          
                          h1("How has COVID-19 Affected Scores?"),
                          fluidPage(
                            tags$div("In order to understand the effect COVID-19 has had on worldwide happiness scores,
                              these graphs compare the scores from 2020 and 2021."),
                            tags$br(),
                            sidebarPanel(
                              selectInput(inputId = "region", label = "Choose a region",
                                          c("Select..." = "",
                                            "North America and ANZ" = "nanz",
                                            "Latin America/Caribbean" = "la",
                                            "Western Europe" = "we",
                                            "Central and Eastern Europe" = "ce",
                                            "Commonwealth of Independent States" = "cis",
                                            "Middle East and North Africa" = "mena",
                                            "Sub-Saharan Africa" = "ssa",
                                            "East Asia" = "ea",
                                            "South Asia" = "sa",
                                            "Southeast Asia" = "sea"
                                          ))),
                            
                            mainPanel(
                              
                              plotOutput("covid")
                            )
                          )),
                 
                 tabPanel("A Paradox", icon = icon("question"),
                          h1("A Paradox"),
                          "This all seems well and good when it comes to happiness, but there is something a bit off about 
                          these measures of happiness. While yes, subjective measures are being taken into account, 
                          and yes these factors are considered explanatory, none seem to account for observed issues in
                          different countries one may expect to be related to happiness.", 
                          tags$br(), 
                          "One such issue, and a thorny one at that is the issue of suicide rates. 
                          While one may expect higher levels of happiness to be inversely related with these figures, 
                          the fact is that no relation is observed at all. According to a small exploratory analysis by 
                          Anavi Kajla, and Natalie Yeh, ‘There is no evidence which shows that countries with higher happiness 
                          score will have less suicide rate, and vice versa.’", 
                          tags$br(), 
                          "So what does this tell us? Well, for starters, the way world happiness is computed may be flawed. 
                          Second, it indicates that there may be other variables that explain world happiness. 
                          We intend to explore such a possible other variable here",
                          
                 ),
                 
                 tabPanel("A Different Approach", icon = icon("chart-line"),
                          h1(""),
                          "We decided to add the variable of Latitude into our dataset. 
                          The idea is that latitudes near the poles receive less light and colder winters than farther away, 
                          and that this may contribute to subjective feelings of happiness. 
                          You can explore yourself and see if you see any significant relationship!", 
                          tags$br(), 
                          tags$br(), 
                          plotOutput("lat")
                          
                 ),

                 tabPanel("References", icon = icon("book"),
                          h1("References"),
                          fluidPage(
                          "Helliwell, John F., Richard Layard, Jeffrey Sachs, and Jan-Emmanuel De Neve, eds. 2021. 
                          World Happiness Report 2021. New York: Sustainable Development Solutions Network.",
                          tags$br(), 
                          tags$br(), 
                          "Kajla, Anavi. 'Visualizing Suicide Rates and World Happiness.' Medium, Towards Data Science, 16 Dec. 2019, 
                          https://towardsdatascience.com/visualizing-suicide-rates-and-world-happiness-bc4e6411732f.
                          ")),
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
  
  output$lat <- renderPlot({
  ggplot(data = wh) + 
    geom_point(mapping = aes(x = latitude, y = X21Score, color = Region)) +
    ggtitle("Effect of Latitude on Happiness") +
    xlab("Latitude") + ylab("Happiness Score (2021)")
  
  })
    
  output$covid <- renderPlot({
    
    if("world" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point()  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
  
    if("nanz" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "North America and ANZ" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
    else if("la" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "Latin America and Caribbean" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
    else if("we" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "Western Europe" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
    else if("ce" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "Central and Eastern Europe" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
    else if("cis" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "Commonwealth of Independent States" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
    else if("mena" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "Middle East and North Africa" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
    else if("ssa" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "Sub-Saharan Africa" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
    else if("ea" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "East Asia" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
    else if("sa" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "South Asia" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
    else if("sea" %in% input$region)(
      ggplot(data = an, mapping = aes(x = Country, y = Score, color = Year)) + 
        geom_point(data = filter(an, Region == "Southeast Asia" ))  + 
        ggtitle("") + ylab("Score") + theme(axis.text.x=element_text(angle=60, hjust=1)))
    
  })
}



shinyApp(ui = ui, server = server)
