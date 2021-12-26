#Possible animations

#transitions()
#view()
#shadow()
#enter()/exit()
#ease_aes()

library(tidyverse)
library(gganimate)
library(gifski)
library(gapminder)

data('gapminder')


#Plot basic 
gapminder %>% 
  group_by(year, continent) %>% 
  summarise(mean_life = mean(lifeExp)) %>% 
  ggplot(aes(
    x = year,
    y = mean_life,
    color = continent
  )) + 
  geom_line()

#Animation
gapminder %>% 
  group_by(year, continent) %>% 
  summarise(mean_life = mean(lifeExp)) %>% 
  ggplot(aes(
    x = year,
    y = mean_life,
    color = continent
  )) + 
  geom_line() + 
  transition_reveal(year)

#Animation 2
gapminder %>% 
  group_by(year, continent) %>% 
  summarise(mean_life = mean(lifeExp)) %>% 
  ggplot(aes(
    x = year,
    y = mean_life,
    color = continent
  )) + 
  geom_line(size =2) +
  geom_point(size = 4) +
  labs(title = "LifeExp in {frame_along}",
       x = 'Years',
       y = 'Exp of life') + 
  theme_minimal() +
  transition_reveal(year)


