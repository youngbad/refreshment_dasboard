hometab <- bs4Dash::tabItem(
  
  tabName = "home",
  
  shiny::uiOutput(outputId = "summaryBoxes"),
  
  shiny::column(
    
    width = 12,
        
    shiny::column(width = 9),
         
    shiny::column(
      
      width = 3,
      
      shiny::div(
        
        style = "height: 100px",
        
        plotly::plotlyOutput(
          outputId = 'test',
          height = '200px',
          width = '200px'
        )
      )
    )
  ),
  # shiny::h4("Info Boxes"),
  # 
  # shiny::fluidRow(
  #   
  #   bs4Dash::infoBox(
  #     tabName = "cardsAPI",
  #     title = "Navigate to Cards API section",
  #     value = 1410,
  #     color = "indigo",
  #     icon = icon("laptop-code")
  #   ),
  #   
  #   bs4Dash::infoBox(
  #     tabName = "colors",
  #     title = "Navigate to colors section",
  #     color = "info",
  #     value = 240,
  #     icon = icon("droplet"),
  #     elevation = 4
  #   ),
  #   
  #   bs4Dash::infoBox(
  #     title = "Comments",
  #     subtitle = "A subtitle",
  #     color = "indigo",
  #     gradient = TRUE,
  #     fill = TRUE,
  #     value = 41410,
  #     icon = icon("comments"),
  #     href = "https://www.google.com"
  #   )
  # )
)