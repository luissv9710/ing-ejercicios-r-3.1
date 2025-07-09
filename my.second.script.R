class(cars)
## [1] "data.frame"
nrow(cars)
## [1] 50
ncol(cars)
## [1] 2
names(cars)
## [1] "speed" "dist"
head(cars)
tail(cars)
str(cars)


# -----------------------------------------
# 2.18 Plotting
# -----------------------------------------

plot(x = cars$speed, y = cars$dist)
plot(dist ~ speed, data = cars)
plot(weight ~ feed, data = chickwts)
