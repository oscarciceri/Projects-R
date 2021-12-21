data("mtcars")

#First histogram
hist(mtcars$hp)

#Second histogram
hist(mtcars$hp,
     #breaks = 20,
     breaks = seq(50, 350, 50),
     col = 'darkgray',
     border = 'gray10',
     main = 'title of the histogram',
     xlab = 'Range of values')

#histogram with ggplot
ggplot(data = mtcars,
       mapping = aes(x = hp)) +
  geom_histogram(bins = 9)

#histogram with ggplot
ggplot(data = mtcars,
       mapping = aes(x = hp,
                     fill =factor(vs))) +
  geom_histogram(bins = 9, 
                 position = 'identity',
                 alpha = 0.8) +
  labs(title = 'titulo',
       fill = 'vs_motor',
       x = 'HP [unit]',
       y = 'frecuency',
       subtitle = 'sub',
       caption = 'this is the caption')
