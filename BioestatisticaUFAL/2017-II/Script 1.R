##############################################
#Bioestat�stica UFAL                         #
#Script 1: leitura de dados e gr�ficos       #
#Prof Marcos Vital                           #
#Abril de 2018                               #
##############################################

##
# 1 - Onde est�o os dados?

#Estabelecedo a pasta de trabalho:
setwd("D:/Documentos/Bioestatistica 2017-2")

#Listado os arquivos:
dir()

# 2 - Quem s�o os dados?

#Lendo o arquivo:
dados<-read.table("pratica1.txt", header=T)

#Resumindo os dados:
summary(dados)

##################################################

##Gr�ficos no R!!!!

##
#Histograma

hist(dados$�rea)
hist(dados$Riqueza)
hist(dados$Abund_sp1)

#Construindo um histograma fofinho:
hist(dados$Riqueza, col="pink4", las=1, main=" ",
 xlab="N�mero de esp�cies", ylab="Frequ�ncia")


#Argumentos �teis:
#col determina a cor das barras
#las=1 faz os n�mero ficarem na horizontal
#main determina o t�tulo, sempre entre aspas (deixar em branco, para ficar sem)




#Vers�o super colorida:
hist(dados$Riqueza, col=1:8)


####################################################

#Gr�ficos e erro padr�o

#S� use este comando se voc� ainda n�o tem o pacote:
install.packages("sciplot")

#Este voc� precisa usar toda vez que fechar o R e abrir de novo:
library(sciplot)

#Criando o gr�fico:
lineplot.CI(dados$Ambiente, dados$Riqueza, type="p",
xlab="Tipo de Ambiente", ylab="N�mero de esp�cies", las=1)






