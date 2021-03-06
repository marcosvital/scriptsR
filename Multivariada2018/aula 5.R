############################################
#Medidas e representa��es da biodiversidade#
#Estat�stica multivariada, ufal, 2018      #
#Prof Marcos Vital                         #
#Agosto de 2018                            #
############################################

##Leitura dos dados:

peixes<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsSpe.csv", row.names=1)
peixes2<-peixes[-8, ]
rm(peixes)

library(vegan)

#######
#O b�sico - diversidade e riqueza, para todas as unidades amostrais:

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

#Vers�o em barras:
barplot(peixes.ordem, beside=T, las=2)

#Vers�o pontos e linhas:
plot(peixes.ordem, las=1, type="l", lty=2)
points(peixes.ordem, pch=16)

####################

#Curvas de ac�mulo

curva<-specaccum(peixes2)   #C�lculo da curva
plot(curva)  #Curva autom�tica, usando o vegan
curva     #Vendo os n�meros

#usando dados de exemplo do vegan:
data(dune)
curva2<-specaccum(dune)   #C�lculo da curva
plot(curva2)  #Curva autom�tica, usando o vegan
curva2     #Vendo os n�meros

#Vers�o personalizada da curva de ac�mulo:
source("https://raw.githubusercontent.com/marcosvital/scriptsR/master/curvacum.R")

curvacum(curva2, "Esfor�o amostral", "Riqueza acumulada")

