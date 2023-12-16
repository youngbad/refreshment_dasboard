formatMoney  <- function(x, ...) {
  paste0("$", formatC(as.numeric(x), format="f", digits=2, big.mark=","))
}

formatPretty <- function(x, ...) {
  paste0(formatC(as.numeric(x), format="f", digits = 0, big.mark=","))
}

select_choice_img <- function(img, text) {
  shiny::HTML(paste(
    tags$img(src=img, width=30, height=22),
    text
  ))
}

radioImages <- function(inputId, images, values){
  radios <- lapply(
    seq_along(images),
    function(i) {
      id <- paste0(inputId, i)
      tagList(
        tags$input(
          type = "radio",
          name = inputId,
          id = id,
          class = "input-hidden",
          value = as.character(values[i])
        ),
        tags$label(
          `for` = id,
          tags$img(
            src = images[i]
          )
        )
      )
    }
  )
  do.call(
    function(...) div(..., class = "shiny-input-radiogroup", id = inputId), 
    radios
  )
}
