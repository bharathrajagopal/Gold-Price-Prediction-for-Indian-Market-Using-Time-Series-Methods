install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("forecast")

#Loading the libraries required for Holt Winters
library(readr)
library(dplyr)
library(ggplot2)
library(forecast)


goldindia3 <- read.csv(file.choose())
str(goldindia3)
head(goldindia3)



#options(repr.plot.width = 6, repr.plot.height = 3)
#ggplot(goldindia3, aes(x = Date , y = Indian.rupee )) + geom_line() + geom_smooth(method = 'lm') +labs(x = "Date", y = "Indian Rupee")
#ggplot(goldindia3)


# converting our  data to a time series object
month3=goldindia3$Date
Amount3=goldindia3$Indian.rupee
goldindia3ts <- ts(Amount3,frequency=365) 
class(goldindia3ts)

# convert our sales data to a time series object
#goldindia3ts <- ts(goldindia3$Date, frequency = 12, start = c(2013,1))
#class(goldindia3ts)






goldindia3Decomp <- decompose(goldindia3ts)
plot(goldindia3Decomp)

# log transform time series data
goldindia3Log <- log(goldindia3ts)

goldindia3LogHW <- HoltWinters(goldindia3Log)
goldindia3LogHW




#plotting the Holt Winters over Time series data
plot(goldindia3LogHW)


# forecast next 12 month's data
nextYeargoldindia3 <- forecast(goldindia3LogHW, h=365)

# ploting the forecasted data
plot(nextYeargoldindia3)
nextYeargoldindia3

#Finding the accuracy of the model
accuracy(nextYeargoldindia3)
  

