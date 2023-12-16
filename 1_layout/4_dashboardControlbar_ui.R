# controlbar <- dashboardControlbar(
#   id = "controlbar",
#   skin = "light",
#   pinned = TRUE,
#   overlay = FALSE,
#   controlbarMenu(
#     id = "controlbarMenu",
#     type = "pills",
#     controlbarItem(
#       "Inputs",
#       column(
#         width = 12,
#         align = "center",
#         radioButtons(
#           inputId = "dist",
#           label = "Distribution type:",
#           c(
#             "Normal" = "norm",
#             "Uniform" = "unif",
#             "Log-normal" = "lnorm",
#             "Exponential" = "exp"
#           )
#         )
#       )
#     ),
#     controlbarItem(
#       "Skin",
#       skinSelector()
#     )
#   )
# )