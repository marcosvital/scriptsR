######################################
#Script 2 de bioestat�stica###########
#M�dia, mediana, histogramas e etcs###
#Prof Marcos Vital UFAL###############
#13-02-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo pr�tica1.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 

############################################################################

mean(Riqueza)  #Calcula a m�dia
sd(Riqueza)	    #Calcula o desvio padr�o

quantile(Riqueza)  #Calcula mediana, quartis, m�ximo e m�nimo
quantile(Abund_sp1) #O mesmo, para a abund�ncia da sp1


#Olhando para partes de um objeto:
##objeto[linhas, colunas]

dados[10, ]  #Mostra apenas a linha 10
dados[ ,3]   #Mostra apenas a coluna

dados[ ,"�rea"] #O mesmo que acima, mas usando o nome da coluna

dados[15, "�rea"]  #Aqui pedimos a �rea do fragmento 15

dados[1:5, ]  #Mostra as linhas 1 a 5

dados[10:15, "Riqueza"]  #Mostra a Riqueza das linhas 10 a 15

#Tamb�m vale para vari�veis!

Riqueza[�rea>100]  #A riqueza das �reas com mais de 100 km2

Riqueza[Ambiente=="prim�rio"]  #A riqueza para os ambientes de mata prim�ria

####
#Comparando riqueza da mata prim�ria com secund�ria:
mean(Riqueza[Ambiente=="prim�rio"])
mean(Riqueza[Ambiente=="secund�rio"])

#Um jeito mais r�pidos:
tapply(Riqueza, Ambiente, mean)

#tapply(vari�vel quantitativa, vari�vel categ�rica, o que eu quero saber)

#Outros exemplos:
tapply(Riqueza, Ambiente, sd)
tapply(�rea, Ambiente, quantile)

###
mean(Riqueza[�rea>100])  #Riqueza m�dia em �reas maiores que 100
mean(Riqueza[�rea<=80])  #Riqueza m�dia em �reas menores ou iguais a 80

mean(Riqueza[Ambiente=="prim�rio" & �rea>100]) #Aqui combinamos as duas condi��es!

###########################################

#Agora vamos construir histogramas!

hist(Riqueza)  #Cria um histograma da vari�vel Riqueza

#Vamos elaborar:
hist(Riqueza, col="gray", ylab="Frequ�ncia de valores",
xlab="Riqueza de esp�cies", main="", las=1)

#col determina a cor
#ylab e xlab d�o nomes aos eixos
#main determina o t�tulo
#las=1 faz os n�meros ficarem na horizontal


cores<-c("blue", "pink", "red",
"yellow", "black", "green", "gray", "purple")

hist(Riqueza, col=cores, main="Cores!!! :D")
