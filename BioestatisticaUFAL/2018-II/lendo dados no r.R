#################################
#Leitura de dados no R          #
#Prof Marcos Vital              #
#Bioestatistica UFAL, 2018-2    #
#################################

#1: Determinando a pasta de trabalho
setwd("D:/R/Bioestatistica 2018-II")

#Dica: copie o endereço lá do windows explorer
#Lembrete: as barras vem "\" mas você precisa mudar para "/"

#2: Conferindo os arquivos da pasta
dir()

#3: Lendo o arquivo
dados<-read.table("pratica1.txt", header=T)

#4: Conferindo o arquivo
summary(dados)



