
#Ejercicios del capítulo 2. The R language Words and Sentences


# -------------------------------------
# 2.3 Numeric values and arithmetic
# -------------------------------------

cat("\014")
(3 + exp(2)) / sin(pi)

1 + 2 * 3
1 + (2 * 3)
(1 + 2) * 3

# -------------------------------------
cat("\014")

1 + 1
2 * 2
2 + 10 / 5
(2 + 10) / 5
10^2 + 1
sqrt(9)
pi # whole precision not shown when printing
print(pi, digits = 22)
sin(pi) # oops! Read on for explanation.
log(100)
log10(100)
log2(8)
exp(1)

# -------------------------------------
cat("\014")

a <- 1
a + 1
a

b <- 10
b <- a + b
b

3e-2 * 2.0

# -------------------------------------
cat("\014")

a
print(a)
a + 1
print(a + 1)


# -------------------------------------
cat("\014")

a <- b <- c <- 0.0
a
b
c
1 -> a
a
a = 3
a


# -------------------------------------
cat("\014")

mode(1)
## [1] "numeric"
a <- 1
is.numeric(a)
is.numeric(1L)
is.integer(1L)
is.double(1L)
is.numeric(1)
is.integer(1)
## [1] FALSE
is.double(1)


# -------------------------------------
cat("\014")

a <- c(3, 1, 2)
a
b <- c(4, 5, 0)
b
c <- c(a, b)
c
## [1] 3 1 2 4 5 0
d <- c(b, a)
d
## [1] 4 5 0 3 1 2
append(a, b)
## [1] 3 1 2 4 5 0


# -------------------------------------
cat("\014")

a <- -1:5
a
b <- 5:-1
b
c <- seq(from = -1, to = 1, by = 0.1)
c
d <- rep(-5, 4)
d
+ 1 # we add one to vector a defined above
## [1] 4 2 3
(a + 1) * 2
## [1] 8 4 6
a + b
## [1] 7 6 2
a - a
## [1] 0 0 0


# -------------------------------------
cat("\014")

a <- rep(1, 6)
a
## [1] 1 1 1 1 1 1
a + 1:2
## [1] 2 3 2 3 2 3
a + 1:3
## [1] 2 3 4 2 3 4
a + 1:4
## Warning in a + 1:4: longer object length is not a multiple of shorter object length
## [1] 2 3 4 5 2 3


# -------------------------------------
cat("\014")

z <- numeric(0)
z
length(z)
length(c(a, numeric(0), b))
length(c(a, b))
log(numeric(0))
5 + numeric(0)

ls(pattern="^z$")
## [1] "z"
rm(z)
ls(pattern="^z$")

# -------------------------------------
cat("\014")

a <- NA
a
-1 / 0
1 / 0
Inf / Inf
Inf + 4
b <- -Inf
b * -1
A <- NA
A
A + 1
A + Inf

# -------------------------------------
cat("\014")

is.na(c(NA, 1))
is.numeric(1L)
is.integer(1L)
is.double(1L)
is.double(1L / 3L)
is.numeric(1L / 3L)


# -------------------------------------
cat("\014")


round(0.0124567, digits = 3)
signif(0.0124567, digits = 3)
round(1789.1234, digits = 3)
signif(1789.1234, digits = 3)
round(1789.1234, digits = -1)
a <- 0.12345
b <- round(a, digits = 2)
a == b
a - b
b


# ----------------------------------------
# 2.4 Logical values and Boolean algebra
# ----------------------------------------

cat("\014")

a <- TRUE
b <- FALSE
mode(a)
## [1] "logical"
a
## [1] TRUE
!a # negation
## [1] FALSE
a && b # logical AND
## [1] FALSE
a || b # logical OR
## [1] TRUE
xor(a, b) # exclusive OR
## [1] TRUE

a <- c(TRUE,FALSE)
b <- c(TRUE,TRUE)
a
## [1] TRUE FALSE
b
## [1] TRUE TRUE
a & b # vectorized AND
## [1] TRUE FALSE
a | b # vectorized OR
## [1] TRUE TRUE
a && b # not vectorized
## [1] TRUE
a || b # not vectorized
## [1] TRUE
any(a)
## [1] TRUE
all(a)
## [1] FALSE
any(a & b)
## [1] TRUE
all(a & b)
## [1] FALSE



# -----------------------------------------
# 2.5 Comparison operators and operations
# -----------------------------------------

1.2 > 1.0
## [1] TRUE
1.2 >= 1.0
## [1] TRUE
1.2 == 1.0 # be aware that here we use two = symbols
## [1] FALSE
1.2 != 1.0
## [1] TRUE
1.2 <= 1.0
## [1] FALSE
1.2 < 1.0
## [1] FALSE
a <- 20
a < 100 && a > 10
## [1] TRUE

