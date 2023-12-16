shopstabmap <- bs4Dash::tabItem(
  
  tabName = "shops_map",
  
  shiny::div(
    
    style = "display: inline-block; vertical-align:top; padding-top:100px;",
    
    shiny::fluidRow(
      
      shiny::h4("Mapa sklepów "),
      
      shiny::actionButton(
        inputId ="shops_map_help",
        label = "", 
        icon = icon("question")
      )
    )
  ),
  
  shiny::fluidRow(
    
    shiny::column(
      
      width = 12,
      
      bs4Dash::box(
       title = "Mapa sklepów", 
       elevation = 4,
       width = 12,
       closable = TRUE, 
       solidHeader = TRUE, 
       status = "primary",
       collapsible = TRUE,
       leaflet::leafletOutput("map")
      ),
  
    shiny::br(),
    
    DT::dataTableOutput(outputId = "table")
      )
    )
)