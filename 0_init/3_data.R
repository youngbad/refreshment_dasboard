#### Extract data ####
shops <- readRDS("data/shops.RDS")
sales <- readRDS("data/sales.RDS")
population <- readRDS("data/population.RDS")


#### Transform data ####
sales$date <- sales$date %>% as.Date()

shopssales <- dplyr::left_join(x = sales, y = shops, by = 'shop') %>%
  dplyr::select(shop, brand, date, quantity, sales, long, lat, city, shop_name) %>%
  dplyr::mutate(id = as.numeric(stri_extract(shop, regex = "\\d+")))

containers <- tibble::tibble(container_type = unique(sales$container))
containers$img = c(
  paste0('<img src="images/bottle-soda.jpeg" width="30" height="22"/>', containers$container_type[1]),
  paste0('<img src="images/plastic-bottle.png" width="30" height="22"/>', containers$container_type[2]),
  paste0('<img src="images/can.jpeg" width="30" height="22"/>', containers$container_type[3])
  )


x <- shopssales %>% 
  group_by(shop_name) %>%
  summarise(sales = sum(sales), quantity = sum(quantity))
