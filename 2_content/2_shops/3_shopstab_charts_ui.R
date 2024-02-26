shopstabcharts <- bs4Dash::tabItem(
  
  tabName = 'shops_charts',
  
  shiny::fluidRow(
    
    shiny::column(
      
      width = 4,
      
      bs4Dash::bs4TabCard()
      
    ),
    
    shiny::column(
      
      width = 4,
      
      bs4Dash::tabBox(
        
      )
      
    ),
    
    shiny::column(
      
      width = 4
      
    )
    
  ),
  
  shiny::fluidRow(
    
    shiny::column(
      
      width = 4
      
    ),
    
    shiny::column(
      
      width = 4
      
    ),
    
    shiny::column(
      
      width = 4
      
    )
    
  )
  
)