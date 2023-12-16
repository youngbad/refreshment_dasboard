# color statuses
statusColors <- c(
  "gray-dark",
  "gray",
  "secondary",
  "navy",
  "indigo",
  "purple",
  "primary",
  "lightblue",
  "info",
  "success",
  "olive",
  "teal",
  "lime",
  "warning",
  "orange",
  "danger",
  "fuchsia",
  "maroon",
  "pink",
  "white"
)

# toast options (notification)
toastOpts <- list(
  autohide = TRUE,
  icon = "fas fa-home",
  close = FALSE,
  position = "bottomRight"
)

css <- HTML(
  ".input-hidden {",
  "  position: absolute;",
  "  left: -9999px;",
  "}",
  "input[type=radio] + label>img {",
  "  width: 50px;",
  "  height: 50px;",
  "  transition: 500ms all;",
  "}",
  "input[type=radio]:checked + label>img {",
  "  border: 1px solid #fff;",
  "  box-shadow: 0 0 3px 3px #b0cbf5;",
  "}",
  "input[type=radio]:hover + label>img {",
  "  box-shadow: 0 0 3px 3px black;",
  "  transform: scale(1.2);",
  "}"
)