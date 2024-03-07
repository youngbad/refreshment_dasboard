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
                    xaxis = list(tickvals = 1:12, ticktext = rv$month_names),
                    text = ~ get(input$varsy),
                    texttemplate = '%{y:.2s}',
                    hovertemplate = paste('%{x}', '<br>', input$varsy, ': %{y:.2s}<br>'),
                    textposition = "outside", textfont = list(color = 'rgb(0,0,0)')
    )
}
)