output$user <- bs4Dash::renderUser({
  bs4Dash::dashboardUser(
    name = "Divad Nojnarg",
    image = "https://adminlte.io/themes/AdminLTE/dist/img/user2-160x160.jpg",
    title = "shinydashboardPlus",
    subtitle = "Author",
    footer = p("The footer", class = "text-center"),
    shiny::fluidRow(
      bs4Dash::dashboardUserItem(
        width = 6,
        "Item 1"
      ),
      bs4Dash::dashboardUserItem(
        width = 6,
        "Item 2"
      )
    )
  )
})