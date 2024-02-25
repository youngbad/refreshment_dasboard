hometab <- bs4Dash::tabItem(
  
  tabName = "home",
  shiny::fluidRow(
    shiny::column(
      
      width = 12,
      
      shiny::uiOutput(outputId = "summaryBoxes")
      
    )
  ),
  
  br(),
  
  shiny::fluidRow(
  
    title = h5("Podsumowanie celów sprzedażowych", align = "center"),
    
    shiny::fluidRow(
      
      shiny::column(
        
        width = 6,
        
        align = "center",

        shiny::div(
          
          plotly::plotlyOutput(
            outputId = 'home_tab_monthly_sales_goal',
            height = '550px',
            width = '550px'
          )
        )
      ),
      shiny::column(
        
        width = 6,
        
        align = "center",
        
        shiny::div(
          
          plotly::plotlyOutput(
            outputId = 'home_tab_annual_sales_goal',
           height = '550px',
           width = '550px'
          )
        )
      )
    )
  )
)
