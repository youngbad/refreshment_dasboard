productOverviewServer <- function(id){
  
  shiny::moduleServer(id,
                      
   function(input, output, session) {
     
    output$by_brand <- DT::renderDT(
      DT::datatable({
        data$shopssales %>% filter(
          lubridate::year(date) == input$year_select,
          brand %in% input$brand_select,
          container == as.character(input$radio)
        ) %>% 
          dplyr::group_by(
            brand
          ) %>%
          dplyr::summarise(
            Sales = sum(sales, na.rm = T),
            Quantity = sum(quantity, na.rm = T)
          )
      })
    )
   }
  )
}

productOverviewServer("product_analysis")