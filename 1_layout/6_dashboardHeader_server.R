output$user <- bs4Dash::renderUser({
  bs4Dash::dashboardUser(
    name = "User Name",
    image = "https://cdn-icons-png.flaticon.com/512/149/149071.png",
    title = "Test User",
    shiny::fluidRow(
      bs4Dash::dashboardUserItem(
        width = 4,
        "Ustawienia"
      ),
      bs4Dash::dashboardUserItem(
        width = 4,
        "Konto"
      ),
      bs4Dash::dashboardUserItem(
        width = 4,
        "Wyloguj"
      )
    )
  )
})