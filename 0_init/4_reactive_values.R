##### 4_reactive_values #####

#### data ####
data <- reactiveValues(
  sales = sales,
  #productsales = productsales,
  shops = shops,
  population = population,
  shopssales = shopssales
)

#### other
rv <- reactiveValues(
  month_names = c("Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień")
)