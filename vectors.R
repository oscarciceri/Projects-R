#Create vectors

name <- c("name1", "name2", "name3")
score <- c(3.5, 7.2, 8)
winner <- c(TRUE, FALSE, FALSE)


#Operations
score <- score*2
score


myscore  <- c(1, 1, 2)
diff <- score - myscore
diff


#Size of a vector
length(myscore)

#Mean
mean(myscore)

#Select elements
name[2]

name[c(1,3)]


#Select low scores
lowScores <- myscore<1.5
lowScores


#Show name of movies with low scores
name[lowScores]
