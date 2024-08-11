productsalesbybrand <- bs4Dash::tabItem(
  
  tabName = "product_sales_by_brand",
  
  shiny::column(
    
    width = 12,
    
    bs4Dash::box(
      title = "Product sales", 
      elevation = 4,
      closable = TRUE, 
      width = 12,
      solidHeader = TRUE, 
      status = "primary",
      collapsible = TRUE,
      
      shiny::fluidRow(
        
        shiny::column(
          
          width = 4,
          
          shinyWidgets::pickerInput(
            inputId = "sales_revenue_container",
            label = "Packaging type",
            choices = unique(containers$container_type),
            choicesOpt = list(content = containers$img)
          )
        ),
        
        shiny::column(
          
          width = 4,
          
          shinyWidgets::pickerInput(
            inputId = "sales_revenue_brand",
            label = "Product brand",
            choices = unique(sales$brand))
        ),
        
        shiny::column(
          
          width = 4,
          
          shinyWidgets::pickerInput(
            inputId = "varsy", 
            label = "Choose plot:",
            choices = c("Sales value", "Sales quantity", "Average value of products sold"),
            multiple = F,
            selected = "Sales value"
          )
        )
      ),
      
      plotly::plotlyOutput('sales_revenue')
      
    )
  )
  
)

