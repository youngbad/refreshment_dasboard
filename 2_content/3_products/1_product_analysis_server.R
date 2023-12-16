observeEvent(input$radio, {
  if(input$radio == "soda") {
    
    shinyjs::show("product_analysis_soda_selected")
    shinyjs::hide("product_analysis_bottle_selected")
    shinyjs::hide("product_analysis_can_selected")
    
  } else if(input$radio == "plastic-bottle"){
    
    shinyjs::show("product_analysis_bottle_selected")
    shinyjs::hide("product_analysis_can_selected")
    shinyjs::hide("product_analysis_soda_selected")
    
    
  } else if(input$radio == "can"){
    
    shinyjs::show("product_analysis_can_selected")
    shinyjs::hide("product_analysis_bottle_selected")
    shinyjs::hide("product_analysis_soda_selected")
    
    print(sales %>% head)
    
  }
})

output$product_analysis_can_table <- DT::renderDT(
  DT::datatable({
    sales %>%
      filter(container == 'can') %>%
      group_by(brand) %>%
      summarise(`Suma sprzedazy `= sum(sales),
                `Suma sprzedanych produktow` = sum(quantity)
      )
    sales
  })
)