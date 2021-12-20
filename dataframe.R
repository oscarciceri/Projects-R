#Data frame

name <- c("name1", "name2", "name3")
score <- c(3.5, 9.2, 8)
winner <- c(TRUE, FALSE, FALSE)

#Vector require to have the same size
films_df <- data.frame(name, score, winner)
films_df


#change the name of the columns 
names(films_df) <- c("Name", "Score", "Winner")
films_df


#Select element 
films_df[1,1]
films_df[1,"Score"]


#Select more than one element
films_df[c(1,2), c(2,3)]
films_df[c(1,2,3), c('Score', 'Winner')]

#select row our column
films_df[3,]
films_df[,3]
films_df$Name

#Sort the data frame
indexs <- order(films_df$Score, decreasing = FALSE)
indexs

films_df[indexs, ]


#Save a new data frame
films_df_sort <-films_df[indexs, ]

