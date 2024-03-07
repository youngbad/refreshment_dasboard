formatMoney  <- function(x, ...) {
  paste0("$", formatC(as.numeric(x), format="f", digits=2, big.mark=","))
}

formatPretty <- function(x, ...) {
  paste0(formatC(as.numeric(x), format="f", digits = 0, big.mark=","))
}

select_choice_img <- function(img, text) {
  shiny::HTML(paste(
    tags$img(src=img, width=30, height=22),
    text
  ))
}

radioImages <- function(inputId, images, values){
  radios <- lapply(
    seq_along(images),
    function(i) {
      id <- paste0(inputId, i)
      tagList(
        tags$input(
          type = "radio",
          name = inputId,
          id = id,
          class = "input-hidden",
          value = as.character(values[i])
        ),
        tags$label(
          `for` = id,
          tags$img(
            src = images[i]
          )
        )
      )
    }
  )
  do.call(
    function(...) div(..., class = "shiny-input-radiogroup", id = inputId), 
    radios
  )
}

shop_analisys_server_plot_monthly <- function(selected_shop_name, selected_year){
  
  req(rv)
  
  plot_dt <- shopssales %>%
    dplyr::filter(
      shop_name == selected_shop_name,
      year(date) == selected_year
    ) %>%
    group_by(month = lubridate::month(date)) %>%
    summarise(
      quantity = sum(quantity),
      sales = sum(sales)
    )
  
  fig <- plot_ly(
    data = plot_dt,
    x = month_names,
    y = ~sales,
    type = "bar",
    name = "Wartość",
    xaxis = list(tickvals = 1:12, ticktext = month_names)
  ) %>%
    add_trace(
      y = ~quantity,
      name = "Ilość"
    ) %>%
    layout(
      yaxis = list(title = "Wartość/Ilość sprzedaży", barmode = "group"),
      xaxis = list(title = "Data"),
      title = paste0("Wybrany rok: ", selected_year)
      
    )
  return(fig)
}

shop_analisys_cards_summary <- function(selected_shop_name, selected_year){
  
  req(rv)
  
  
  best_month <- shopssales %>%
    filter(year(date) == selected_year, shop_name == selected_shop_name) %>%
    group_by(month = lubridate::month(date)) %>%
    summarise(sale_value = sum(sales)) %>%
    arrange(desc(sale_value))
   
  best_year <- shopssales %>% 
    filter(shop_name == selected_shop_name) %>%
    group_by(year = year(date)) %>%
    summarise(sale_value = sum(sales)) %>%
    arrange(desc(sale_value))
  
  best_product <- shopssales %>%
    filter(year(date) == selected_year, shop_name == selected_shop_name) %>%
    group_by(brand) %>%
    summarise(sale_value = sum(sales)) %>%
    arrange(desc(sale_value))
  
  dt <- data.table::data.table(
    "" = c("Najlepszy miesiąc", "Najlepszy rok", "Najlepszy Produkt"),
    " " = c(month.name[best_month[1,1] %>% as.numeric(), ], best_year[1,1] %>% as.character(), )
  )
  
}



shop_analisys_cards_ui <- function(shop_name, tabs = 3, tabs_names = c("Podsumowanie", "Analiza miesięczna", "Najlepsze produkty")){
  tryCatch({
    
    ui <- shiny::column(
      
      width = 12,
      
      shiny::selectInput(
        inputId = paste0("shop_sales_selected_year_", shop_name),
        label = paste0("Wybrany rok"),
        choices = unique(year(shopssales$date))
        
      ),
      
      bs4Dash::bs4TabCard(
        title = shop_name,
        type = 'tabs',
        collapsible = FALSE,
        width = 12,
        tabPanel(
          title = tabs_names[1],
         # plotly::plotlyOutput(paste0("summary_", shop_name))
        ),
        tabPanel(
          title = tabs_names[2],
          plotly::plotlyOutput(paste0("monthly_", shop_name))
        ),
        tabPanel(
          title = tabs_names[3]#,
          #output[[paste0("best_product_", shop_name)]]
        )
      )
    )
    
  }, error = function(e){
    stop("Error in: ", conditionMessage(e), "\n")
    ui <- NA
  })
  
  return(ui)
  
}



# shop_analisys_server_dt_summary <- function(shop_name, tab_name){
#   
# }
