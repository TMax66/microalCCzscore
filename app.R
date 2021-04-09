  
library("shiny")
library("tidyverse")
library("readxl")
library("hrbrthemes")

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
                              "MP 02/073", "MP 02/254"),
                  selected = ""),
      ),
    mainPanel("",
              fluidRow(
                            plotOutput("ncplot")
                )
              ))
  )


# Define server logic required to draw a histogram
server <- function(input, output) {
  

  
  
  library(ggplot2)
  Sys.setlocale("LC_ALL", "C")
  output$ncplot <- renderPlot({
    df <- read_excel("dati.xlsx", col_types = c("text", 
                                                "text", "text", "numeric", "text", "text", 
                                                "text", "text", "text", "numeric", "text", 
                                                "text", "text", "text"))
    df %>% 
      mutate(mp = substr(mp, 1,9)) %>% 
      filter(sede == input$s) %>%
      group_by(anno, mp) %>% 
      summarise(zscore= mean(zscore, na.rm= TRUE)) %>% 
      filter(mp == input$mp)  %>% 
      mutate(anno = factor(anno)) %>% 
    ggplot(aes(anno,zscore, group=1))+geom_point()+
      scale_y_continuous(breaks = c(-3,-2,-1,0,1,2,3))+
      geom_line(linetype=1,size=0.2)+ggtitle(input$mp)+
      geom_hline(yintercept=c(-3,-2,-1,0,1,2,3), col='red', size=0.2, alpha=0.6)+
      theme_ipsum_rc()
   
    })
 }

# Run the application 
shinyApp(ui = ui, server = server)


#
