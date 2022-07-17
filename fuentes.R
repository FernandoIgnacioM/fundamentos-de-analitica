
library(extrafont)

install.packages("remotes")


# si en este paso les salta error instalar rtools link en la linea 25
remotes::install_version("Rttf2pt1", version = "1.3.8")


font_import() # solo se ejecuta 1 sola vez

loadfonts() # cargar fuentes


library(tidyverse)
data("mtcars")
mtcars %>% ggplot(aes(x = wt, y = mpg)) + geom_point() + labs(title = "titulo cualquiera") +
  theme(plot.title = element_text(family = "Times New Roman", hjust = .5), axis.text = element_text(family = "Comic Sans MS"),
        axis.title = element_text(family = "Impact"))



# enlace para rtoools
https://cran.r-project.org/bin/windows/Rtools/rtools42/rtools.html