###################################
#Testes estatísticos básicos      #
#Prof Marcos Vital                #
#Bioestatística 201-II            #
###################################

##
#Teste T

data(sleep)       #Carregando os dados de exemplo
summary(sleep)    #Resumindo os dados

#Teste T:
t.test(sleep$extra ~ sleep$group, var.equal=T)
#No exemplo "extra" foi a variável resposta
#E "group" foi a variável explicativa

#Gráfico para ilustrar o resultado:
library(sciplot)
lineplot.CI(sleep$group, sleep$extra, las=1, type="p",
xlab="Medicamento", ylab="Horas extra de sono")

########################

##
#ANOVA

data(iris)
summary(iris)

resultado<-aov(iris$Petal.Length ~ iris$Species)
summary(resultado)

lineplot.CI(iris$Species, iris$Petal.Length, type="p", las=1,
xlab="Espécie", ylab="Comprimento da pétala")


#########################

##
#Regressão linear simples

data(mtcars)
summary(mtcars)

resultado<-lm(mtcars$mpg ~ mtcars$hp)
summary(resultado)

plot(mtcars$mpg ~ mtcars$hp, las=1, pch=16, 
xlab="Potência do motor", ylab="Economia de combustível")
abline(resultado, col="red", lty=2)


########################

##
#Qui-quadrado

data(esoph)
summary(esoph)

tabela<-table(esoph$alcgp, esoph$tobgp)
tabela

chisq.test(tabela)