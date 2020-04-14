
#This code is to visualize associate COVID-19 cases in Mexico by sex & age (5-years groups) (April 4th, 2020)
#Source SSA: https://www.gob.mx/salud/documentos/datos-abiertos-152127 (04/14/2020)


library(reshape2)
library(ggplot2)

pob<-read.csv("pyr.csv")

etiquetas<-c("0",
             "1-4",
             "5-9",
             "10-14",
             "15-19",
             "20-24",
             "25-29",
             "30-34",
             "35-39",
             "40-44",
             "45-49",
             "50-54",
             "55-59",
             "60-64",
             "65-69",
             "70-74",
             "75-79",
             "80-84",
             "85-89",
             "90-94",
             "95-99",
             "100 y más")

df.melt <- melt(pob, value.name='Población', variable.name = 'Género', id.vars='Edad' )

pyramidGH2 <- ggplot(df.melt, aes(x = Edad, y = Población, fill = Género)) + 
  geom_bar(data = subset(df.melt, Género == "Mujeres"), stat = "identity") +
  geom_bar(data = subset(df.melt, Género == "Hombres"), stat = "identity") + 
  scale_y_continuous(breaks = seq(-7, 7, 1), labels = paste0(as.character(c(7:0, 1:7)), "%"))+
  scale_x_discrete(limit=etiquetas)+
  labs(title="Distribución por edad y sexo de casos asociados a COVID19 en México, 13 de abrirl de 2020")+
  coord_flip() 

pyramidGH2





