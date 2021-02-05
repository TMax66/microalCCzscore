  
library(shiny)


ui <- fluidPage(
  titlePanel("Microbiologia Alimenti: Carte di controllo Proficiency Test"),
  
  sidebarLayout(
    sidebarPanel(
      helpText(""),
      
      selectInput("mp", 
                  label = "MMPP",
                  choices = c( "MP 01/028", "MP 01/033", "MP 01/043", "MP 01/054",
                               "MP 01/089", "MP 01/092", "MP 01/093", "MP 01/101", "MP 01/102",
                               "MP 01/110", "MP 01/111", "MP 01/112", "MP 01/142", "MP 01/144",
                              "MP 01/145", "MP 01/171","MP 01/194", "MP 02/073", "MP 02/254"),
                  
                  
                  selected = "")
      ),
    
    mainPanel("",
              fluidRow(
                #splitLayout(style = "border: 1px solid silver:", cellWidths = c(300,300), 
                            plotOutput("ncplot")
                            
                            
                )
                
                
              ))
    
    
    
    
  )


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  
  library(ggplot2)
  Sys.setlocale("LC_ALL", "C")
  output$ncplot <- renderPlot({
    df<- dati <- read.delim("dati.csv")
    x<-aggregate(df$zscore, list("anno"=df$anno,"mp"=df$mp), mean)
    x$anno<-factor(x$anno)
    names(x)[3]<-"zscore"
    
    ggplot(x[x$mp==input$mp,], aes(anno,zscore, group=1))+geom_point(fill='steelblue')+
      scale_y_continuous(breaks = c(-3,-2,-1,0,1,2,3))+
      geom_line(linetype=1,size=0.2)+ggtitle(input$mp)+
      geom_hline(yintercept=c(-3,-2,0,2,3), col='red', size=0.1)
    })
  
  
 }

# Run the application 
shinyApp(ui = ui, server = server)


#
