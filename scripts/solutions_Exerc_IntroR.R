#!/usr/bin/env Rscript
# Header ------------------------------------------------------------------
# Author: Joao Malato
# Date: 2022-11-09 12:44:28
# Title: Introduction to R
# Description: Solutions to pdf Exerc_IntroR


# Guided exercises --------------------------------------------------------


# Operacoes simples -------------------------------------------------------

# 1. ----------------------------------------------------------------------

w <- c(1, -1, 2, -2)

# 2. ----------------------------------------------------------------------

print(w)

# 3. ----------------------------------------------------------------------

str(w)

# 4. ----------------------------------------------------------------------

x <- w + 1
print(x)

# 5. ----------------------------------------------------------------------

j <- seq(5, 75, by = 5)
j <- c(0, 1, j)
print(j)

# 6. ----------------------------------------------------------------------

S <- paste("Paciente", "Numero de entrada", "Doenca", 1:10, sep = " : ")
S

# 7. ----------------------------------------------------------------------

# a)
a <- x > 23

# b)
b <- (x >= -1) & (x <= 10)

# c)
c <- x == 3

# d)
d <- x <= 45

# logic conditions
a & b
b | c
d & b

# 8. ----------------------------------------------------------------------

vec_num <- c(3, 4, 2, 6, 20)
vec_char <- c("koala", "kangaroo", "monkey")
vec_logic <- c(FALSE, FALSE, TRUE, TRUE)

# 9. ----------------------------------------------------------------------

y <- c(0, 4, 2, 1, 0, 4, 0, 3, 0, 3, 3, 3, 4, 4, 2, 2, 0)
y

# 10. ---------------------------------------------------------------------

# y < 3
sum(y < 3)
length(which(y < 3))
length(y[y < 3])
length(y[which(y < 3)])

# 11. ---------------------------------------------------------------------

y[y <= 3]

# 12. ---------------------------------------------------------------------

y[y == 0]

# 13. ---------------------------------------------------------------------

y[y != 0]

# 14. ---------------------------------------------------------------------

m <- matrix(c(12, 14, 35, 7, 6, 12, 5, 22, 7, 17, 9, 11), nrow = 3, ncol = 4)
m

# 15. ---------------------------------------------------------------------

m[2, 3]

# 16. ---------------------------------------------------------------------

pauta <- data.frame(
  nros = c(2355, 3456, 2334, 5456),
  turma = c("tp1", "tp1", "tp2", "tp3"),
  notas = c(10.3, 9.3, 14.2, 15)
)
pauta

# 17. ---------------------------------------------------------------------

pauta[2, 2]

# 18. ---------------------------------------------------------------------

pauta$nros

# 19. ---------------------------------------------------------------------

pauta[pauta$notas > 10, ]
pauta[pauta$notas > 14, "nros"]
pauta[pauta$turma == "tp1", c("nros", "notas")]

# 20. ---------------------------------------------------------------------

# attach(pauta)
# detach(pauta)

# 21. ---------------------------------------------------------------------

# edit(pauta)
pauta$resultados <- c("aprovado", "oral", "aprovado", "aprovado")

# 22. ---------------------------------------------------------------------

colnames(pauta)
names(pauta)


# Entrada e saida de dados ------------------------------------------------

# 23. ---------------------------------------------------------------------

library(datasets)
# data("ChickWeight", package = "datasets")
?ChickWeight

# 24. ---------------------------------------------------------------------

library(Epi)
data(births)
?births
str(births)

# 25. ---------------------------------------------------------------------

hist(births$bweight)

# 26. ---------------------------------------------------------------------

hist(births$bweight,
     breaks = seq(0, 5000, 250), col = "lightblue", border = "white", xlab = "Peso dos bebes a nascenca, g")

# 27. ---------------------------------------------------------------------

plot(x = births$gestwks, y = births$bweight)

# 28. ---------------------------------------------------------------------

plot(x = births$matage, y = births$bweight)

# 29. ---------------------------------------------------------------------

plot(x = births$matage, y = births$bweight,
     xlab = "Idade da mae", ylab = "Peso dos bebes a nascenca, g",
     xlim = c(20, 45), ylim = c(0, 5000))

