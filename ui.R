source("1_layout/1_dashboardHeader_ui.R")
source("1_layout/2_dashboardSidebar_ui.R")
source("1_layout/3_dashboardBody_ui.R")
source("1_layout/4_dashboardControlbar_ui.R")
source("1_layout/5_dashboardFooter_ui.R")

dashboardPage(
  preloader = list(html = tagList(spin_1(), "Wczytywanie ..."), color = "#343a40"),
  dark = FALSE,
  help = FALSE,
  fullscreen = FALSE,
  scrollToTop = TRUE,
  title = "bs4Dash Showcase",
  header = header,
  sidebar = sidebar,
  body = body,
  footer = footer
)  