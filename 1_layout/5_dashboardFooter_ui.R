footer <- bs4Dash::dashboardFooter(
  fixed = TRUE,
  left = a(
    href = "https://www.linkedin.com/in/jakub-badowski-957470173/",
    target = "_blank", "@Jakub Badowski"
  ),
  right = year(Sys.Date())
)