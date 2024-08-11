shopstabmap <- bs4Dash::tabItem(
  
  tabName = "shops_map",
  
  shiny::div(
    
    shiny::fluidRow(
      
      shiny::column(
        
        width = 12, 
        
        align = "center",
        
        shiny::h4("Shops Map"),
        
      )
    )
  ),
  
  shiny::fluidRow(
    
    shiny::column(
      
      width = 12,
      
      bs4Dash::box(
       title = p("Shops Map", 
        shiny::actionButton(
           inputId ="shops_map_help",
           label = "", 
           icon = icon("question"),
           style='padding:4px; font-size:80%'
           ),
        style = 'margin:0 auto;'
       ), 
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