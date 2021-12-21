library(readr)

file.choose()

pwd_csv = "C:\\Users\\oscar\\Documents\\Git\\Rprojects\\data_csv\\gapminder.csv"
#import
gadminder <- read_csv(pwd_csv,
                      show_col_types = FALSE)

pwd_csv_nontitle <- "C:\\Users\\oscar\\Documents\\Git\\Rprojects\\data_csv\\gapminder_col_names.csv"
#import csv without title
name_columns <- c('country', 'year', 'live', 'population')

gadminder_nontitle <- read_csv(pwd_csv_nontitle,
                               col_names = name_columns,
                               show_col_types = FALSE)

pwd_csv_semicolon <- "C:\\Users\\oscar\\Documents\\Git\\Rprojects\\data_csv\\gapminder_puntoycoma.csv"
gadminder_semicolon <- read_csv2(pwd_csv_semicolon,
                      show_col_types = FALSE)
