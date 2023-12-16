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
    summaryBox::summaryBox("Earnings (Monthly)", "$40,000", width = 3, icon = "fas fa-calendar", style = "info"),
    summaryBox::summaryBox("Earnings (Monthly)", "$40,000", width = 3, icon = "fas fa-calendar", style = "info"),
    summaryBox::summaryBox("Earnings (Annual)", "9332", width = 3, icon = "fas fa-dollar-sign", style = "success"),
    summaryBox::summaryBox("Tasks", "346", width = 3, icon = "fas fa-clipboard-list", style = "danger")
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
