header <- bs4Dash::dashboardHeader(
  title = bs4Dash::dashboardBrand(
    title = sprintf("bs4Dash v%s", as.character(utils::packageVersion("bs4Dash"))),
    color = "primary",
    href = "https://divadnojnarg.github.io/outstanding-shiny-ui/",
    image = "https://adminlte.io/themes/v3/dist/img/user2-160x160.jpg",
    opacity = 0.8
  ),
  fixed = TRUE,
  rightUi = shiny::tagList(
    bs4Dash::userOutput("user")
  ),
  leftUi = shiny::tagList(
    
  )
)