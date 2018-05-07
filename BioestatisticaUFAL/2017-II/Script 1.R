##############################################
#Bioestatística UFAL                         #
#Script 1: leitura de dados e gráficos       #
#Prof Marcos Vital                           #
#Abril de 2018                               #
##############################################

##
# 1 - Onde estão os dados?

#Estabelecedo a pasta de trabalho:
setwd("D:/Documentos/Bioestatistica 2017-2")

#Listado os arquivos:
dir()

# 2 - Quem são os dados?

#Lendo o arquivo:
dados<-read.table("pratica1.txt", header=T)

#Resumindo os dados:
summary(dados)

##################################################

##Gráficos no R!!!!

##
#Histograma

hist(dados$Área)
hist(dados$Riqueza)
hist(dados$Abund_sp1)

#Construindo um histograma fofinho:
hist(dados$Riqueza, col="pink4", las=1, main=" ",
 xlab="Número de espécies", ylab="Frequência")


#Argumentos úteis:
#col determina a cor das barras
#las=1 faz os número ficarem na horizontal
#main determina o título, sempre entre aspas (deixar em branco, para ficar sem)




#Versão super colorida:
hist(dados$Riqueza, col=1:8)


####################################################

#Gráficos e erro padrão

#Só use este comando se você ainda não tem o pacote:
install.packages("sciplot")

#Este você precisa usar toda vez que fechar o R e abrir de novo:
library(sciplot)

#Criando o gráfico:
lineplot.CI(dados$Ambiente, dados$Riqueza, type="p",
xlab="Tipo de Ambiente", ylab="Número de espécies", las=1)






