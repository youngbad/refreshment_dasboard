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
      axis =list(range = list(NULL, 35000000))
    ),
    delta = list(reference = 35000000, increasing = list(color = "RebeccaPurple"))
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
        formatPretty(),
      width = 3,
      icon = "fas fa-dollar-sign",
      style = "info"
    ),
    summaryBox::summaryBox(
      title = "Incomes for last year",
      value = sales %>% filter(lubridate::year(date) == max(lubridate::year(date))) %>% summarise(x = sum(sales, na.rm = T)) %>% pull() %>% formatPretty(),
      width = 3,
      icon = "fas fa-calendar",
      style = "info"
    ),
    
    summaryBox::summaryBox(
      title = paste("Best shop of the month:", {top_shop_last_month[1,1]}),
      value = top_shop_last_month[1,2] %>% formatPretty(),
      width = 3,
      icon = "fas fa-dollar-sign",
      style = "success"
    ),
    summaryBox::summaryBox(
      title = paste("Best product of the month:", {top_product_last_month[1,1]}),
      value = top_product_last_month[1,2] %>% formatPretty(),
      width = 3,
      icon = "fas fa-clipboard-list",
      style = "danger"
    )
  )
}
)


output$year_sales_by_city_lineplot <- plotly::renderPlotly({
  data_wide <- shopssales %>% filter(year(date) == '2018') %>%
    group_by(shop_name, month = lubridate::month(date, label = T)) %>%
    summarise(sales = sum(sales)) %>%
    spread(shop_name, sales)
  
  plot <- plot_ly(data = data_wide, x = ~data_wide$month) %>%
    add_lines(y = ~Athens_1, name = "Athens_1", line = list(color = 'blue'),
              hovertemplate = 'Month: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    add_lines(y = ~Athens_2, name = "Athens_2", line = list(color = 'blue'),
              hovertemplate = 'Month: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    add_lines(y = ~Irakleion, name = "Irakleion", line = list(color = 'red'),
              hovertemplate = 'Month: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    add_lines(y = ~Patra, name = "Patra", line = list(color = 'green'),
              hovertemplate = 'Month: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    add_lines(y = ~Thessaloniki, name = "Thessaloniki", line = list(color = 'orange'),
              hovertemplate = 'Month: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    add_lines(y = ~Larisa, name = "Larisa", line = list(color = 'purple'),
              hovertemplate = 'Month: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    layout(title = "Sales by Month and City for 2018",
           xaxis = list(title = "Month"),
           yaxis = list(title = "Sales"))
  
  plot
  
})

output$annualy_sales_by_city_lineplot <- plotly::renderPlotly({
  data_wide <- shopssales %>% 
    group_by(shop_name, year = lubridate::year(date)) %>%
    summarise(sales = sum(sales)) %>%
    spread(shop_name, sales)
  
  plot <- plot_ly(data = data_wide, x = ~data_wide$year) %>%
    add_lines(y = ~Athens_1, name = "Athens_1", line = list(color = 'blue'),
              hovertemplate = 'Year: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    add_lines(y = ~Athens_2, name = "Athens_2", line = list(color = 'blue'),
              hovertemplate = 'Year: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    add_lines(y = ~Irakleion, name = "Irakleion", line = list(color = 'red'),
              hovertemplate = 'Year: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    add_lines(y = ~Patra, name = "Patra", line = list(color = 'green'),
              hovertemplate = 'Year: %{x}<br>Sales: %{y:,.0f}<extra></extra>')%>%
    add_lines(y = ~Thessaloniki, name = "Thessaloniki", line = list(color = 'orange'),
              hovertemplate = 'Year: %{x}<br>Sales: %{y:,.0f}<extra></extra>') %>%
    add_lines(y = ~Larisa, name = "Larisa", line = list(color = 'purple'),
              hovertemplate = 'Year: %{x}<br>Sales: %{y:,.0f}<extra></extra>')%>%
    layout(title = "Annualy sale in cities",
           xaxis = list(title = "Year"),
           yaxis = list(title = "Sales"))
  
  plot
  
})
