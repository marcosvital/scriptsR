######################################
#Script 2 de bioestatística###########
#Média, mediana, histogramas e etcs###
#Prof Marcos Vital UFAL###############
#13-02-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo prática1.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 

############################################################################

mean(Riqueza)  #Calcula a média
sd(Riqueza)	    #Calcula o desvio padrão

quantile(Riqueza)  #Calcula mediana, quartis, máximo e mínimo
quantile(Abund_sp1) #O mesmo, para a abundância da sp1


#Olhando para partes de um objeto:
##objeto[linhas, colunas]

dados[10, ]  #Mostra apenas a linha 10
dados[ ,3]   #Mostra apenas a coluna

dados[ ,"Área"] #O mesmo que acima, mas usando o nome da coluna

dados[15, "Área"]  #Aqui pedimos a área do fragmento 15

dados[1:5, ]  #Mostra as linhas 1 a 5

dados[10:15, "Riqueza"]  #Mostra a Riqueza das linhas 10 a 15

#Também vale para variáveis!

Riqueza[Área>100]  #A riqueza das áreas com mais de 100 km2

Riqueza[Ambiente=="primário"]  #A riqueza para os ambientes de mata primária

####
#Comparando riqueza da mata primária com secundária:
mean(Riqueza[Ambiente=="primário"])
mean(Riqueza[Ambiente=="secundário"])

#Um jeito mais rápidos:
tapply(Riqueza, Ambiente, mean)

#tapply(variável quantitativa, variável categórica, o que eu quero saber)

#Outros exemplos:
tapply(Riqueza, Ambiente, sd)
tapply(Área, Ambiente, quantile)

###
mean(Riqueza[Área>100])  #Riqueza média em áreas maiores que 100
mean(Riqueza[Área<=80])  #Riqueza média em áreas menores ou iguais a 80

mean(Riqueza[Ambiente=="primário" & Área>100]) #Aqui combinamos as duas condições!

###########################################

#Agora vamos construir histogramas!

hist(Riqueza)  #Cria um histograma da variável Riqueza

#Vamos elaborar:
hist(Riqueza, col="gray", ylab="Frequência de valores",
xlab="Riqueza de espécies", main="", las=1)

#col determina a cor
#ylab e xlab dão nomes aos eixos
#main determina o título
#las=1 faz os números ficarem na horizontal


cores<-c("blue", "pink", "red",
"yellow", "black", "green", "gray", "purple")

hist(Riqueza, col=cores, main="Cores!!! :D")
