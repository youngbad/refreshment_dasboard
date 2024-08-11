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

output$home_tab_monthly_sales_goal <- plotly::renderPlotly({
  fig <- plot_ly(
    domain = list(x = c(0, 1), y = c(0, 1)),
    value = sales %>% filter(lubridate::year(date) == max(lubridate::year(date))) %>% summarise(x = sum(sales, na.rm = T)) %>% pull(),
    type = "indicator",
    mode = "gauge+number+delta",
    gauge = list(
      axis =list(range = list(NULL, 30000000))
    ),
    delta = list(reference = 30000000, increasing = list(color = "RebeccaPurple"))
  )
  fig <- fig %>%
    layout(margin = list(l=50,r=50),
           title = list(text = "Annual sales target", y = 0.95, x = 0.5),
           plot_bgcolor='rgba(0, 0, 0, 0)',
           paper_bgcolor='rgba(0, 0, 0, 0)')
  
})

output$home_tab_annual_sales_goal <- plotly::renderPlotly({
  fig <- plot_ly(
    #domain = list(x = c(0, 1), y = c(0, 1)),
    value = sales %>% 
      dplyr::filter(date == max(date)) %>%
      dplyr::summarise(x = sum(sales, na.rm = T)) %>%
      pull(),
    type = "indicator",
    mode = "gauge+number+delta",
    gauge = list(
      axis =list(range = list(NULL, 2000000))
    ),
    delta = list(reference = 2000000, increasing = list(color = "green"))
  )
  fig <- fig %>%
    layout(margin = list(l=50,r=50),
           title = list(text = "Monthly sales target", y = 0.95, x = 0.5),
           plot_bgcolor='rgba(0, 0, 0, 0)',
           paper_bgcolor='rgba(0, 0, 0, 0)')
  
})

output$summaryBoxes <- shiny::renderUI({
  shiny::fluidRow(
    summaryBox::summaryBox(
      title = "Incomes for last month",
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
      title = "Incomes for last year",
      value = sales %>% filter(lubridate::year(date) == max(lubridate::year(date))) %>% summarise(x = sum(sales, na.rm = T)) %>% pull() %>% formatMoney(),
      width = 3,
      icon = "fas fa-calendar",
      style = "info"
    ),
    
    summaryBox::summaryBox(
      title = paste("Best shop of the month:", {top_shop_last_month[1,1]}),
      value = top_shop_last_month[1,2] %>% formatMoney(),
      width = 3,
      icon = "fas fa-dollar-sign",
      style = "success"
    ),
    summaryBox::summaryBox(
      title = paste("Best product of the month:", {top_product_last_month[1,1]}),
      value = top_product_last_month[1,2] %>% formatMoney(),
      width = 3,
      icon = "fas fa-clipboard-list",
      style = "danger"
    )
  )
}
)


