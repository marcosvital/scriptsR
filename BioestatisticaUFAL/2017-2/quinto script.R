#########################################
#Bioestatística, 2016-2, ICBS UFAL      #
#Prof Marcos Vital                      #
#Script 5: teste T de Student           #
#########################################

##Lendo os dados:

#Determinando a pasta de trabalho:
setwd("D:/Documentos/Bioestatistica 2017-2")

#Conferindo os arquivos da pasta:
dir()

#Lendo o arquivo de dados:
dados<-read.table("pratica1.txt", h=T)

#Conferindo os dados:
summary(dados)

###################################################


#Teste T:

t.test(dados$Riqueza~dados$Ambiente, var.equal=T)




