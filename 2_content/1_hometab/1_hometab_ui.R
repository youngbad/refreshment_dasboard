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
  
    title = h5("Summary of sales goals", align = "center"),
    
    shiny::fluidRow(
      
      shiny::column(
        
        width = 6,
        
        align = "center",

        shiny::div(
          
          style = "postion:flex;",
          
          plotly::plotlyOutput(
            outputId = 'home_tab_monthly_sales_goal',
            height = '350',
            width = '350'
          )
        )
      ),
      shiny::column(
        
        width = 6,
        
        align = "center",
        
        shiny::div(
          
          style = "postion:flex;",
          
          plotly::plotlyOutput(
            outputId = 'home_tab_annual_sales_goal',
           height = '350',
           width = '350'
          )
        )
      )
    )
  )
)
