output$summary_Athens_1 <- DT::renderDT(
  DT::datatable({
  shop_analisys_cards_summary("Athens_1", input$shop_sales_selected_year_Athens_1)
  },
  rownames = FALSE,
  options = list(
    dom = 't',
    ordering = FALSE
    )
))

output$monthly_Athens_1 <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Athens_1", input$shop_sales_selected_year_Athens_1)
})

output$summary_Athens_2 <- DT::renderDT(
  DT::datatable({
    shop_analisys_cards_summary("Athens_2", input$shop_sales_selected_year_Athens_2)
  },
  rownames = FALSE,
  options = list(
    dom = 't',
    ordering = FALSE
  )
  )
)

output$monthly_Athens_2 <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Athens_2", input$shop_sales_selected_year_Athens_2)
})

output$summary_Irakleion <- DT::renderDT(
  DT::datatable({
    shop_analisys_cards_summary("Irakleion", input$shop_sales_selected_year_Irakleion)
  },
  rownames = FALSE,
  options = list(
    dom = 't',
    ordering = FALSE
  )
  )
)

output$monthly_Irakleion <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Irakleion", input$shop_sales_selected_year_Irakleion)
})

output$summary_Patra <- DT::renderDT(
  DT::datatable({
    shop_analisys_cards_summary("Patra", input$shop_sales_selected_year_Patra)
  },
  rownames = FALSE,
  options = list(
    dom = 't',
    ordering = FALSE
  )
  )
)

output$monthly_Patra <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Patra", input$shop_sales_selected_year_Patra)
})

output$summary_Thessaloniki <- DT::renderDT(
  DT::datatable({
    shop_analisys_cards_summary("Thessaloniki", input$shop_sales_selected_year_Thessaloniki)
  },
  rownames = FALSE,
  options = list(
    dom = 't',
    ordering = FALSE
  )
  )
)

output$monthly_Thessaloniki <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Thessaloniki", input$shop_sales_selected_year_Thessaloniki)
})

output$summary_Larisa <- DT::renderDT(
  DT::datatable({
    shop_analisys_cards_summary("Larisa", input$shop_sales_selected_year_Larisa)
  },
  rownames = FALSE,
  options = list(
    dom = 't',
    ordering = FALSE
  )
  )
)

output$monthly_Larisa <- plotly::renderPlotly({
  shop_analisys_server_plot_monthly("Larisa", input$shop_sales_selected_year_Larisa)
})
