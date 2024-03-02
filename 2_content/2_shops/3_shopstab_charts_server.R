output$summary_Athens_1 <- plotly::renderPlotly({
  shop_analisys_server_plot_summary("Athens_1", input$shop_sales_selected_year_Athens_1)
})

output$summary_Athens_2 <- plotly::renderPlotly({
  shop_analisys_server_plot_summary("Athens_2", input$shop_sales_selected_year_Athens_2)
})

output$summary_Irakleion <- plotly::renderPlotly({
  shop_analisys_server_plot_summary("Irakleion", input$shop_sales_selected_year_Irakleion)
})

output$summary_Patra <- plotly::renderPlotly({
  shop_analisys_server_plot_summary("Patra", input$shop_sales_selected_year_Patra)
})

output$summary_Thessaloniki <- plotly::renderPlotly({
  shop_analisys_server_plot_summary("Thessaloniki", input$shop_sales_selected_year_Thessaloniki)
})

output$summary_Larisa <- plotly::renderPlotly({
  shop_analisys_server_plot_summary("Larisa", input$shop_sales_selected_year_Larisa)
})
