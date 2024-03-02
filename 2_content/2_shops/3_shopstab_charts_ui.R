shopstabcharts <- bs4Dash::tabItem(
  
  tabName = 'shops_charts',
  
  shiny::fluidRow(
    
    shiny::column(
      
      width = 6,
      
      shop_analisys_cards_ui("Athens_1")
      
    ),
    
    shiny::column(
      
      width = 6,
      
      shop_analisys_cards_ui("Athens_2")
      
    )
  ),
    
  shiny::fluidRow(
    
    shiny::column(
      
      width = 6,
      
      shop_analisys_cards_ui("Irakleion")
      
    ),
    
    shiny::column(
      
      width = 6,
      
      shop_analisys_cards_ui("Patra")
      
    )
  ),
  
  shiny::fluidRow(
    
    shiny::column(
      
      width = 6,
      
      shop_analisys_cards_ui("Larisa")
      
    ),
    
    shiny::column(
      
      width = 6,
      
      shop_analisys_cards_ui("Thessaloniki")
      
    )
  )
)