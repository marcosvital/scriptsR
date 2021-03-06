###########################################
#Explorando dados multivariados           #
#Estat�stica multivariada, ufal, 2018     #
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

#Visualizando os pontos de coleta no espa�o (vers�o b�sica):
plot(spa$X, spa$Y)

#Vers�o melhorada:
plot(spa$X, spa$Y, las=1, xlab="Longitude", ylab="Latitude", type="l",
lty=2, col="blue", lwd=2)

#las=1 deixa os n�meros na horizontal
#xlab e ylab d�o nomes aos eixos
#type="l" define o gr�fico de linhas (se fosse "p", seriam pontos)
#lty=2 determina a linha tracejada
#col="blue" define a cor
#lwd=2 define a espessura da linha

#Vers�o melhorada 2:
plot(spa$X, spa$Y, las=1, xlab="Longitude", ylab="Latitude", type="l",
lty=2, col="blue", lwd=2)

text(spa$X, spa$Y, labels=row.names(spa), adj=0)

#text adiciona o texto em um gr�fico que j� existe (tem que estar aberto)
#labels define os nomes a serem usados (e row.names "chama" os nomes das linhas)
#adj=0 faz o nome ficar um pouquinho deslocado para a esquerda (pos faz isso para a direita)


#Vers�o 3:
plot(spa$X, spa$Y, las=1, xlab="Longitude", ylab="Latitude", type="l",
lty=2, col="blue", lwd=2)

points(spa$X, spa$Y, pch=21, col="blue", bg="gray")

#points adicionou os pontos:
#pch define o tipo de s�mbolo (no caso, bolinha com contorno e cor por dentro)
#col define a cor da borda do s�mbolo
#bg define a cor de dentro do s�mbolo

#######################################

#Continuando a explora��o


####AVISO - S� PRECISA INSTALAR UMA VEZ#####
#Instalando o pacote:
install.packages("vegan")
#############################################

#Carregando o pacote (isso voc� tem que fazer todas as vezes):
library(vegan)

#Calculando o n�mero de esp�cies em cada ponto amostral:
riqueza<-specnumber(peixes)

#Olhando os valores
riqueza

##Gr�fico maneiro com pontos mostrando n�mero de esp�cies:
plot(spa$X, spa$Y, las=1, xlab="Longitude", ylab="Latitude", type="l",
lty=2, col="blue", lwd=2, ylim=c(20,120), xlim=c(-10, 160))

points(spa$X, spa$Y, pch=21, col="blue", bg="gray", cex=riqueza/4)
points(spa$X, spa$Y, pch=16, cex=0.3)

points(-7, 118, pch=21, col="blue", bg="gray", cex=2.5)
text(-7, 118, pos=4, labels=" 10 esp�cies")
legend("topleft", "                          ")


##################################

pairs(amb)

source("https://raw.githubusercontent.com/marcosvital/scriptsR/master/panel.cor.R")
source("https://raw.githubusercontent.com/marcosvital/scriptsR/master/panel.hist.R")

pairs(amb, diag.panel=panel.hist, upper.panel=panel.cor)


#################################














