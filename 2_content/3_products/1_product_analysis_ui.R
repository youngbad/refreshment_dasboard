productsales <- bs4Dash::tabItem(
  
  tabName = "product_sales",
  
  shinyjs::useShinyjs(),
  
  shiny::div(
    
    shiny::column(
      width = 12,
      
      align="center",
      
      shiny::fluidRow(
        shiny::h4("Product analysis"),
      ),
      
      shiny::fluidRow(
        tags$label("Packing type")
      )
    )
  ),

  shiny::div(
    
    style = "display: flex;
             justify-content: center;",
    
    radioImages(
      inputId = "radio",
      images = c("images/bottle-soda.jpeg", "images/plastic-bottle.png", "images/can.jpeg"),
      values = c("soda", "plastic-bottle", "can")
    )
  ),
  
  shiny::div(
    
    id = "product_analysis_soda_selected",
    
    h5("soda selected hidden")
    
  ) %>% shinyjs::hidden(),
  
  shiny::div(
    
    id = "product_analysis_bottle_selected",
    
    h5("bottle selected hidden")
    
  ) %>% shinyjs::hidden(),
  
  shiny::div(
    
    id = "product_analysis_can_selected",
    
    h5("can selectesad"),
    
    dataTableOutput('product_analysis_can_table')
    
  ) %>% shinyjs::hidden()
  
)