a <- 1:10
a > 5
## [1] FALSE FALSE FALSE FALSE FALSE TRUE TRUE TRUE TRUE TRUE
a < 5
## [1] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE
a == 5
## [1] FALSE FALSE FALSE FALSE TRUE FALSE FALSE FALSE FALSE FALSE
all(a > 5)
## [1] FALSE
any(a > 5)
## [1] TRUE
b <- a > 5
b
## [1] FALSE FALSE FALSE FALSE FALSE TRUE TRUE TRUE TRUE TRUE
any(b)
## [1] TRUE
all(b)
## [1] FALSE

all(c > 5)
## [1] FALSE
any(c > 5)
## [1] TRUE
all(c < 20)
## [1] NA
any(c > 20)
## [1] NA
is.na(a)
## [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
is.na(c)
## [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE TRUE
any(is.na(c))
## [1] TRUE
all(is.na(c))
## [1] FALSE


.Machine$double.eps
## [1] 2.220446e-16
.Machine$double.neg.eps
## [1] 1.110223e-16
.Machine$double.max
## [1] 1024
.Machine$double.min
## [1] -1022
.Machine$integer.max
## [1] 2147483647


sin(pi) == 0.0 # angle in radians, not degrees!
## [1] FALSE
sin(2 * pi) == 0.0
## [1] FALSE
abs(sin(pi)) < 1e-15
## [1] TRUE
abs(sin(2 * pi)) < 1e-15
## [1] TRUE




# -----------------------------------------
# 2.6 Sets and set operations
# -----------------------------------------

fruits <- c("apple", "pear", "orange", "lemon", "tangerine")
bakery <- c("bread", "buns", "cake", "cookies")
dairy <- c("milk", "butter", "cheese")
shopping <- c("bread", "butter", "apple", "cheese", "orange")
intersect(fruits, shopping)
## [1] "apple" "orange"
intersect(bakery, shopping)
## [1] "bread"


intersect(dairy, shopping)
## [1] "butter" "cheese"
"lemon" %in% dairy
## [1] FALSE
"lemon" %in% fruits
## [1] TRUE
setdiff(union(bakery, dairy), shopping)
## [1] "buns" "cake" "cookies" "milk"

my.set <- c("a", "b", "c", "b")

"a" %in% my.set
## [1] TRUE
c("a", "a", "z") %in% my.set
## [1] TRUE TRUE FALSE


unique(my.set)
## [1] "a" "b" "c"
c("a", "a", "z") %in% unique(my.set)
## [1] TRUE TRUE FALSE

9L %in% 2L:4L
## [1] FALSE
9L %in% ((2L:4L) * (2L:4L))
## [1] TRUE
c(1L, 16L) %in% ((2L:4L) * (2L:4L))
## [1] FALSE TRUE



# -----------------------------------------
# 2.7 Character values
# -----------------------------------------

a <- "A"
a
## [1] "A"
b <- 'A'
b
## [1] "A"
a == b
## [1] TRUE

a <- 'A'
b <- "bcdefg"
c <- "123"
d <- c(a, b, c)
d
## [1] "A" "bcdefg" "123"


a <- "He said 'hello' when he came in"
a
## [1] "He said 'hello' when he came in"


# -----------------------------------------
# 2.8 The ‘mode’ and ‘class’ of objects
# -----------------------------------------
my_var <- 1:5
mode(my_var) # no distinction of integer or double
## [1] "numeric"
typeof(my_var)
## [1] "integer"
is.numeric(my_var) # no distinction of integer or double
## [1] TRUE
is.double(my_var)
## [1] FALSE
is.integer(my_var)
## [1] TRUE
is.logical(my_var)
## [1] FALSE
is.character(my_var)
## [1] FALSE
my_var <- "abc"
mode(my_var)
## [1] "character"

class(my_var)
## [1] "character"
inherits(my_var, "character")
## [1] TRUE
inherits(my_var, "numeric")
## [1] FALSE


# -----------------------------------------
# 2.9 ‘Type’ conversions
# -----------------------------------------

as.character(1)
## [1] "1"
as.numeric("1")
## [1] 1
as.logical("TRUE")
## [1] TRUE
as.logical("NA")
## [1] NA

as.character(3.0e10)
as.numeric("5E+5")
as.numeric("A")
as.numeric(TRUE)
as.numeric(FALSE)
as.logical("T")
as.logical("t")
as.logical("true")
as.logical(100)
as.logical(0)
as.logical(-1)

