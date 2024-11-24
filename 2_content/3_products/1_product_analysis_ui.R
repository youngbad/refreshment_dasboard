productOverviewUI <- function(id){
  
  ns <- NS(id)
  
  shiny::tagList(
    
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
        inputId = ns("radio"),
        images = c("images/bottle-soda.jpeg", "images/plastic-bottle.png", "images/can.jpeg"),
        values = c("glass", "plastic", "can"),
        selected = "glass"
       
      )
    ),
    
    br(),
    
    shiny::selectInput(
      inputId = ns("year_select"),
      label = "Select Year",
      choices = unique(lubridate::year(sales$date))
    ),
    
    shinyThings::buttonGroup(
      inputId = ns("brand_select"),
      choices = unique(sales$brand),
      choice_labels = unique(sales$brand_clean),
      selected = "adult-cola",
      multiple = TRUE,
      btn_class = "btn-info"
      ),
    
    DT::dataTableOutput(outputId = ns('by_brand'))
    
  )
}

productsales <- bs4Dash::tabItem(
  
  tabName = "product_sales",
  
  shiny::div(
    
    id = "product_analysis_soda_selected",
    
    productOverviewUI("product_analysis")
    
  )
)