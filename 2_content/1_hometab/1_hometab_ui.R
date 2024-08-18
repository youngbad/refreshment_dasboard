hometab <- bs4Dash::tabItem(
  
  tabName = "home",
  shiny::fluidRow(
    shiny::column(
      
      width = 12,
      
      shiny::uiOutput(outputId = "summaryBoxes")
      
    )
  ),
  
  br(),
  
  bs4Dash::box(
    
    width = 12,
    collapsible = FALSE,
    
    shiny::fluidRow(
      
      
      title = h5("Summary of sales goals", align = "center"),
      
      shiny::column(
        
        width = 4,
        
        align = "center",
        
        shiny::fluidRow(
          
          shiny::div(
            
            style = "postion:flex;",
            
            plotly::plotlyOutput(
              outputId = 'home_tab_annual_sales_goal',
              height = '250',
              width = '350'
            )
          )
        ),
        
        shiny::fluidRow(
          
          shiny::div(
            
            style = "postion:flex;",
            
            plotly::plotlyOutput(
              outputId = 'home_tab_monthly_sales_goal',
              height = '250',
              width = '350'
            )
          )
        )
      ),
      shiny::column(
        
        width = 8,
        
        align = "center",
        
        shiny::fluidRow(
          plotly::plotlyOutput(
             outputId = 'year_sales_by_city_lineplot',
             height = '225'
             )
        ),
        
        br(),
        
        shiny::fluidRow(
          plotly::plotlyOutput(
            outputId = 'annualy_sales_by_city_lineplot',
            height = '225'
          )
        )
      )
    )
  )
)
