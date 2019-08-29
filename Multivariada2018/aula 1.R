###########################################
#Explorando dados multivariados           #
#Estatística multivariada, ufal, 2018     #
#Prof Marcos Vital                        #
#Agosto de 2018                           #
###########################################

##Leitura dos dados:

#Lendo o arquivo:
amb<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsEnv.csv", row.names=1)
#Pedindo um resumo:
summary(amb)

#Agora para os dados de coordenadas:
spa<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsSpa.csv", row.names=1)
#Vendo os dados na tela:
spa

#E por fim, os dados dos peixes:
peixes<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsSpe.csv", row.names=1)
#Olhando a estrutura dos dados:
str(peixes)


#############################################

#Visualizando os pontos de coleta no espaço (versão básica):
plot(spa$X, spa$Y)

#Versão melhorada:
plot(spa$X, spa$Y, las=1, xlab="Longitude", ylab="Latitude", type="l",
lty=2, col="blue", lwd=2)

#las=1 deixa os números na horizontal
#xlab e ylab dão nomes aos eixos
#type="l" define o gráfico de linhas (se fosse "p", seriam pontos)
#lty=2 determina a linha tracejada
#col="blue" define a cor
#lwd=2 define a espessura da linha

#Versão melhorada 2:
plot(spa$X, spa$Y, las=1, xlab="Longitude", ylab="Latitude", type="l",
lty=2, col="blue", lwd=2)

text(spa$X, spa$Y, labels=row.names(spa), adj=0)

#text adiciona o texto em um gráfico que já existe (tem que estar aberto)
#labels define os nomes a serem usados (e row.names "chama" os nomes das linhas)
#adj=0 faz o nome ficar um pouquinho deslocado para a esquerda (pos faz isso para a direita)


#Versão 3:
plot(spa$X, spa$Y, las=1, xlab="Longitude", ylab="Latitude", type="l",
lty=2, col="blue", lwd=2)

points(spa$X, spa$Y, pch=21, col="blue", bg="gray")

#points adicionou os pontos:
#pch define o tipo de símbolo (no caso, bolinha com contorno e cor por dentro)
#col define a cor da borda do símbolo
#bg define a cor de dentro do símbolo

#######################################

#Continuando a exploração


####AVISO - SÓ PRECISA INSTALAR UMA VEZ#####
#Instalando o pacote:
install.packages("vegan")
#############################################

#Carregando o pacote (isso você tem que fazer todas as vezes):
library(vegan)

#Calculando o número de espécies em cada ponto amostral:
riqueza<-specnumber(peixes)

#Olhando os valores
riqueza

##Gráfico maneiro com pontos mostrando número de espécies:
plot(spa$X, spa$Y, las=1, xlab="Longitude", ylab="Latitude", type="l",
lty=2, col="blue", lwd=2, ylim=c(20,120), xlim=c(-10, 160))

points(spa$X, spa$Y, pch=21, col="blue", bg="gray", cex=riqueza/4)
points(spa$X, spa$Y, pch=16, cex=0.3)

points(-7, 118, pch=21, col="blue", bg="gray", cex=2.5)
text(-7, 118, pos=4, labels=" 10 espécies")
legend("topleft", "                          ")


##################################

pairs(amb)

source("https://raw.githubusercontent.com/marcosvital/scriptsR/master/panel.cor.R")
source("https://raw.githubusercontent.com/marcosvital/scriptsR/master/panel.hist.R")

pairs(amb, diag.panel=panel.hist, upper.panel=panel.cor)


#################################














