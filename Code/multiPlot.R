# Template for ggplot2
#ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) + <GEOM_FUNCTION>()

library(ggplot2)

data('iris')
head(iris)

ggplot(data = iris,
       mapping = aes(x = Sepal.Length,
                     y = Sepal.Width,
                     color = Species)) +
  geom_point() +
  geom_smooth(method = 'lm')


#Example 2
aux <- iris$Species ==  'setosa'
len <- sum(aux, na.rm = TRUE)
len
ggplot(data = iris[iris$Species == 'setosa',],
       mapping = aes(x = 1:len,
                     y = Petal.Width)) +
         geom_line()
       
ggplot(data = iris,
       mapping = aes(x = rep(1:len,3),
                     y = Petal.Width,
                     color = Species)) +
  geom_line()


#Example Boxplot
ggplot(data = iris,
       mapping = aes(x = Species,
                     y = Petal.Width,
                     fill = Species)) +
  geom_boxplot() +
  geom_jitter()
