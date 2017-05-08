######################################
#Script 8 de bioestatística###########
#Regressão linear simples#############
#Prof Marcos Vital UFAL###############
#17-04-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo prática1.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 
############################################################################

#Só pra relembrar:
plot(Riqueza~Área, pch=16)

#Fazendo a regressão:
resultado<-lm(Riqueza~Área)
summary(resultado)

#O gráfico:
plot(Riqueza~Área, pch=16)
abline(resultado, lty=2, col="red")


######################################################

#Desafio: separando os dados dos tipos de mata
#E refazendo a análise em cada um

#Vamos fazer isso usando as condições entre colchetes

resultado.p<-lm(Riqueza[Ambiente=="primário"]~Área[Ambiente=="primário"])
resultado.s<-lm(Riqueza[Ambiente=="secundário"]~Área[Ambiente=="secundário"])

summary(resultado.p)
summary(resultado.s)

#Vou fazer um gráfico com os dois elementos diferenciados:
cores<-c("green4", "red4")
legenda<-c("Mata Primária", "Mata Secundária")
plot(Riqueza~Área, col=cores[Ambiente], pch=16, las=1)
legend("topleft", legend=legenda, pch=16, col=cores)
abline(resultado.p, lty=2, col="green4")
abline(resultado.s, lty=2, col="red4")
