output$monthly_Athens_1 <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Athens_1", input$shop_sales_selected_year_Athens_1)
})

output$monthly_Athens_2 <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Athens_2", input$shop_sales_selected_year_Athens_2)
})

output$monthly_Irakleion <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Irakleion", input$shop_sales_selected_year_Irakleion)
})

output$monthly_Patra <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Patra", input$shop_sales_selected_year_Patra)
})

output$monthly_Thessaloniki <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Thessaloniki", input$shop_sales_selected_year_Thessaloniki)
})

output$monthly_Larisa <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Larisa", input$shop_sales_selected_year_Larisa)
})
