
library(shiny)

db = dbConnect(SQLite(), dbname = "Savant_PitchMix_2019.sqlite")

dbWriteTable(conn = db, name = "PitchMix2019", Savant_PitchMix_2019, 
             overwrite = T, row.names = F)

sc = dbGetQuery(conn = db, statement = "SELECT * FROM PitchMix2019")


ui <- fluidPage(

   
    titlePanel("Pitch Mixes w/ 2019 Baseball Savant Data"),

     
    sidebarLayout(
        sidebarPanel(
            selectInput("Name", "Select Pitcher", 
                        choices = unique(Savant_PitchMix_2019$player_name))
        ),

        
        mainPanel(
           tableOutput("table")
        )
    )
)


server <- function(input, output) {
    
    sc_reactive <- reactive({
        sc %>% dplyr::filter(player_name == input$Name)
    })

    output$table <- renderTable({
        sc_reactive()
        
    })
}


shinyApp(ui = ui, server = server)
