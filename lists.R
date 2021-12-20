#The list allow to store data frames, vectors 
#and matrix on the same variable

#####################################

# Initial data
name <- c("Shrek", "Shrek 2", "Shrek 3", "Shrek 4")
name
score <- c(7.9, 7.2, 6.1, 6.3)
winner <- c(FALSE, FALSE, TRUE, TRUE)

# Score of films
warner <- c(20, 20, 16, 17, 17, 22, 17, 18, 19)
disney <- c(11, 13, 11, 8, 12, 11, 12, 8, 10)
fox <- c(18, 15, 15, 15, 16, 17, 15, 13, 11)

# Create different structures for the data
vector_titulos <- name
matriz_peliculas <- matrix(c(warner, disney, fox),
                           nrow = 9,
                           ncol = 3)

colnames(matriz_peliculas) <- c('warner', 'disney', 'fox')

peliculas_df <- data.frame(name,
                           score,
                           winner)

####################################
# Practice 1: Create a list in R #
####################################

# Create list
lista_films <- list(vector_titulos, 
                    matriz_peliculas)
# Show list
lista_films

# Change the id of the elements
names(lista_films) <- c("vectorx", "matrix")
lista_films

#To select element in the list [[]]
lista_films[['vectorx']]

lista_films[['vectorx']][3]

lista_films[['matrix']][3,]

#Add element to the list

lista_films[['NewPart']] <- seq(1,10, by=1)
lista_films

lista_films[['dataframe']] <- peliculas_df
lista_films


#Remove element to the list
lista_films[['NewPart']] <- NULL
lista_films


