function(input, output, session) {
  # user menu ---------------------------------------------------------------
  source("1_layout/6_dashboardHeader_server.R", local = TRUE)
  source("2_content/1_hometab/2_hometab_server.R", local = TRUE)
  source("2_content/2_shops/2_shopstab_map_server.R", local = TRUE)
  source("2_content/3_products/1_product_analysis_server.R", local = TRUE)
  source("2_content/3_products/2_product_by_brand_server.R", local = TRUE)
  
}
