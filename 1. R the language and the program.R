
#Ejercicios del capítulo 1. R: The language and the program


cat("\014")
print("hello")

a<-c(1,7,8,10,25)
sprintf("media: %.4f ",mean(a))
sprintf("desviación estándar: %.4f", sd(a))
sprintf("varianza: %.4f", var(a))

b<-factor(c("trea","trea","trea","ctrl","ctrl")) 
print(b)

#source("1. R the language and the program.R")