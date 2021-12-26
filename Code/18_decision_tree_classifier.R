library(tidyverse)
library(titanic)
data('titanic_train')


library(rpart)
library(rpart.plot)
library(rattle)

#Model
arbol <- rpart(
  formula = Survived ~ Sex +Age,
  data = titanic_train,
  method = 'class'
)

#Plot the tree
fancyRpartPlot(arbol)

#Prediction
pred_titanic <- predict(arbol, type = 'class')
titanic_pre <-  cbind(titanic_train, 
                      pred_titanic)


#example
predict(object = arbol,
        newdata = data.frame(Age = 4, Sex ='male'),
        type = 'class')