# 30. ---------------------------------------------------------------------

plot(x = births$matage, y = births$bweight,
     xlab = "Idade da mae", ylab = "Peso dos bebes a nascenca, g",
     xlim = c(20, 45), ylim = c(0, 5000),
     pch = 16, col = "forestgreen")

# 31. ---------------------------------------------------------------------

plot(x = births$matage, y = births$bweight,
     xlab = "Idade da mae", ylab = "Peso dos bebes a nascenca, g",
     xlim = c(20, 45), ylim = c(0, 5000),
     pch = 19)


# 32. ---------------------------------------------------------------------

plot(x = births$gestwks, y = births$bweight)
points(x = births$gestwks[births$sex == 1], y = births$bweight[births$sex == 1], col = "blue")
points(x = births$gestwks[births$sex == 2], y = births$bweight[births$sex == 2], col = "red")

# alternatively, define sex as a binary factor:
# births$sex_factor <- factor(births$sex, labels = c("Male", "Female"))
# plot(x = births$gestwks, y = births$bweight, col = births$sex_factor, pch = 16)

# 33. ---------------------------------------------------------------------

plot(x = births$gestwks, y = births$bweight)
points(x = births$gestwks[births$sex == 1], y = births$bweight[births$sex == 1], col = "blue")
points(x = births$gestwks[births$sex == 2], y = births$bweight[births$sex == 2], col = "red")
legend("topleft", pch = 1, legend = c("Rapazes", "Raparigas"), col = c("blue", "red"))
title(main = "Peso a nascenca vs semana gestacional em 500 nascimentos individuais")

# 34. ---------------------------------------------------------------------

plot(x = births$gestwks, y = births$bweight, col = c("blue", "red")[births$sex],
     main = "Peso a nascenca vs semana gestacional em 500 nascimentos individuais")


# 35. ---------------------------------------------------------------------

over_40 <- births$matage >= 40
as.numeric(over_40)+1

plot(x = births$gestwks, y = births$bweight, pch = c(3, 6)[as.numeric(over_40)+1], col = c(2, 1)[as.numeric(over_40)+1],
     main = "Peso a nascenca vs semana gestacional em 500 nascimentos individuais")
legend("topleft", pch = c(3, 6), legend = c("< 40", ">= 40"), col = c(2, 1))

# 36. ---------------------------------------------------------------------

# identify(births$gestwks, births$bweight)

# 37. ---------------------------------------------------------------------

library(here)

pdf(file = here("results/figures", paste("2022-11-09", "Exerc_IntroR_ex37.pdf", sep = "_")), width = 4, height = 3)
plot(x = births$gestwks, y = births$bweight)
dev.off()

# 38. ---------------------------------------------------------------------

# par(mfrow = c(1, 2))
# plot(births$matage ~ (births$gestwks + births$bweight))


# Ciclos e funcoes --------------------------------------------------------

# 39. ---------------------------------------------------------------------

# a
x <- c(1, 2, 5)
n <- length(x)

for(i in 1:n) {
  cat(x[i], "ao quadrado =", x[i]^2, "ao cubo =", x[i]^3, "\n")
}

# b
i <- 1
while(i < (n+1)) {
  cat(x[i], "ao quadrado =", x[i]^2, "ao cubo =", x[i]^3, "\n")
  i <- i+1
}

# 40. ---------------------------------------------------------------------

x <- c(3, 6, 9)
n <- length(x)

F1 <- function(x, n) {
  x^(1:n)
}
F1(x, n)

F2 <- function(x, n) {
  temp <- x^(1:n)/1:n
  1 + sum(temp)
}
F2(x, n)

# alternative using function F1 within function F2
F2 <- function(x, n) {
  temp <- F1(x, n)/1:n
  1 + sum(temp)
}
F2(x, n)

# 41. ---------------------------------------------------------------------

mat1 <- matrix(c(1, 1, 3, 5, 2, 6, -2, -1, -3), nrow = 3, ncol = 3, byrow = TRUE)

double_odd <- function(mat) {
  mat[mat%%2 == 1] <- mat[mat1%%2 == 1] * 2
  return(mat)
}

double_odd(mat1)

