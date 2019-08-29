############################################
#Medidas e representações da biodiversidade#
#Estatística multivariada, ufal, 2018      #
#Prof Marcos Vital                         #
#Agosto de 2018                            #
############################################

##Leitura dos dados:

peixes<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsSpe.csv", row.names=1)
peixes2<-peixes[-8, ]
rm(peixes)

library(vegan)

#######
#O básico - diversidade e riqueza, para todas as unidades amostrais:

specnumber(peixes2)                      #Riqueza
diversity(peixes2, index="shannon")      #Diversidade de Shannon

#Se eu quiser o total:
peixes.soma<-colSums(peixes2)

peixes.soma

specnumber(peixes.soma)
diversity(peixes.soma, index="shannon")

#########

#Diagrama de Whitakker

peixes.total<-sum(peixes.soma)
peixes.total

peixes.rel<-peixes.soma/peixes.total
peixes.rel

#Colocando em ordem decrescente:
peixes.ordem<-sort(peixes.rel, decreasing=T)
peixes.ordem

#Versão em barras:
barplot(peixes.ordem, beside=T, las=2)

#Versão pontos e linhas:
plot(peixes.ordem, las=1, type="l", lty=2)
points(peixes.ordem, pch=16)

####################

#Curvas de acúmulo

curva<-specaccum(peixes2)   #Cálculo da curva
plot(curva)  #Curva automática, usando o vegan
curva     #Vendo os números

#usando dados de exemplo do vegan:
data(dune)
curva2<-specaccum(dune)   #Cálculo da curva
plot(curva2)  #Curva automática, usando o vegan
curva2     #Vendo os números

#Versão personalizada da curva de acúmulo:
source("https://raw.githubusercontent.com/marcosvital/scriptsR/master/curvacum.R")

curvacum(curva2, "Esforço amostral", "Riqueza acumulada")

