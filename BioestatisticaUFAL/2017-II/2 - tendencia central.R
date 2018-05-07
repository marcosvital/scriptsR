##########################################
#Aula de tendência central e dispersão   #
#Bioestatística UFAL 26-03-2018          #
#Prof Marcos Vital                       #
##########################################

#Carregando dados de exemplo:
data(iris)

#Conferindo os dados:
summary(iris)

#######################################

#Estatistica descritiva básica

mean(iris$Petal.Length)       #Média
sd(iris$Petal.Length)         #Desvio padrão
var(iris$Petal.Length)        #Variância
quantile(iris$Petal.Length)   #Mediana, quartis e percentis

#Calculando parâmetros para cada espécie:
tapply(iris$Petal.Length, iris$Species, mean)   #Média
tapply(iris$Petal.Length, iris$Species, sd)     #Desvio padrão


#############################

#Explorando um pouco mais uma função

?quantile     #Chamo o help da função
percentis<-c(0, 0.1, 0.25, 0.5, 0.75, 0.9, 1)
quantile(iris$Petal.Length, percentis)


########################################

#Cenas do próximo capítulo: gráficos

boxplot(iris$Petal.Length ~ iris$Species, range=0)





