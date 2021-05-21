server <- function(input, output) {
  
  Sys.setlocale("LC_ALL", "C")
  output$ncplot <- renderPlot({
    
    dati() %>% 
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