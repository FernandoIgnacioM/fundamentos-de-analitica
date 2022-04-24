# carga de archivo excel
library(readxl)
autoslagos <- read_excel("~/autoslagos.xlsx", 
                         col_types = c("text", "numeric", "text", 
                                       "numeric", "text", "text", "text", 
                                       "text", "skip"))
View(autoslagos)

#---- operadores de asignacion ----

a = 2
b <- 5

# operadores aritmeticos

a + b
a - b
a * b
a / b
a ** b; a^b # potencia
a %% b # modulo

# crear vectores

v1 <- c(4, 6, 5, 4)
#v1[4]

v2 <- c(6, 8, 7, 2)

v1 + v2
v1 * v2

# producto por un escalar 2
v1 * 2

# restarle a cada elemento del vector 2
v1 - 2

# dividir a cada elemento del vector 2
v1 / 2

# elevar a 2 cada elemento del vector

v1 ** 2

# producto escalar
#v1 %*% v2

# estadistica univariante

# suma de todos sus elementos
sum(v1)

#---- medidas de posicion ----
# media 
mean(v1)

# mediana
median(v1)

quantile(v1, c(.1, .25, .5, .75))

#---- medidas de dispersión ----
range(v1) # rango
IQR(v1) # rango intercuartilico
var(v1) # varianza
sd(v1) # desviacion tipica
mean(autoslagos$Kilometraje)

#---- estadistica bivariante ----
cov(autoslagos$Kilometraje, autoslagos$Precio) # covarianza
cor(autoslagos$Kilometraje, autoslagos$Precio) # correlacion de Pearson

library(tidyverse)
# filtros
autos2 <- filter(autoslagos, Kilometraje < 100000) 

autos2 <- filter(autoslagos, UnicoDuenio == "Si")

resumen_precio <- autoslagos %>% filter(Kilometraje < 100000) %>% group_by(Fabricante) %>% 
  summarise(media_precio = mean(Precio))

autoslagos %>% group_by(Fabricante) %>% 
  summarise(media_precio = mean(Precio), mediana_precio = median(Precio), variacion_precio = sd(Precio))
