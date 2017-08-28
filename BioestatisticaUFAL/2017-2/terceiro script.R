########################################
#Bioestatistica UFAL, 2017-2           #
#Scrpit 3, leitura de dados            #
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

#Revendo rapidão a parte de estatística descritiva

mean(dados$Riqueza)     #Calcula a riqueza média
sd(dados$Riqueza)       #Calcula o desvio padrão da riqueza
quantile(dados$Riqueza) #Mediana, quartis, máximo e mínimo

##
#A função tapply pode ser usada para calcular algo de uma
#variável quantitativa de acordo com uma variável categórica
#O formato é sempre:
#tapply(var.quantitiva, var.categórica, o que você quer calcular )

tapply(dados$Riqueza, dados$Ambiente, mean)  #Aqui usamos para média
tapply(dados$Riqueza, dados$Ambiente, sd)   #E aqui, para desvio padrão

############################################################

##
#Gráficos! \o/

##
#Histogramas:

hist(dados$Riqueza)
hist(dados$Abund_sp1)

#Melhorando o histograma:
hist(dados$Riqueza, main=" ", col="gray",
xlab="Número de espécies", ylab="Frequência", las=1)

#Explicando:
#main determina o título (se deixar em branco, fica sem)
#col determina a cor das barras
#xlab e ylab determinam os nomes dos eixos
#las determina a orientação dos números (=1 para todos na horizontal)








