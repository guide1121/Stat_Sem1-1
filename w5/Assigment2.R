#Assignment2
#Naphat Phoruang 6787021
#Natsaran Pommachot 6787029
#Priyapat Ruksanaves 6787108

#Import Library
library(dplyr)
library(ggplot2)

#set directory
setwd("C:/Users/guide/Desktop/Work Dst/Semester 2-2/Stat/w5")
otter <- read.csv("otter.csv")
head(otter)

#box-and-whisker plot
ggplot(otter,aes(x=animal ,y=body.temp, fill = animal ))+
  geom_boxplot()+ #Bloxplot
  xlab("Animal")+
  ylab("Body temperature (celcius)")+
  theme_bw() 

#1
ggplot(otter,aes(x=animal ,y=body.temp,fill = animal ))+
  geom_boxplot()+ #Bloxplot
  xlab("Animal")+
  ylab("Body temperature (celcius)")+
  theme_bw() 

#2
ggplot(otter,aes(x=animal ,y=body.temp,fill = active))+
  geom_boxplot()+ 
  geom_point(position = position_jitterdodge(jitter.width = 0.2, dodge.width = 0.7), alpha = 0.1)
  xlab("Animal")
  ylab("Body temperature (celcius)")+
  theme_bw() 
  
#3
ggplot(otter,aes(x=body.temp ,y=heart.rate,color= active))+
  geom_point(size = 0.2)+
  geom_smooth(method = "lm")+
  xlab("Body temperature (celcius)")+
  ylab("Heart rate (beats per minute)")+
  theme_bw() 
  


