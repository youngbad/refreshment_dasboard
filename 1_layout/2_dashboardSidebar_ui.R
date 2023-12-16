sidebar <- bs4Dash::dashboardSidebar(
  fixed = TRUE,
  skin = "light",
  status = "primary",
  id = "sidebar",
  bs4Dash::sidebarUserPanel(
    image = "https://adminlte.io/themes/v3/dist/img/AdminLTELogo.png",
    name = "Welcome Onboard!"
  ),
  bs4Dash::sidebarMenu(
    id = "current_tab",
    flat = FALSE,
    compact = FALSE,
    childIndent = TRUE,
    bs4Dash::sidebarHeader("Cards"),
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
    )
  )
)