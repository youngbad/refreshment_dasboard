#### Reactive values ####

top_shop_last_month <- shopssales %>%
  dplyr::filter(date == max(date)) %>%
  dplyr::group_by(city) %>% 
  dplyr::summarise(sales = sum(sales, na.rm = TRUE)) %>%
  dplyr::arrange(dplyr::desc(sales))

top_product_last_month <- sales %>%
  dplyr::filter(date == max(date)) %>%
  dplyr::group_by(brand) %>%
  dplyr::summarise(sales = sum(sales, na.rm = TRUE)) %>%
  dplyr::arrange(dplyr::desc(sales))

#### Outputs ####

output$test <- plotly::renderPlotly({
  fig <- plotly::plot_ly(
    domain = list(x = c(0, 1), y = c(0, 1)),
    value = 450,
    title = list(text = "Speed"),
    type = "indicator",
    mode = "gauge+number+delta",
    delta = list(reference = 380),
    gauge = list(
     axis = list(range = list(NULL, 500)),
     steps = list(
       list(range = c(0, 250), color = "lightgray"),
       list(range = c(250, 400), color = "gray")),
     threshold = list(
       line = list(color = "red", width = 4),
       thickness = 0.75,
       value = 490
      )
    )
  )
  
  fig %>% plotly::layout(width = NULL, heigth = NULL, plot_bgcolor = "rgba(0,0,0,0)",
                 paper_bgcolor = "rgba(0,0,0,0)")
})
output$summaryBoxes <- renderUI({
  shiny::fluidRow(
    summaryBox::summaryBox(
      title = "Przychody (Ostatni mies.)",
      value = sales %>% 
        dplyr::filter(date == max(date)) %>%
        dplyr::summarise(x = sum(sales, na.rm = T)) %>%
        pull() %>%
        formatMoney(),
      width = 3,
      icon = "fas fa-dollar-sign",
      style = "info"
    ),
    summaryBox::summaryBox(
      title = "Przychody (Ostatni rok)",
      value = sales %>% filter(lubridate::year(date) == max(lubridate::year(date))) %>% summarise(x = sum(sales, na.rm = T)) %>% pull() %>% formatMoney(),
      width = 3,
      icon = "fas fa-calendar",
      style = "info"
    ),
    
    summaryBox::summaryBox(
      title = paste("Najlepszy sklep w ostatnim miesiącu to:", {top_shop_last_month[1,1]}),
      value = top_shop_last_month[1,2] %>% formatMoney(),
      width = 3,
      icon = "fas fa-dollar-sign",
      style = "success"
    ),
    summaryBox::summaryBox(
      title = paste("Najlepszy produkt w ostanim miesiacu to:", {top_product_last_month[1,1]}),
      value = top_product_last_month[1,2] %>% formatMoney(),
      width = 3,
      icon = "fas fa-clipboard-list",
      style = "danger"
    )
  )
}
)

output$sales_revenue <- plotly::renderPlotly({
  
  sumsales <- sales %>%
    dplyr::filter(container %in% input$sales_revenue_container &
      brand %in% input$sales_revenue_brand) %>%
    dplyr::group_by(month = lubridate::month(date), brand, container) %>%
    dplyr::summarise("Wartość sprzedaży" = sum(sales, na.rm = T),
    "Ilość sprzedanych produktów" = sum(quantity, na.rm =T),
    "Średnia wartość sprzedanych produktów" = sum(sales, na.rm = T) / sum(quantity, na.rm = T)
    )
  
  sumsales %>%
    plotly::plot_ly(x = ~ month,
      y = ~ get(input$varsy),
      type = "bar",
      textposition = "auto", textfont = list(color = 'rgb(0,0,0)')
    )
}
)
