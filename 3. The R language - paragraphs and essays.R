#Ejercicios del capítulo 3. The R language: “Paragraphs” and “essays”


# -------------------------------------
# 3.2.1 What is a script?
# 3.2.2 How do we use a script?
# -------------------------------------

source("my.first.script.r")
## [1] 7

source("my.second.script.r")

# -------------------------------------
# 3.2.4 The need to be understandable to people
# -------------------------------------

a <- 2 # height
b <- 4 # length
C <-
  a *
  b
C -> variable
print(
  "area: ", variable
)

c <- a * b
c -> variable
print("area: ", variable)


# -------------------------------------
# 3.3 Control of execution flow
# 3.3.1 Compound statements
# -------------------------------------

print("A")
## [1] "A"
{
  print("B")
  print("C")
}
## [1] "B"
## [1] "C"



# -------------------------------------
# 3.3.2 Conditional execution
# 3.3.2.1 Non-vectorized if, else and switch
# -------------------------------------

flag <- TRUE
if (flag) print("Hello!")

if (TRUE) print("Hello!")

printing <- TRUE
if (printing) {
  print("A")
  print("B")
}
## [1] "A"
## [1] "B"

a <- 10.0
if (a < 0.0) print("'a' is negative") else print("'a' is not negative")
## [1] "'a' is not negative"
print("This is always printed")
## [1] "This is always printed"

# 1
a <- 1
if (a < 0.0) {
  print("'a' is negative")
} else {
  print("'a' is not negative")
}
## [1] "'a' is not negative"

a <- 1
my.message <-
  if (a < 0.0) "'a' is negative" else "'a' is not negative"
print(my.message)
## [1] "'a' is not negative"


if (0) print("hello")
if (-1) print("hello")
if (0.01) print("hello")
if (1e-300) print("hello")

if (as.logical("true")) print("hello")
if (as.logical(as.numeric("1"))) print("hello")
if (as.logical("1")) print("hello")
if ("1") print("hello")

my.object <- "two"
b <- switch(my.object,
            one = 1,
            two = 1 / 2,
            three = 1 / 4,
            0
)
b
## [1] 0.5


# -------------------------------------
# 3.3.2.2 Vectorized ifelse()
# -------------------------------------

my.test <- c(TRUE, FALSE, TRUE, TRUE)
ifelse(test = my.test, yes = 1, no = -1)
## [1] 1 -1 1 1

nums <- -3:+3
ifelse(nums < 0, -nums, nums)
## [1] 3 2 1 0 1 2 3

a <- 1:10
ifelse(a > 5, 1, -1)
ifelse(a > 5, a + 1, a - 1)
ifelse(any(a > 5), a + 1, a - 1) # tricky

ifelse(TRUE, 1:5, -5:-1)
## [1] 1
ifelse(FALSE, 1:5, -5:-1)
## [1] -5


# -------------------------------------
# 3.3.3 Iteration
# 3.3.3.1 for loops
# -------------------------------------

b <- 0
for (a in 1:5) b <- b + a
b
## [1] 15
b <- sum(1:5) # built-in function (faster)
b
## [1] 15

a <- c(1, 4, 3, 6, 8)
for(x in a) {print(x*2)} # print is needed!

b <- for(x in a) {x*2}
b
## NULL
b <- numeric()
for(i in seq(along.with = a)) {
  b[i] <- a[i]^2
  print(b)
}

# runs faster if we first allocate a long enough vector
b <- numeric(length(a))
for(i in seq(along.with = a)) {
  b[i] <- a[i]^2
  print(b)
}


b <- a^2
b


# -------------------------------------
# 3.3.3.2 while loops
# -------------------------------------

a <- 2
while (a < 50) {
  print(a)
  a <- a^2
}
## [1] 2
## [1] 4
## [1] 16

print(a)
## [1] 256

a <- 2
print(a)
while (a < 50) {
  print(a <- a^2)
}

a <- b <- c <- 1:5
a


# -------------------------------------
# 3.3.3.3 repeat loops
# -------------------------------------

a <- 2
repeat{
  print(a)
  if (a > 50) break()
  a <- a^2
}


