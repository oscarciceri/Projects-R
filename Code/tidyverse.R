# load the pk with the data 
library(gapminder)
data(gapminder)

library(tidyverse)


#dplyr functions
# - mutate() : create new variables
# - select() : select a variable with the name
# - filter() : select variables with condition
# - summarise() : reduce many values in a resume
# - arrange() :  change the data order
# - group_by : group operations


#Filter data per country
filter(gapminder, country == 'Mexico')

#Filter data per country with %>% (ctrl + shitf + m)
gapminder %>% 
  filter(country == 'Mexico')

gapminder %>% 
  filter(year == '2002')

#Filter with life expected < 40 and year 2002
gapminder %>% 
  filter(year == '2002', lifeExp<=45)


#Summary data
gapminder %>% 
  summarise(max_lifeExp = max(lifeExp))

gapminder %>% 
  summarise(mean_lifeExp = mean(lifeExp))

#Group life exp per year
gapminder %>% 
  group_by(year) %>% 
  summarise(prom_life = mean(lifeExp))
  
  
  
  
  
  
  


