Savant_PitchMix_2019 <- Savant_PitchMix %>%
    mutate(player_name = paste(first_name, last_name, sep = " ")) %>%
    arrange(player_name) %>%
    rename(PercentThrown = n_ff_formatted,
           FF_Velo = ff_avg_speed,
           FF_Spin_Rate = ff_avg_spin,
           FF_Horiz_Break = ff_avg_break_x, 
           FF_Vert_Break = ff_avg_break_z,
           First_Name = first_name,
           Last_Name = last_name,
           Year = year)


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
