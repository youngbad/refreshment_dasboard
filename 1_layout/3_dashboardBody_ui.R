# ---- Home Tab ui
source("2_content/1_hometab/1_hometab_ui.R")
source("2_content/2_shops/1_shopstab_map_ui.R")
source("2_content/2_shops/3_shopstab_charts_ui.R")
source("2_content/3_products/1_product_analysis_ui.R")

body <- bs4Dash::dashboardBody(
  tags$style(css),
  bs4Dash::tabItems(
    hometab,
    shopstabmap,
    shopstabcharts,
    productsales
  )
)