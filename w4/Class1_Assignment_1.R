#Assignment1
#Naphat Phoruang 6787021
#Natsaran Pommachot 6787029
#Priyapat Ruksanaves 6787108
setwd("C:/Users/guide/Desktop/Work Dst/Stat/w4")

#1 Load file
comp <- read.csv("compensation.csv", header = 1)
str(comp)
library(dplyr)

#2 Structure of database
glimpse(comp) 

#3 Replace NA with 0 and find Root's col mean
comp$Root[is.na(comp$Root)] <- 0 #replace with 0
mean(comp$Root) #find mean


#4
lo_hi_fruit <-filter(comp, Fruit > 80 | Fruit < 20)

#5
compensation_trans <- mutate(comp, sqrt_fruit = sqrt(Fruit))
head(compensation_trans, 15)

#6
arrange(compensation_trans, desc(sqrt_fruit))

#7
#no pipe
filtered_data1 <- arrange(filter(compensation_trans, Fruit > 50), Fruit)
filtered_data1

#pipe
filtered_data2 <- compensation_trans %>%
  filter(Fruit > 50) %>%
  arrange(Fruit)

filtered_data2



