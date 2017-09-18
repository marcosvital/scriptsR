########################################
#Bioestatistica UFAL, 2017-2           #
#Scrpit 4, gráficos e mais gráficos    #
#Marcos Vital                          #
########################################

###Lendo dados no R

##Etapa 1 - Determinar a pasta de trabalho:
setwd("D:/Documentos/Bioestatistica 2017-2")

#Conferindo os arquivos da pasta:
dir()

##Etapa 2 - Lendo o arquivo desejado
dados<-read.table("pratica1.txt", header=T)

#Conferindo o objeto criado:
summary(dados)

##############################################

##
#Histogramas!

hist(dados$Riqueza)   #Comando básico

#Melhorando o histograma:

hist(dados$Riqueza, col="pink", las=1, main=" ", 
xlab="Número de espécies", ylab="Frequência")

################################################

##
#Gráficos de dispersão

#Versão básica:
plot(dados$Riqueza~dados$Área)


#Versão bonitinha:
plot(dados$Riqueza~dados$Área, pch=16, las=1,
xlab="Área do fragmento", ylab="Número de espécies")


##
#Versão diferenciando o tipo de ambiente

levels(dados$Ambiente)    #Conferindo a ordem das categorias
cores<-c("green4", "red4")   #Estabelecendo as cores a serem usadas

plot(dados$Riqueza~dados$Área, pch=16, las=1, col=cores[dados$Ambiente],
xlab="Área do fragmento", ylab="Número de espécies")

legend("topleft", pch=16, col=cores, legend=levels(dados$Ambiente))


#############################################

##
#Boxplot

boxplot(dados$Riqueza~dados$Ambiente, las=1, range=0,
xlab="Tipo de ambiente", ylab="Número de espécies")

#range=0 faz com que os tracinhos sigam do mínimo para o máximo


##
#Gráfico de médias

#Lendo uma função do github:
source("https://raw.githubusercontent.com/marcosvital/scriptsR/master/BioestatisticaUFAL/plotm%C3%A9dias.R")

plotmédias(dados$Ambiente, dados$Riqueza,
"Tipo de ambiente", "Número de espécies")


##Só pela diversão:
source("https://raw.githubusercontent.com/marcosvital/teach-R-project/master/courses/en/Funniest%20R%20course/TIEplots/TIEplot2.R")
TIEplot2(dados$Ambiente, dados$Riqueza,
"Tipo de ambiente", "Número de espécies")








