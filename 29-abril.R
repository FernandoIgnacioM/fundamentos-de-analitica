data("mtcars")
mtcars

mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("Automatico", "Manual"))
mtcars$vs <- factor(mtcars$vs, levels = c(0, 1), labels = c("V-shaped", "straight"))

head(mtcars)

tablaResumen <- summary(mtcars)
tablaResumen <- as.data.frame(tablaResumen)
tablaResumen$Var1 <- NULL
tablaResumen <- tablaResumen %>% separate(col = Freq, sep = ":", into = c("medida", "valor"))
tablaResumen <- tablaResumen %>% filter(!Var2 %in% c("am", "vs"))
tablaResumen$Var2 <-  tablaResumen$Var2 %>% str_trim()

tablaResumen <-  tablaResumen %>% pivot_wider(names_from = "medida", values_from = "valor")

colnames(tablaResumen) <- c("Variable", "Minimo", "1er cuartil", "mediana", "media", "3er cuartil", "maximo")

