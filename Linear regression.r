install.packages("tidyverse")
install.packages("ggpubr")
install.packages("forecast")

library(tidyverse)
library(ggpubr)
library(forecast)


goldindia4 <- read.csv(file.choose())
str(goldindia4)
head(goldindia4)

ggplot(goldindia4, aes(x = Date, y = Indian.rupee )) +
  geom_point() +
  stat_smooth()

cor(goldindia4$Date, goldindia4$Indian.rupee)
##correlation coefficient 0.8652554

goldmodel <- lm(Indian.rupee ~ Date, data = goldindia4)
goldmodel

## 
## Coefficients:
## (Intercept)      Indian.rupee  
##      -6077.0385       0.1925

ggplot(goldmodel, aes(Date, Indian.rupee)) +
  geom_point() +
  stat_smooth(method = lm)

summary(goldmodel)














