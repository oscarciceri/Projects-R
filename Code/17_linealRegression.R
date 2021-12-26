#For predictions
# All family of regression (lineal, multi lineal, non-lineal)


#For classification
# regression logistic
# Deposition tree, KNN, Bayes

#For clustering
# k-medias o k-means, hierarchical

#Example of predictions
#Question: what is the size of 800 days after sown?

#a*day + b : linear regression 
# a = slop
# b = constant

library(tidyverse)
data("Orange")



#Optimal value for a and b
lm(circumference ~ age, data = Orange)


Orange %>% 
  ggplot(aes(x = age,
             y = circumference,
             color = Tree)) +
  geom_point(size = 2) + 
  geom_abline(intercept = 0,
              slope = 0.1,
              col = 'orange') +
  geom_abline(intercept = 17.339,
              slope = 0.1068,
              col = 'blue') + 
  geom_vline(xintercept =  800,
             col = 'red')

rta = 17.339 + 800*0.1068
rta
