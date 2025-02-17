#Assignment1
#Naphat Phoruang 6787021
#Natsaran Pommachot 6787029
#Priyapat Ruksanaves 6787108

setwd("C:/Users/guide/Desktop/Work Dst/Stat/w4")

2+3 #Addition
10-4 #Subtraction
5 * 6 #Multiplication
10 / 2 #Division
log(10) #Natural logarithm(base e)
log10(10) #Logarithm (base 10)

#Vector - 1 มิติ
vec0 <- vector(mode = "numeric", length =10) #create a vector filled with 0
vec0 #Print vec0

vec1 <- c(1:10,15,20)  #create a vector filled with 1-10 ,15,20
vec1 #Print vec1
length(vec1) #Find Length of vec1
mean(vec1) #Find mean of vec1
summary(vec1) #Summary of vec1 (min max q1 q2 q3)


#Matrix

mat <- matrix(nrow = 3, ncol = 4) #Create empty matrix
mat[2,4] <- 8 #set 8 in row 2 col 4
mat[1,] <- c(1:4) #ใส่เลข 1 2 3 4 ลงใน แถว 1 ทั้งหมด
mat[,3] <- c(5:7) #ใส่เลข 5 6 7 ลงใน คอลลัมน์ที่ 3 ทั้งหมด
mat[2,1:2] <- c(5,6) # Put 5,6 in rows 2 col 1 - 2

nrow(mat) #num of mat col
ncol(mat) #num of mat row
summary(mat) #summary of mat
rownames(mat) <- c("student1", "student2", "student3") #set rows name
colnames(mat) <- c("test1", "test2", "test3","test4") #set col name
mat


#array

arr <- array(dim = c(2, 3, 4))  # Create a 3D array
arr[1, 3, 2] <- 5 
arr

#csv

envi <- read.csv("environment.csv", header = 1) #Declare environment path
envi
#see Structure of csv
str(envi) #See head of table
envi$altitude.m  #access "altitude" col in csv 
head(envi, 10) #access head (first 10 row)


mean(envi$rainfall.m) # Calculate the mean of a column
is.na(envi$rainfall.m) # Check for missing values
which(is.na(envi$rainfall.m)) # Find indices of missing values
mean(envi$rainfall.m, na.rm = TRUE) # Mean excluding missing values

# Handle missing data
envi$rainfall.m[is.na(envi$rainfall.m)] <- 0 #Replace NA with 0
is.character(envi$site)
envi$site <- as.character(envi$site)
envi$site[1] <- "Site.A"
envi

install.packages("dplyr")
library(dplyr)

# Explore and select data
glimpse(envi)
select(envi, altitude.m)    # Select specific columns
select(envi, -altitude.m)   # Exclude specific columns
# Filter rows
slice(envi, 2)
slice(envi, 2:10) # row 2-10

filter(envi, temperature.C > 18) # Filter rows based on condition

filter(envi, temperature.C > 18 | temperature.C < 20) # Apply logical OR

# Add and arrange data
optimal_temp <- filter(envi, temperature.C > 18 | temperature.C < 20)
optimal_temp_log <- mutate(envi, logTemp = log(temperature.C))
arrange(optimal_temp_log, temperature.C) 

arrange(optimal_temp_log, desc(logTemp))


# Without pipe
filtered_data <- filter(optimal_temp_log, altitude.m > 100)
filtered_data

arranged_data <- arrange(filtered_data, desc(altitude.m))
arranged_data

# With pipe
arranged_data_1 <- optimal_temp_log %>%
  filter(altitude.m > 100) %>%
  arrange(desc(altitude.m)) #มากไปน้อย
arranged_data_1
