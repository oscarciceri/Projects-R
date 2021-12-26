data("mtcars")

#First histogram
hist(mtcars$hp)

#Second histogram
hist(mtcars$hp,
     #breaks = 20,
     breaks = seq(50, 350, 50),
     col = 'green',
     border = 'gray10',
     main = 'title of the histogram',
     xlab = 'Range of values')


library(ggplot2)
#histogram with ggplot
ggplot(data = mtcars,
       mapping = aes(x = hp)) +
  geom_histogram(bins = 10)

#histogram with ggplot
ggplot(data = mtcars,
       mapping = aes(x = hp,
                     fill =factor(vs))) +
  geom_histogram(bins = 11, 
                 position = 'identity',
                 alpha = 0.5) +
  labs(title = 'titulo',
       fill = 'vs_motor',
       x = 'HP [unit]',
       y = 'frecuency',
       subtitle = 'subtitutlo',
       caption = 'this is the caption')