f <- c("1", "2", "3")
length(f)
## [1] 3
g <- "123"
length(g)
## [1] 1
as.numeric(f)
## [1] 1 2 3
as.numeric(g)
## [1] 123

x = c(123.4567890, 1.0)
format(x) # using defaults
## [1] "123.4568" " 1.0000"
format(x[1]) # using defaults
## [1] "123.4568"
format(x[2]) # using defaults
## [1] "1"
format(x, digits = 3, nsmall = 1)
## [1] "123.5" " 1.0"

sprintf("The numbers are: %4.2f and %.0f", x[1], x[2])
## [1] "The numbers are: 123.46 and 1"




# -----------------------------------------
# 2.10 Vector manipulation
# -----------------------------------------

a <- letters[1:10]
a
## [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
a[2]
## [1] "b"

a[c(3,2)]
## [1] "c" "b"
a[10:1]
## [1] "j" "i" "h" "g" "f" "e" "d" "c" "b" "a"

length(a)
a[c(3,3,3,3)]
a[c(10:1, 1:10)]
a[c(1,11)]
a[11]

a[-2]
## [1] "a" "c" "d" "e" "f" "g" "h" "i" "j"
a[-c(3,2)]
## [1] "a" "d" "e" "f" "g" "h" "i" "j"
a[-3:-2]
## [1] "a" "d" "e" "f" "g" "h" "i" "j"
a[ ]
a[0]
a[numeric(0)]
a[NA]


a <- letters[1:10]
b <- 1:10
selector <- a > "c"
selector
a[selector]
b[selector]

indexes <- which(a > "c")
indexes
a[indexes]
b[indexes]

b <- LETTERS[1:10]
b[-1]
## [1] "B" "C" "D" "E" "F" "G" "H" "I" "J"
b[-1.1]
## [1] "B" "C" "D" "E" "F" "G" "H" "I" "J"
b[-1.9999]
## [1] "B" "C" "D" "E" "F" "G" "H" "I" "J"
b[-2]
## [1] "A" "C" "D" "E" "F" "G" "H" "I" "J"



my.vector <- c(10, 4, 22, 1, 4)
sort(my.vector)
## [1] 1 4 4 10 22
sort(my.vector, decreasing = TRUE)
## [1] 22 10 4 4 1


my.letters <- letters[c(1,5,10,3,1,4,21,1,10)]
my.letters
## [1] "a" "e" "j" "c" "a" "d" "u" "a" "j"
sort(my.letters)
## [1] "a" "a" "a" "c" "d" "e" "j" "j" "u"
rle(sort(my.letters))
## Run Length Encoding
## lengths: int [1:6] 3 1 1 1 2 1
## values : chr [1:6] "a" "c" "d" "e" "j" "u"


# -----------------------------------------
# 2.11 Matrices and multidimensional arrays
# -----------------------------------------


matrix(1:15, ncol = 3)
matrix(1:15, nrow = 3)
matrix(1:15)
matrix(1:15, ncol = 2)


A <- matrix(1:20, ncol = 4)
A
A[1, 1]
## [1] 1

A[1, ]
## [1] 1 6 11 16
A[ , 1]
## [1] 1 2 3 4 5

A[2:3, c(1,3)]
## [,1] [,2]
## [1,] 2 12
## [2,] 3 13

A[3, 4] <- 99
A
A[4:3, 2:1] <- A[3:4, 1:2]
A

my.vector <- 1:6
dim(my.vector)
## NULL
one.col.matrix <- matrix(1:6, ncol = 1)
dim(one.col.matrix)
## [1] 6 1
two.col.matrix <- matrix(1:6, ncol = 2)
dim(two.col.matrix)
## [1] 3 2

B <- array(1:27, dim = c(3, 3, 3))
B
## , , 1

v <- 1:10
m2c <- matrix(v, ncol = 2)
m2cr <- matrix(v, ncol = 2, byrow = TRUE)
m2r <- matrix(v, nrow = 2)
m2rc <- matrix(v, nrow = 2, byrow = TRUE)


B <- matrix(1:16, ncol = 4)
B * B
B %*% B


# -----------------------------------------
# 2.12 Factors
# -----------------------------------------

my.vector <- c("treated", "treated", "control", "control", "control", "treated")
my.factor <- factor(my.vector)
my.factor
## [1] treated treated control control control treated
## Levels: control treated
my.factor <- factor(x = my.vector, levels = c("treated", "control"))
my.factor

my.vector <- c(1, 1, 0, 0, 0, 1)
my.factor <- factor(x = my.vector, levels = c(1, 0), labels = c("treated", "control"))
my.factor
## [1] treated treated control control control treated
## Levels: treated control

