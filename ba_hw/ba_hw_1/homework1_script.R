# Business Analytics WS 2019/2020
# Introduction to R - Homework
# Please write your code below.

# Exercise 1 - start
set.seed(10)

# 1.b
w1 = sample(1:6, size = 1000, replace = TRUE)

# absolute frequency
hist(w1, breaks = 30)

# relative frequency
table(w1)

# variance
var(w1)

# mean
mean(w1)

# 1.c
w2 = sample(1:6, size = 1000, replace = TRUE)
glimpse(w1 == w2)

# 1.d
w12 = w1 + w2

var(w12)
mean(w12)
hist(w12, breaks = 50)
# Exercise 1 - end


# Exercise 2 - start
library(tidyverse)
getwd()
setwd("data")

df = read.csv("E1-3-data.csv", sep='')
head(df)

# 1.2a
mean(df$A)
sd(df$A)
hist(df$A)

mean(df$B)
sd(df$B)
hist(df$B)

mean(df$C)
sd(df$C)
hist(df$C)

# A is taken form a normally distributed population since its randomly distributed across the values

# 1.2b
mean(df$A)
sd(df$A)
hist(df$A)

# 1.2c
m <- mean(df$A)
s <- sd(df$A)
x <- seq(0, 100, length=1000)
hist(df$A)
l <- lines(x, dnorm(x, m, s), col = "red")

# 1.2d
m <- mean(df$A)
s <- sd(df$A)
x <- seq(10, 80, length=1000)
hist(df$A)
l <- lines(x, dnorm(x, m, s), col = "green")
# Exercise 2 - end