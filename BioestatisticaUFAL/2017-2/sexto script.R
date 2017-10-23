########################################
#Bioestatistica UFAL, 2017-2           #
#Scrpit 6, Regressão linear simples    #
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

#Cria o modelo de regressão:
resultado<-lm(dados$Riqueza~dados$Área)

#Mostra o resultado
summary(resultado)

#O gráfico:
plot(dados$Riqueza~dados$Área)
abline(resultado)

#O gráfico, versão fofinha:
plot(dados$Riqueza~dados$Área, pch=16, las=1,
xlab="Área do fragmento", ylab="Número de espécies")
abline(resultado, lty=2, col="red")