gl(2, 5, labels = c("A", "B"))
## [1] A A A A A B B B B B
## Levels: A B

my.factor1 <- gl(4, 3, labels = c("A", "F", "B", "Z"))
my.factor1
## [1] A A A F F F B B B Z Z Z
## Levels: A F B Z
levels(my.factor1) <- c("a", "b", "c", "d")
my.factor1
## [1] a a a b b b c c c d d d
## Levels: a b c d

# Merging factor levels
my.factor1 <- gl(4, 3, labels = c("A", "F", "B", "Z"))
my.factor1
## [1] A A A F F F B B B Z Z Z
## Levels: A F B Z
factor(my.factor1,
       levels = c("A", "B", "F", "Z"),
       labels = c("A", "B", "C", "C"))
## [1] A A A C C C B B B C C C
## Levels: A B C




# gl() keeps order of levels
my.factor4 <- gl(4, 3, labels = c("A", "F", "B", "Z"))
my.factor4
as.integer(my.factor4)
# factor() orders levels alphabetically
my.factor5 <- factor(rep(c("A", "F", "B", "Z"), rep(3,4)))
my.factor5
as.integer(my.factor5)
levels(my.factor5)[as.integer(my.factor5)]


# -----------------------------------------
# 2.13 Lists
# -----------------------------------------

a.list <- list(x = 1:6, y = "a", z = c(TRUE, FALSE))
a.list
## $x
## [1] 1 2 3 4 5 6
##
## $y
## [1] "a"
##
## $z
## [1] TRUE FALSE



# -----------------------------------------
# 2.13.1 Member extraction and subsetting
# -----------------------------------------

a.list$x
## [1] 1 2 3 4 5 6
a.list[["x"]]
## [1] 1 2 3 4 5 6
a.list[[1]]
## [1] 1 2 3 4 5 6

a.list[c(1,3)]
try(a.list[[c(1,3)]])
## [1] 3


# -----------------------------------------
# 2.13.2 Adding and removing list members
# -----------------------------------------

another.list <- append(a.list, list(yy = 1:10, zz = letters[5:1]), 2L)
another.list

a.list$y <- NULL
a.list

a.list <- list("a", "aa", "aaa")
b.list <- list("b", "bb")
nested.list <- list(A = a.list, B = b.list)
str(nested.list)


# -----------------------------------------
# 2.13.3 Nested lists
# -----------------------------------------

nested.list <- list(A = list("a", "aa", "aaa"), B = list("b", "bb"))
str(nested.list)

c.vec <- unlist(nested.list)
c.vec
## A1 A2 A3 B1 B2
## "a" "aa" "aaa" "b" "bb"
is.list(nested.list)
## [1] TRUE
is.list(c.vec)
## [1] FALSE
mode(nested.list)
## [1] "list"
mode(c.vec)
## [1] "character"
names(nested.list)
## [1] "A" "B"
names(c.vec)
## [1] "A1" "A2" "A3" "B1" "B2"


# -----------------------------------------
# 2.14 Data frames
# -----------------------------------------

a.df <- data.frame(x = 1:6, y = "a", z = c(TRUE, FALSE))
a.df

str(a.df)
class(a.df)
mode(a.df)
## [1] "list"
is.data.frame(a.df)
## [1] TRUE
is.list(a.df)
## [1] TRUE

a.df$x
## [1] 1 2 3 4 5 6
a.df[["x"]]
## [1] 1 2 3 4 5 6
a.df[[1]]
## [1] 1 2 3 4 5 6
class(a.df)
## [1] "data.frame"

a.df[[1]][2:3]
## [1] 2 3
a.df[["x"]][2:3]
## [1] 2 3
a.df[2:3, 1:2]
## x y
## 2 2 a
## 3 3 a
a.df[2:3, 1]
## [1] 2 3

# first column, a.df[[1]] preferred
a.df[ , 1]
## [1] 1 2 3 4 5 6
# first column, a.df[["x"]] or a.df$x preferred
a.df[ , "x"]
## [1] 1 2 3 4 5 6
# first row
a.df[1, ]
## x y z x2 x3
## 1 1 a TRUE 6 b
# first two rows of the third and fourth columns
a.df[1:2, c(FALSE, FALSE, TRUE, TRUE, FALSE)]
## z x2
## 1 TRUE 6
## 2 FALSE 5
# the rows for which z is true
a.df[a.df$z , ]
## x y z x2 x3
## 1 1 a TRUE 6 b
## 3 3 a TRUE 4 b
## 5 5 a TRUE 2 b
# the rows for which x > 3 keeping all columns except the third one
a.df[a.df$x > 3, -3]
## x y x2 x3
## 4 4 a 3 b
## 5 5 a 2 b
## 6 6 a 1 b


