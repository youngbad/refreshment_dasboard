productsalesbybrand <- bs4Dash::tabItem(
  
  tabName = "product_sales_by_brand",
  
  shiny::column(
    
    width = 12,
    
    bs4Dash::box(
      title = "Sprzedaż produktów", 
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
            label = "Typ opakowania",
            choices = unique(containers$container_type),
            choicesOpt = list(content = containers$img)
          )
        ),
        
        shiny::column(
          
          width = 4,
          
          shinyWidgets::pickerInput(
            inputId = "sales_revenue_brand",
            label = "Marka produktu",
            choices = unique(sales$brand))
        ),
        
        shiny::column(
          
          width = 4,
          
          shinyWidgets::pickerInput(
            inputId = "varsy", 
            label = "Typ wykresu",
            choices = c("Wartość sprzedaży", "Ilość sprzedanych produktów", "Średnia wartość sprzedanych produktów"),
            multiple = F,
            selected = "Wartość sprzedaży"
          )
        )
      ),
      
      plotly::plotlyOutput('sales_revenue')
      
    )
  )
  
)

