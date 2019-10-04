



ui <- fluidPage(
  titlePanel("Microbiologia Alimenti: Carte di controllo Proficiency Test"),
  
  sidebarLayout(
    sidebarPanel(
      helpText(""),
      
      selectInput("mp", 
                  label = "MMPP",
                  choices =  c(unique(as.character(df$mp))),
                  selected = "")
    ),
    
    mainPanel("",
              fluidRow(
                #splitLayout(style = "border: 1px solid silver:", cellWidths = c(300,300), 
                plotOutput("ncplot")
                
                
              )
              
              
    ))
  
  
  
  
)