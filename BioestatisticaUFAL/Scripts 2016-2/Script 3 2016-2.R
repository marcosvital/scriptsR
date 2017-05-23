######################################
#Script 3 de bioestatística###########
#Gráficos no R########################
#Prof Marcos Vital UFAL###############
#20-02-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo prática1.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 

############################################################################

#Gráfico de dispersão

plot(Riqueza~Área)     #Gráfico basicão

#Melhorando o gráfico:
plot(Riqueza~Área, las=1, pch=16,
xlab="Área do fragmento", ylab="Número de espécies")

#####
#Criando um gráfico que diferencia os ambientes:

cores<-c("green4", "red4")

plot(Riqueza~Área, las=1, pch=16,
xlab="Área do fragmento", ylab="Número de espécies",
col=cores[Ambiente])

nomes<-c("Mata primária", "Mata secundária")

legend("topleft" ,nomes, pch=16, col=cores)

#####

