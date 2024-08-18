sidebar <- bs4Dash::dashboardSidebar(
  fixed = TRUE,
  skin = "light",
  status = "primary",
  id = "sidebar",
  bs4Dash::sidebarMenu(
    id = "current_tab",
    flat = T,
    compact = T,
    childIndent = TRUE,
    bs4Dash::sidebarHeader("Menu"),
    bs4Dash::menuItem(
      "Home Tab",
      tabName = "home",
      icon = icon("sliders")
    ),
    bs4Dash::menuItem(
      "Shops",
      tabName = "shops",
      icon = icon("shop"),
      bs4Dash::menuSubItem(
        "Shops map",
        tabName = "shops_map",
        icon = icon("map-location")
      ),
      bs4Dash::menuSubItem(
        "Shop sales",
        tabName = "shops_charts",
        icon = icon("store")
      )
    ),
    bs4Dash::menuItem(
      "Products",
      tabName = "products",
      icon = icon("bottle-water"),
      bs4Dash::menuSubItem(
        "Product sale",
        tabName = "product_sales",
        icon = icon("money-bill-trend-up")
      ),
      bs4Dash::menuSubItem(
        "Brands",
        tabName = "product_sales_by_brand",
        icon = icon("bottle-water")
      )
    ),
    bs4Dash::menuItem(
      "Prediction [TBA]",
      icon = icon("chart-area")
    ),
    bs4Dash::menuItem(
      "Managment [TBA]",
      tabName = "management",
      icon = icon("sliders"),
      bs4Dash::menuSubItem(
        "Produkty",
        tabName = "management_products"
      ),
      bs4Dash::menuSubItem(
        "Sklepy",
        tabName = "management_shops"
      ),
      bs4Dash::menuSubItem(
        "Inne",
        tabName = "management_other"
      )
    )
  )
)