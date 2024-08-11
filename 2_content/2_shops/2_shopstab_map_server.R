shiny::observeEvent(input$shops_map_help, {
  shiny::showNotification("Click to choosen shoop to see details", duration = 100000)
})


output$map <- leaflet::renderLeaflet({
  
  shopssales <- dplyr::left_join(x = sales, y = shops, by = 'shop') %>%
    dplyr::select(shop, brand, date, quantity, sales, long, lat, city) %>%
    dplyr::mutate(id = as.numeric(stri_extract(shop, regex = "\\d+")))
  
  leaflet::leaflet() %>%
    leaflet::addTiles() %>%
    leaflet::addMarkers(
      data = shopssales,
      lat = ~lat,
      lng = ~long,
      layerId = ~id,
      icon = ~makeIcon("https://cdn-icons-png.flaticon.com/512/2331/2331966.png", iconWidth = 20, iconHeight = 20),
      label = ~paste("Sklep w:", city),
      popup = ~paste(
        "Shop:", city,
        "<br>Sales value: ", formatPretty(sum(shopssales[city==city, ]$sales, na.rm=T)),
        "<br>Sales quantity: ", formatPretty(sum(quantity, na.rm=T))
      )
    )
               
})

## observing a click will return the `id` you assigned in the `layerId` argument
shiny::observeEvent(input$map_marker_click, {
  
  click <- input$map_marker_click
  print(click)
  ## filter the data and output into a table
  output$table <- DT::renderDT({
    
    shopssales <- shopssales[shopssales$id == click$id, ]
    
    shopssales %>% dplyr::group_by("Year" = lubridate::year(date)) %>%
      dplyr::summarise("Sales quantity" = formatPretty(sum(quantity, na.rm  = T)),
                       "Sales value" = formatPretty(sum(sales, na.rm = T))
      )
    
  },
    rownames = FALSE,
    options = list(
     dom = 't',
     columnDefs = list(list(className = 'dt-center', targets = "_all"))
    )
  )
})

