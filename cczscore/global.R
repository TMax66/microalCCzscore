library(shiny)
library(ggplot2)
library(rsconnect)

Sys.setlocale("LC_ALL", "C")
df<-read.csv('dati.csv', sep=';', header=T, dec='.')
