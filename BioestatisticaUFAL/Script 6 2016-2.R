######################################
#Script 6 de bioestatística###########
#Teste T de Student###################
#Prof Marcos Vital UFAL###############
#17-04-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo prática1.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 

############################################################################
#Neste script vamos comparar o número de espécies (riqueza)
#da mata primária com o da mata secundária


#Se eu quiser calcular as duas médias:
tapply(Riqueza, Ambiente, mean)  #tapply(var. quant., var. cat., parâmetro)

#Se eu quiser fazer um gráfico de médias:
library(sciplot)  #Carrega o pacote necessário

lineplot.CI(Ambiente, Riqueza, las=1, type="p", xlab="Ambiente", 
ylab="Riqueza de espécies")

#A função lineplot.CI representa a média e o erro padrão

##O teste T

t.test(Riqueza~Ambiente, var.equal=T)

#No resultado, o nosso valor de p foi menor que 0.05
#Então vamos rejeitar a hipótese nula
#E a nossa conclusão é de que a mata primária tem uma riqueza média
#maior do que a secundária

