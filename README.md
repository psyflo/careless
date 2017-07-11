# careless
An R package for investigation of different carelessness measures in survey data.

-- still in development -- 

Install with the following commands: 
```{r}
install.packages("devtools")
devtools::install_github("psyflo/careless")
```
Load the package and use its functions:
```{r}
library(careless)
result <- individualReliability(data=mydata, subscales=c("EX","OP"), n.iter=1000)
summary(result)
```
