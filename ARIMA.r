install.packages("timeSeries")
install.packages("forecast")
install.packages("tseries")
install.packages("timeDate")

library(timeSeries)
library(forecast)
library(tseries)
library(timeDate)

## Reading the data 

goldindia <- read.csv(file.choose())
nrow(goldindia)

head(goldindia)


day<-goldindia$Date
amount<-goldindia$Indian.rupee

class(goldindia)

## convering data frame to time series
goldindiats <- ts(amount,frequency=365) 
class(goldindiats)

##plotting the time series
plot.ts(goldindiats)

## Decomposing seasonal data
goldindiaDecomp <- decompose(goldindiats)
plot(goldindiaDecomp)

## Splitting TS into Train and Testset
trainset<- goldindiats[1:6000]
testset<- goldindiats[6001:10420]

## FIting model ARIMA
mgoldindia <- auto.arima(trainset, seasonal = T)

summary(mgoldindia)


fcastgoldindia <- forecast(mgoldindia,h=4420)

forecast.a<- fcastgoldindia$mean
plot(fcastgoldindia, main='Forecast Seasonal',ylab="GoldPrice", xlab="Day/Year")

accuracy(fcastgoldindia)

#Changing test and train set


trainset1<- goldindiats[1:10000]
testset1<- goldindiats[10001:10420]

## FIting model ARIMA
mgoldindia1 <- auto.arima(trainset1, seasonal = T)

summary(mgoldindia1)


fcastgoldindia1 <- forecast(mgoldindia1,h=420)

forecast.a1<- fcastgoldindia1$mean
plot(fcastgoldindia1, main='Forecast Seasonal',ylab="GoldPrice", xlab="Day/Year")

accuracy(fcastgoldindia1)
