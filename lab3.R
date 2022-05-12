
# importing data also taking care of nas
dataset = read.csv('lab3_flat_file.csv')
dataset <- dataset[-c(11), ]
head(dataset)
dataset$height_in[which(is.na(dataset$height_in))] <- mean(dataset$height_in, na.rm = TRUE)
#install.packages("dplyr")
#install.packages("tidyverse")
install.packages("caret")
#load dplyr
library(dplyr)
library(caret)

# I have never tried to use mode on nominal or ordinal data without endcoing it
dataset$gender <- factor(dataset$gender, level = c("female", "male"), labels =c(1,2))
dataset$hair_color <- factor(dataset$hair_color, level = c("brown", "blond", "red"), labels =c(1,2,3))
dataset$eye_color <- factor(dataset$eye_color, level = c("brown", "green", "blue"), labels =c(1,2,3))
head(dataset)

# males
# go back into excel and change 1 obs. to male not Male
male = filter(dataset, gender == "male") 
mean(male$height_in)

# female
female = filter(dataset, gender == "female") 
mean(female$height_in)

# summary of data
mean(dataset$height_in)
sum(dataset$height_in)
summary(dataset)
count_gender <- table(dataset$gender)
count_hair <- table(dataset$hair_color)
count_eye  <- table(dataset$eye_color)

##    part 2 quantmod

#install.packages("quantmod")
library("quantmod")

# apple stock AAPL
getSymbols("AAPL", src = "yahoo")
addMACD()
addBBands()
# boeing stock BA
getSymbols("BA", src = "yahoo")
# nvida stock
getSymbols("NVDA", src = "yahoo")
# AMD stock
getSymbols("AMD", src = "yahoo")
# intel stock
getSymbols("INTC", src = "yahoo")

# apple stock AAPL
getSymbols("AAPL", src = "yahoo")
#   use chart series
addMACD()
addBBands()

mean_apple <- mean(AAPL$AAPL.Close)
mean_amd <- mean(AMD$AMD.Close)
mean_ba <- mean(BA$BA.Close)
mean_intc <- mean(INTC$INTC.Close)
df2 <- data.frame(mean_apple, mean_amd, mean_ba, mean_intc)
# you need this make the df a matrix before you can plot the data
df2 = as.matrix(df2)
merge(mean_apple, mean_amd, mean_ba, mean_intc, all = TRUE)

barplot(df2, main = "Mean Closing Price", 
        xlab = "Stock Ticker", ylab = "Price in USD", las = 1)
help(barplot)



