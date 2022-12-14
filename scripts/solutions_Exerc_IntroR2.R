#!/usr/bin/env Rscript
# Header ------------------------------------------------------------------
# Author: Joao Malato
# Date: 2022-11-09 12:44:28
# Title: Introduction to R
# Description: Solutions to pdf Exerc_IntroR



# Free exercises ----------------------------------------------------------

# Operacoes simples -------------------------------------------------------


# 1. ----------------------------------------------------------------------

# a
ex1_a <- 4 + 5 * (log10(4) - exp(3))
ex1_a

# b
ex1_b <- sqrt(37) + 4 + 5 * (log10(4) - exp(3))
ex1_b

# c
ex1_c <- sin(pi / 2) + cos((2 * pi) / 3)
ex1_c

# 2. ----------------------------------------------------------------------

ls()

# 3. ----------------------------------------------------------------------

vec_sequence1 <- 26:17
vec_sequence1
# seq(26, 17, -1)
# sort(seq(17, 26, 1), decreasing = TRUE)

# 4. ----------------------------------------------------------------------

length(vec_sequence1)

# 5. ----------------------------------------------------------------------

vec_sequence2 <- seq(-15, 89, by = 0.5)
vec_sequence2

# 6. ----------------------------------------------------------------------

vec_sequence3 <- seq(from = 15, by = 2.3, length.out = 30)
vec_sequence3

# 7. ----------------------------------------------------------------------

vec_paciente <- paste("Paciente", "Centro de Saude", 1:20, sep = " - ")
vec_paciente

# 8. ----------------------------------------------------------------------

set.seed(42)
x <- round(runif(n = 20, min = -100, max = 100))
x

# a
ex8_a <- x[x > 13]

# b
ex8_b <- x[x > 13 & x == 23]

# c
ex8_c <- x[x > 0]

# logical conditions
# ex8_a & ex8_c
# ex8_a | ex8_c
# ex8_b & ex8_c


# Vetores, matrizes e data frames -----------------------------------------

# 9. ----------------------------------------------------------------------

peso <- c(63, 70, 52, 98, 90, 70)
altura <- c(1.70, 1.82, 1.75, 1.94, 1.84, 1.61)

# 10. ---------------------------------------------------------------------

table(peso>90)
sum(altura<1.70)

# 11. ---------------------------------------------------------------------

altura[4] <- 1.70

# 12. ---------------------------------------------------------------------

bmi_calculator <- function(peso, altura) {
  peso / (altura^2)
}

bmi <- bmi_calculator(peso, altura)

str(bmi)
class(bmi)
length(bmi)

# Exemple of this function's usefulness
# library(data.table)
# library(ggplot2)
# library(magrittr)
# dt_bmi <- CJ(peso = seq(40, 160, 2), altura = seq(1.40, 2.20, 0.02))
# dt_bmi[, bmi := round(bmi_calculator(peso, altura))]
# dt_bmi[, bmi_label := fcase(bmi %between% c(40, 100), "Extremely obese",
#                             bmi %between% c(30, 39), "Obese",
#                             bmi %between% c(25, 29), "Overweight",
#                             bmi %between% c(19, 24), "Healthy",
#                             bmi %between% c(0, 18), "Underweight")]
#
# dt_bmi[, bmi_label := factor(bmi_label, levels = rev(c("Extremely obese", "Obese", "Overweight", "Healthy", "Underweight")))]
# dt_bmi %>%
#   ggplot(aes(peso, altura, fill = bmi_label)) +
#   geom_tile() +
#   # geom_text(aes(label = round(bmi))) +
#   scale_fill_brewer() +
#   scale_x_continuous(breaks = seq(40, 160, 10)) +
#   scale_y_continuous(breaks = seq(1.40, 2.2, 0.1)) +
#   coord_cartesian(expand = FALSE, clip = "off")


# 13. ---------------------------------------------------------------------

bmi <- c(bmi, 23)

# 14. ---------------------------------------------------------------------

c("Peso normal", "Excesso de peso", "Obesidade", "Super obesidade")

bmi_names <- c()

for(i in seq(bmi)) {
  if(bmi[i] >= 20 & bmi[i] <= 24) bmi_names[i] <- "Peso normal"
  if(bmi[i] >= 25 & bmi[i] <= 30) bmi_names[i] <- "Excesso de peso"
  if(bmi[i] >= 30 & bmi[i] <= 35) bmi_names[i] <- "Obesidade"
  if(bmi[i] > 35) bmi_names[i] <- "Super obesidade"
}



names(bmi)

bmi[bmi >= 20 & bmi <= 24] <- "Peso normal"
bmi[bmi >= 25 & bmi <= 29] <- "Excesso de peso"
bmi[bmi >=30 & bmi <= 35] <- "Obesidade"
bmi[bmi > 35] <- "Super obesidade"
bmi

# 15. ---------------------------------------------------------------------
# 16. ---------------------------------------------------------------------
# 17. ---------------------------------------------------------------------
# 18. ---------------------------------------------------------------------
# 19. ---------------------------------------------------------------------
# 20. ---------------------------------------------------------------------
# 21. ---------------------------------------------------------------------
# 22. ---------------------------------------------------------------------
# 23. ---------------------------------------------------------------------
# 24. ---------------------------------------------------------------------
# 25. ---------------------------------------------------------------------
# 26. ---------------------------------------------------------------------
# 27. ---------------------------------------------------------------------
# 28. ---------------------------------------------------------------------
# 29. ---------------------------------------------------------------------
# 30. ---------------------------------------------------------------------
# 31. ---------------------------------------------------------------------
# 32. ---------------------------------------------------------------------
# 33. ---------------------------------------------------------------------

