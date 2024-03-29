##########################################
#Aula de tend�ncia central e dispers�o   #
#Bioestat�stica UFAL 26-03-2018          #
#Prof Marcos Vital                       #
##########################################

#Carregando dados de exemplo:
data(iris)

#Conferindo os dados:
summary(iris)

#######################################

#Estatistica descritiva b�sica

mean(iris$Petal.Length)       #M�dia
sd(iris$Petal.Length)         #Desvio padr�o
var(iris$Petal.Length)        #Vari�ncia
quantile(iris$Petal.Length)   #Mediana, quartis e percentis

#Calculando par�metros para cada esp�cie:
tapply(iris$Petal.Length, iris$Species, mean)   #M�dia
tapply(iris$Petal.Length, iris$Species, sd)     #Desvio padr�o


#############################

#Explorando um pouco mais uma fun��o

?quantile     #Chamo o help da fun��o
percentis<-c(0, 0.1, 0.25, 0.5, 0.75, 0.9, 1)
quantile(iris$Petal.Length, percentis)


########################################

#Cenas do pr�ximo cap�tulo: gr�ficos

boxplot(iris$Petal.Length ~ iris$Species, range=0)