# -----------------------------------------
# 2.14.1 Operating within data frames
# -----------------------------------------

a.df <- data.frame(x = 1:6, y = "a", z = c(TRUE, FALSE))
subset(a.df, x > 3)
## x y z
## 4 4 a FALSE
## 5 5 a TRUE
## 6 6 a FALSE

subset(a.df, x > 3)[ , -3]
subset(a.df, x > 3)$x

A <- 1
subset(a.df, A > 3)

aa.df <- a.df
colnames(aa.df)
## [1] "x" "y" "z"
aa.df[["y"]] <- NULL
colnames(aa.df)
## [1] "x" "z"

a.df[ , -which(colnames(a.df) == "y")]
a.df[1:6, c(1,3)] <- a.df[6:1, c(3,1)]
a.df

my_data_frame.df <- data.frame(A = 1:10, B = 3)
my_data_frame.df$C <-
  (my_data_frame.df$A + my_data_frame.df$B) / my_data_frame.df$A
head(my_data_frame.df, 2)
## A B C
## 1 1 3 4.0
## 2 2 3 2.5

my_data_frame.df$C <- NULL
attach(my_data_frame.df)
my_data_frame.df$C <- (A + B) / A
detach(my_data_frame.df)
head(my_data_frame.df, 2)


# -----------------------------------------
# 2.14.2 Re-arranging columns and rows
# -----------------------------------------

my_data_frame.df <- data.frame(A = 1:10, B = 3)
head(my_data_frame.df, 2)
## A B
## 1 1 3
## 2 2 3
my_data_frame.df[ , 1:2] <- my_data_frame.df[ , 2:1]
head(my_data_frame.df, 2)
## A B
## 1 3 1
## 2 3 2
colnames(my_data_frame.df)[1:2] <- colnames(my_data_frame.df)[2:1]
head(my_data_frame.df, 2)
## B A
## 1 3 1
## 2 3 2


# -----------------------------------------
# 2.15 Attributes of R objects
# -----------------------------------------

a.df <- data.frame(x = 1:6, y = "a", z = c(TRUE, FALSE))
comment(a.df)
## NULL
comment(a.df) <- "this is stored as a comment"
comment(a.df)
## [1] "this is stored as a comment"

names(a.df)
## [1] "x" "y" "z"
names(a.df) <- toupper(names(a.df))
names(a.df)
## [1] "X" "Y" "Z"
attr(a.df, "names") # same as previous line
## [1] "X" "Y" "Z"
attr(a.df, "my.attribute") <- "this is stored in my attribute"
attributes(a.df)


# -----------------------------------------
# 2.16 Saving and loading data
# 2.16.1 Data sets in R and packages
# -----------------------------------------

data(cars)

# -----------------------------------------
# 2.16.2 .rda files
# -----------------------------------------

my.df <- data.frame(x = 1:5, y = 5:1)
my.df
save(my.df, file = "my-df.rda")

rm(my.df)
ls(pattern = "my.df")

load(file = "my-df.rda")
ls(pattern = "my.df")
my.df

objcts <- ls(pattern = "*.df")
save(list = objcts, file = "my-df1.rda")

save(list = ls(pattern = "*.df"), file = "my-df1.rda")


# -----------------------------------------
# 2.16.3 .rds files
# -----------------------------------------

saveRDS(my.df, "my-df.rds")
readRDS("my-df.rds")

my_read.df <- readRDS("my-df.rds")
identical(my.df, my_read.df)
## [1] TRUE
unlink("my-df.rds")


# -----------------------------------------
# 2.17 Looking at data
# -----------------------------------------

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

sapply(X = cars, FUN = class)
summary(cars)
sapply(cars, range)


# -----------------------------------------
# 2.18 Plotting
# -----------------------------------------

plot(x = cars$speed, y = cars$dist)
plot(dist ~ speed, data = cars)
plot(weight ~ feed, data = chickwts)

pdf(file = "my-file.pdf", width = 6, height = 5, onefile = TRUE)
plot(dist ~ speed, data = cars)
plot(weight ~ feed, data = chickwts)
dev.off()

png(file = "my-file1.png", width = 600, height = 500)
plot(weight ~ feed, data = chickwts)
dev.off()
## cairo_pdf
## 2

png(file = "my-file2.png", width = 600, height = 500)
plot(dist ~ speed, data = cars)
text(x = 10, y = 110, labels = "some texts to be added")
dev.off()
















