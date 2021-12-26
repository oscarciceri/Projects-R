library(gapminder)
data(gapminder)

library(tidyverse)

#EDA exploratory data analysis
resumen <- as.data.frame.matrix(summary(gapminder))


hist(gapminder$lifeExp)

head(gapminder$lifeExp)

ggplot(data=gapminder, aes(lifeExp)) + 
  geom_histogram()


ggplot(data = gapminder,
       mapping = aes(x = continent,
                     y = lifeExp,
                     fill = continent)) +
  geom_boxplot() #+
  #geom_jitter()
 
  
ggplot(data = gapminder,
       mapping = aes(x = continent,
                     y = lifeExp,
                     fill = continent)) +
  geom_violin() 

data <- data.frame(gapminder$lifeExp, 
                  # gapminder$continent,
                   gapminder$gdpPercap)
pairs(data)  


