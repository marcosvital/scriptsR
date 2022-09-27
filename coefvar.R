#Função coef.var
#Calcula o coeficiente de variação, expresso em porcentagem
#Função criada por Marcos V C Vital, da Academia do R
#Criada em R 4.0.3


#Criando a função:
coef.var <- function (valores) {
  (sd(valores, na.rm=T) / mean(valores, na.rm=T))*100
}

#Basta inserir o conjunto de valores usados para calcular o coeficiente em 'valores', usando o formato: coef.var(valores)

#exemplo de uso: coef.var(airquality$Ozone)

