server <- function(input, output) {
  

Sys.setlocale("LC_ALL", "C")
  
  output$ncplot <- renderPlot({

    x<-aggregate(df$zscore, list("anno"=df$anno,"mp"=df$mp), mean)
    x$anno<-factor(x$anno)
    names(x)[3]<-"zscore"

    ggplot(x[x$mp==input$mp,], aes(anno,zscore, group=1))+
    geom_point(fill='steelblue')+scale_y_continuous(breaks = c(-3,-2,-1,0,1,2,3))+
    geom_line(linetype=1,size=0.2)+ggtitle(input$mp)+
      theme(text = element_text(size=20))+
      geom_hline(yintercept=c(-3,-2,0,2,3), col='red', size=0.1)

  })
  
  
}