# -------------------------------------
# 3.3.4 Explicit loops can be slow in R
# -------------------------------------

system.time({a <- numeric()
for (i in 1:1000000) {
  a[i] <- i / 1000
}
})

# ---------------------------------------
a <- rnorm(10^7) # 10 000 0000 pseudo-random numbers

# b <- numeric()
b <- numeric(length(a)-1) # pre-allocate memory
i <- 1
while (i < length(a)) {
  b[i] <- a[i+1] - a[i]
  print(b)
  i <- i + 1
}
b

# b <- numeric()
b <- numeric(length(a)-1) # pre-allocate memory
for(i in seq(along.with = b)) {
  b[i] <- a[i+1] - a[i]
  print(b)
}
b


# although in this case there were alternatives, there
# are other cases when we need to use indexes explicitly
b <- a[2:length(a)] - a[1:length(a)-1]
b


# or even better
b <- diff(a)
b


# -------------------------------------
# 3.3.5 Nesting of loops
# -------------------------------------

A <- matrix(1:50, 10)
A

row.sum <- numeric()
for (i in 1:nrow(A)) {
  row.sum[i] <- 0
  for (j in 1:ncol(A))
    row.sum[i] <- row.sum[i] + A[i, j]
}
print(row.sum)
## [1] 105 110 115 120 125 130 135 140 145 150


row.sum <- numeric(nrow(A)) # faster
for (i in 1:nrow(A)) {
  row.sum[i] <- sum(A[i, ])
}
print(row.sum)
## [1] 105 110 115 120 125 130 135 140 145 150


# -------------------------------------
# 3.3.5.1 Clean-up
# -------------------------------------

file.create("temp.file")
## [1] TRUE
on.exit(file.remove("temp.file"))
# code that makes use of the file goes here


# -------------------------------------
# 3.4 Apply functions
# 3.4.1 Applying functions to vectors and lists
# -------------------------------------

set.seed(123456) # so that a.vector does not change
a.vector <- runif(6) # A short vector as input to keep output short
str(a.vector)

my.fun <- function(x, k) {log(x) + k}


z <- lapply(X = a.vector, FUN = my.fun, k = 5)
str(z)

z <- sapply(X = a.vector, FUN = my.fun, k = 5)
str(z)

z <- sapply(X = a.vector, FUN = my.fun, k = 5, simplify = FALSE)
str(z)

z <- sapply(X = a.vector, FUN = function(x, k) {log(x) + k}, k = 5)
str(z)


set.seed(123456)
a.list <- lapply(rep(4, 5), rnorm, mean = 10, sd = 1)
str(a.list)

mean_and_sd <- function(x, na.rm = FALSE) {
  c(mean(x, na.rm = na.rm), sd(x, na.rm = na.rm))
}

values <- vapply(X = a.list,
                 FUN = mean_and_sd,
                 FUN.VALUE = c(mean = 0, sd = 0),
                 na.rm = TRUE)
class(values)
## [1] "matrix" "array"


# -------------------------------------
# 3.4.2 Applying functions to matrices and arrays
# -------------------------------------

a.matrix <- matrix(runif(100), ncol = 10)
z <- apply(a.matrix, MARGIN = 1, FUN = mean)
str(z)

a.small.matrix <- matrix(rnorm(6, mean = 10, sd = 1), ncol = 2)
a.small.matrix <- round(a.small.matrix, digits = 1)
a.small.matrix


mean_and_sd <- function(x, na.rm = FALSE) {
  c(mean(x, na.rm = na.rm), sd(x, na.rm = na.rm))
}

z <- apply(X = a.small.matrix, MARGIN = 2, FUN = mean_and_sd, na.rm = TRUE)
z
z <- apply(X = a.small.matrix, MARGIN = 1, FUN = mean_and_sd, na.rm = TRUE)
z



# -------------------------------------
# 3.5 Object names and character strings
# -------------------------------------

assign("a", 9.99)
a

name.of.var <- "b"
assign(name.of.var, 9.99)
b
name.of.var

for (i in 1:5) {
  assign(paste("zz_", i, sep = ""), i^2)
}
ls(pattern = "zz_*")

get("a")
## [1] 9.99
get("b")
## [1] 9.99













