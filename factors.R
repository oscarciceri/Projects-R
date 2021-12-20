#Factors are structure for categorized variable

#Categorized variable: data that have a finite number of values

sizes <- c('M', 'l', 'xl',  'm',  'm', 'M', 'xs', 's', 's')

#create the factor 
f_sizes <- factor(sizes)

#Plot factor
plot(f_sizes)

#Code the levels 
levels(f_sizes)

#Clean the data to have only Uppercase
f_sizes_clean <- factor(sizes,
                        ordered = TRUE,
                        levels = c("xs", "s", "m", "l", "xl", "M"),
                        labels = c("XS", "S", "M", "L", "XL", "M"))
plot(f_sizes_clean)

