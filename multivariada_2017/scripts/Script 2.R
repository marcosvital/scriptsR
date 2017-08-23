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

##
#Trabalhando com os dados das espécies

specnumber(spe)

#Vamos remover a linha 8, que não tem espécies registradas
#Faremos isso apenas para o cálculo das matrizes de distância
#Por segurança, vou criar um novo objeto:

spe_8<-spe[-8, ]
specnumber(spe_8)

#Antes de começar, vamos espiar rapidamente os valores de
#abundância das espécies

#Abundância por espécie:
abund.sp<-colSums(spe_8)
abund.sp
hist(abund.sp, col="gray")

#Abundância por unidade amostral:
abund.ua<-rowSums(spe_8)
abund.ua
hist(abund.ua, col="gray")

#Vamos seguir sem tranformação dos dados

##Calculando o cluster por bray-curtis:
#1 - Neste caso, nao precisamos transformar ou padronizar
#2 - Calcular a matriz:
spe.bray<-vegdist(spe_8, method="bray")
#3 - Calcular o cluster:
spe.bray.clus<-hclust(spe.bray, method="average")
4 - Coeficiente de correlação cofenética:
spe.bray.coph<-cophenetic(spe.bray.clus)
cor(spe.bray.coph, spe.bray)
5 - Agora sim, visualizar o cluster:
spe.bray.dend<-as.dendrogram(spe.bray.clus)
plot(spe.bray.dend, horiz=T)

######

#Se quiser fazer o mesmo com Jaccard, use:
#method="jaccard", binary=T nos argumentos de vegdist
#binary=T é essencial, a não ser que os dados já sejam binários

###################################

##
#Criando um mapa de calor usando a função coldiss (do livro)

#Carregue o pacote necessário

#install.packages("gclus")  #Se precisar instalar o pacote, execute isso
library(gclus)

source("coldiss.R")

coldiss(spe.bray)
#O argumento nc determina o número de cores usadas



