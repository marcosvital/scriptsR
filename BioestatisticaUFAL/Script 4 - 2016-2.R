######################################
#Script 4 de bioestatística###########
#Gráficos no R########################
#Prof Marcos Vital UFAL###############
#06-03-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo prática1.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 

############################################################################

##Conferindo os dados com um histograma
#

hist(Riqueza, col="gray")

hist(Abund_sp1, col="gray")


##Boxplot
#Um gráfico que mostra mediana e quartis

boxplot(Abund_sp1~Ambiente, range=0, las=1,
xlab="Tipo de ambiente", ylab="Abundância da espécie 1")
#range=0 faz as barrinhas se estenderem do mínimo ao máximo


##Gráfico de médias

#Aviso: primeiro, você precisa instalar o pacote
#Isto pode ser feito via menu "Pacotes"
#E antes de usar, precisamos carregar (isso vale para cada sessão do R)

library(sciplot)

lineplot.CI(Ambiente, Riqueza, type="p", las=1,
xlab="Tipo de ambiente", ylab="Número de espécies")
