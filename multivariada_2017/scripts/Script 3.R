#Estatistica Multivariada, PPG-DIBICT UFAL
#Prof Marcos Vital
#21-08-2017
#Aula 2
##############################################

#Lendo os dados
setwd("D:/R/multivariada 2017")
#Mude o endereço acima, para o da pasta de trabalho no seu computador

spe<-read.csv("DoubsSpe.csv", row.names=1)  #Dados das espécies de peixes
env<-read.csv("DoubsEnv.csv", row.names=1)  #Variáveis ambientais nos locais de coleta
spa<-read.csv("DoubsSpa.csv", row.names=1)  #Coordenadas dos locais de coleta

#Carregando pacotes:
library(vegan)

#######################################

#Vamos criar um objeto com as variáveis físico-químicas da água:
fisqui<-env[ , 5:11]

summary(fisqui)

########################################

##Criando um cluster passo a passo
#

#Padronização dos dados (aplique quando necessário)
fisqui.pad<-decostand(fisqui, method="standardize")

#Criando a matriz de distância:
fisqui.pad.euc<-dist(fisqui.pad, method="euclidean")

#Calculando o cluster:
fisqui.pad.euc.clus<-hclust(fisqui.pad.euc, method="average")

#Calculando o coeficiente de correlação cofenética
fisq.pad.euc.coph<-cophenetic(fisqui.pad.euc.clus)
cor(fisqui.pad.euc, fisq.pad.euc.coph)

#Agora sim, vamos olhar o nosso cluster:
plot(fisqui.pad.euc.clus, hang=-1)

#Criando uma nova visualização, desta vez na horizontal:
fisqui.pad.euc.dend<-as.dendrogram(fisqui.pad.euc.clus)
plot(fisqui.pad.euc.dend, horiz=T)

#Plotando em uma janela com dimensões pré-determinadas:
windows(width=8, height=8, rescale="fixed")
plot(fisqui.pad.euc.dend, horiz=T)

#####################################################













