data("mtcars")


barplot(mtcars$cyl)

#Group the data
table(mtcars$cyl)


barplot(table(mtcars$cyl))


barplot(table(mtcars$cyl),
        col = 'green',
        main = "Bar Title",
        border = 'red',
        xlab = "Quantity",
        ylab = "cyl",
        horiz = TRUE)

library(ggplot2)

ggplot(data = mtcars,
       mapping = aes(x = factor(cyl))) +
  geom_bar() +
  coord_flip()

p <- ggplot(data = mtcars,
       mapping = aes(x = factor(cyl),
  fill = factor(gear)))

#stacked bar chart
p + geom_bar(position = 'stack', stat = 'count')

#doge bar chart
p + geom_bar(position = 'dodge') + 
  ylim(0, 14) +
  scale_y_continuous(breaks = seq(0, 14, by = 2))

#stacked bar chart + percent bar chart
p + geom_bar(position = 'fill', stat = 'count')
