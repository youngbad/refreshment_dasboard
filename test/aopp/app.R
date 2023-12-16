library(shiny)

ui <- fluidPage(
  
  tags$style("#shiny-notification-showme_notif {margin:20px;}"),
  
  actionButton("showme", "Show Notification:")
  
)

server <- function(input, output, session) {
  
  observe({
    
    showNotification(
      id = "welcome_notif",
      "Blablablablabla .... blablablabla.",
      duration = 200, 
      closeButton = TRUE,
      type = "message")
    
  })
  
  observeEvent(input$showme,{
    
    showNotification( 
      id = "showme_notif",
      "Hihihi", # put text in notification
      duration = 300, 
      closeButton = TRUE,
      type = "message")
    
  })
  
}

shinyApp(ui = ui, server = server)