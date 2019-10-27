# Business Analytics WS 2019/20
# Exercise - Solution

# Data from: http://vincentarelbundock.github.io/Rdatasets/doc/plm/LaborSupply.html (Filtered on year 1988)

# Load tidyverse
library(tidyverse)
getwd()
setwd("data")

# ---------------------------------------------
# Exercise 1.1 Loading a data set and statistics

# 1.1a
# Read the CSV file "LaborSupply1988.csv" into a tibble df
df = read_csv("LaborSupply1988.csv")   

# 1.1b
# How many attributes (columns) and observations (rows) does df have?
dim(df)

# 1.1c
# List the attribute names of the data set
names(df)
# lnhr: log of annual hours worked
# lnwg: log of hourly wage
# kids: number of children
# age: age
# disab: bad health

# 1.1d
# List the first rows of the data set
head(df)

# 1.1e
# What is the value range of the attribute - age?
summarise(df, min_age=min(age), max_age=max(age)) # the tidyverse way
summary(df$age) # the other way
min(df$age)
max(df$age)
range(df$age)

# 1.1f
# Calculate average of annual hours worked by labourers with 0,1...6 kids
df %>% group_by(kids) %>% summarise(mean_lnhr=mean(lnhr)) # the tidyverse way
mean(df[df$kids == 0,]$lnhr) # the other way, repeat with different values of kids

# 1.1g
# Calculate the average number of kids of the 40 year old
df %>% filter(age == 40) %>% summarise(mean_kids=mean(kids)) # the tidyverse way
mean(df[df$age == 40, ]$kids) # the other way


# ---------------------------------------------
# Exercise 1.2 Plotting

# 1.2a
# Plot a histogram of the attribute age. What is the most frequent age?
hist(df$age)
hist(df$age, breaks=30)
df %>% group_by(age) %>% summarise(count=n()) %>% arrange(desc(count))
# The most frequent age is 39.

# 1.2b
# Plot the average number of kids against the age and interpret the resulting graph
plot(df %>% group_by(age) %>% summarise(avg_kids=mean(kids))) # the tidyverse way
plot(aggregate(x=df$kids, by=list(df$age), FUN=mean)) # the other way
# The average number of kids decreases with increasing age
# Underpin your observation using a statistical method.
cor(df$kids, df$age)
# The two attributes are correlated negatively.

# 1.2c
# Plot the log of hourly wage against the age.
plot(df$age, df$lnwg)

# 1.2d
# Plot the mean of the log of hourly wage against the age
plot(df %>% group_by(age) %>% summarise(avg_lnwg=mean(lnwg))) # the tidyverse way
plot(aggregate(x=df$lnwg, by=list(df$age), FUN=mean)) # the other way
# How are they correlated?
cor(df$lnwg, df$age)

# 1.2e
# Plot lnhr against age with different colors for disab=0 and disab=1
plot(df$age, df$lnhr, pch=df$disab+1, col=c("red", "blue")[df$disab+1])

# 1.2f
# Plot a boxplot of the log of annual hours worked againts the number of kids.
# What could be observed regarding mean and variance?
boxplot(df$lnhr ~ df$kids)
# Is the observation meaningful for large values of kids?
hist(df$kids, breaks=(max(df$kids)-min(df$kids)))
# For values of 5 and 6, only two observations exist. Hence the observation is not very meaningful.

