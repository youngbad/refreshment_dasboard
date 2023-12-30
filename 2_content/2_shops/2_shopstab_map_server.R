shiny::observeEvent(input$shops_map_help, {
  shiny::showNotification("Kliknij na wybrany sklep aby rozwinąć bardziej szegółowe dane", duration = 100000)
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
        "Sklep w:", city,
        "<br>Wartość sprzedaży: ", formatPretty(sum(sales, na.rm=T)),
        "<br>Ilość spredanych produktów: ", formatPretty(sum(quantity, na.rm=T))
      )
    )
               
})

## observing a click will return the `id` you assigned in the `layerId` argument
shiny::observeEvent(input$map_marker_click, {
  
  click <- input$map_marker_click
  
  ## filter the data and output into a table
  output$table <- DT::renderDT({
    shopssales <- shopssales[shopssales$id == click$id, ]
    
    shopssales %>% dplyr::group_by("Rok" = lubridate::year(date)) %>%
      dplyr::summarise("Ilość sprzedanych produktów" = formatPretty(sum(quantity, na.rm  = T)),
                       "Wartość sprzedanych produktów" = formatPretty(sum(sales, na.rm = T))
      )
    
  },
    rownames = FALSE,
    options = list(
     dom = 't',
     columnDefs = list(list(className = 'dt-center', targets = "_all"))
    )
  )
})

