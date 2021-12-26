#Matrix

#Create vectors
fox <- c(13,23,33,43,53,63,73,83,93)
warner <- c(11,21,31,41,51,61,71,81,91)
disney <-    c(12,22,32,42,52,62,72,82,92)

#create matrix
films <- matrix(c(warner,disney,fox), nrow = 9, ncol = 3)

#Aggregate name to the columns
colnames(films) <- c('warner', 'disney', 'fox')


#Aggregate name to the row
rownames(films) <- seq(2011, 2019, by=1)
films

#Decrease 5 in all elements (NOTE: ITS NOT SAVED)
films-5

#Multiple (NOTE: ITS NOT SAVED)
films*3*films/5 - films 

#Select elements of a matrix
films[1,1]

films['2011', 'warner']


films[c(1,3), c(2,3)]

films[c(5,1), c(1,3)]

films[c(1,5,6,8), c('warner', 'disney')]

films[2,]
films['2012',]



films[,1]
films[,"warner"]
