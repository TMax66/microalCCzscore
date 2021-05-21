ui <- fluidPage(
  titlePanel("Microbiologia Alimenti: Carte di controllo Proficiency Test"),
  
  
  sidebarLayout(
    sidebarPanel(
      helpText(""),
      
      selectInput("s", label="Sede", 
                  choices = c("Sede Territoriale di Bergamo", "Sede Territoriale di Sondrio", "Sede Territoriale di Binago"), selected= ""), 
      
      selectInput("mp",
                  label = "MMPP",
                  choices = c("MP 01/028", "MP 01/033", "MP 01/043", "MP 01/054", "MP 01/091", 
                              "MP 01/089", "MP 01/092", "MP 01/093", "MP 01/101", "MP 01/102",
                              "MP 01/110", "MP 01/111", "MP 01/112", "MP 01/122", "MP 01/138", 
                              "MP 01/142", "MP 01/144", "MP 01/145", "MP 01/146",  "MP 01/147", 
                              "MP 01/154", "MP 01/171", "MP 01/182", "MP 01/194", "MP 01/200", 
                              "MP 02/073", "MP 02/254", "MP 01/107"),
                  selected = ""),
      a(actionButton("Ins", "Inserimento nuovi dati",
                     class = "btn-primary",
                     icon("flask")),
        href="https://docs.google.com/spreadsheets/d/19pOyKa7_SYLWbYeuUI6GPjeHpvbXslXoEPE9ZEC0wRk/edit?usp=sharing")
      
      
    ),
    mainPanel("",
              fluidRow(
                plotOutput("ncplot")
              )
    ))
)
