# Running Code
library(tidyverse)

say_hi <- function() {print("Hi!")}

(random_number <- runif(1, min = 0, max = 1))

# Moving Around and Editing
text <- "This is a text String"

file_path <- ""

c("item1", "item2", "item3")

# This should be a comment



# A section 1 -------------------------------------------------------------


# ^ Start a new section here

screAm <- "I Am A bAnAnA Apple cArAmel"

# Fuzzy find a "file2" 

# Look at mean documentation
mean(c(1,2,3,4,NA), na.rm = T)


say_hi()




# Oh no someone needs to reformat all the code an indent it!

library(dplyr)

data(mtcars)
head(mtcars)
summary(mtcars)

mtcars %>%
  group_by(cyl) %>%
  summarize(
    avg_mpg = mean(mpg),
    avg_hp = mean(hp)
  ) %>%
  arrange(desc(avg_mpg))

plot(mtcars$mpg, mtcars$hp,
  main = "MPG vs HP", xlab = "Miles Per Gallon", ylab = "Horsepower",
  col = "blue", pch = 19
)
abline(lm(hp ~ mpg, data = mtcars), col = "red")
title("MPG vs Horsepower")



