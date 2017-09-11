########################################
#Bioestatistica UFAL, 2017-2           #
#Scrpit 4, gráficos e mais gráficos    #
#Marcos Vital                          #
########################################

###Lendo dados no R

##Etapa 1 - Determinar a pasta de trabalho:
setwd("C:/Users/Aluno/Documents/Bioestatistica 2017-2")

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











