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
      "Strona Główna",
      tabName = "home",
      icon = icon("sliders")
    ),
    bs4Dash::menuItem(
      "Sklepy",
      tabName = "shops",
      icon = icon("shop"),
      bs4Dash::menuSubItem(
        "Mapa sklepów",
        tabName = "shops_map",
        icon = icon("map-location")
      ),
      bs4Dash::menuSubItem(
        "Analiza sklepów",
        tabName = "shops_charts",
        icon = icon("store")
      )
    ),
    bs4Dash::menuItem(
      "Produkty",
      tabName = "products",
      icon = icon("bottle-water"),
      bs4Dash::menuSubItem(
        "Analiza sprzedazy produktów",
        tabName = "product_sales",
        icon = icon("money-bill-trend-up")
      )
    ),
    bs4Dash::menuItem(
      "Predykcja",
      icon = icon("chart-area")
    ),
    bs4Dash::menuItem(
      "Zarządzanie",
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