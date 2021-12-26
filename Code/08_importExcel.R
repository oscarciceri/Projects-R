library(readxl)


#Search the file
file.choose()

pwd <- "C:\\Users\\oscar\\Documents\\Git\\Rprojects\\data_xlsx\\data.xlsx"


#See the leaf excel
excel_sheets(pwd)

#Read Excel
# First Case
ideal_case <- read_excel(pwd)
class(ideal_case)

# Second Case
second_case <- read_excel(pwd, sheet = "Hoja2")

# Complex case
complex_case <- read_excel(pwd, 
                           sheet = "Hoja3",
                           range = 'C7:F17')
