# Data
year <- seq(2010, 2018, by=1)
disney <- c(11, 13, 11, 8, 12, 11, 12, 8, 10)


plot(year, disney)

plot(x = year,
     y = disney,
     main = 'Title movies',
     xlab =  'Disney',
     ylab =  'Years',
     col =   'cornflowerblue',
     pch = 16,
     panel.first = grid())

barplot(disney,
        main = "Score Disney",
        xlab = "Score",
        ylab = "Years",
        names.arg = year,
        col = "darkred",
        horiz = TRUE)

hist(disney)


total <- sum(disney)
percentage <- disney/total
percentage
percentage <- round(percentage, 3)
percentage

pie(percentage,
    labels = percentage,
    col = rainbow(9),
    cex = 0.9)


library(ggplot2)

# create the data frame
movies <- data.frame(year, disney)

ggplot(data = movies,
       mapping = aes(x = year,
                     y = disney)) +
  geom_point() +
  labs(title = 'disney')


