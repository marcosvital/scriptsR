#############################
#Médias, medianas e CIA     #
#Prof Marcos Vital          #
#Bioestatística UFAL        #
#2017-I, 14-08-2017         #
#############################

data(iris)   #Carrega o conjunto de dados chamado iris
			   #Agora, iris é um objeto na memória do R!

#Se eu quiser ver os objetos na memória, posso pedir assim:
ls()

summary(iris)  #Mostra um resumo do que existe no objeto iris
				 #Perceba que ele diferencia variáveis quantitativas de categóricas


#############################

#Vendo partes de um objeto

iris   #Mostra todo o objeto no console (mas não é muito prático...)

iris[17, 3]    #Mostra o valor da linha 17, coluna 3
iris[5:10, 3]  #Mostra os valores das linhas 5 a 10, coluna 3
iris[15, 2:4]  #Mostra os valores da linha 15, colunas 2 a 4
iris[1:3, ]    #Mostra os valores das linhas 1 a 3, todas as colunas
iris[ , 2]     #Mostra os valores de todas as linhas, coluna 2
               #A regra geral é: objeto[linhas, colunas]

iris$Sepal.Width  #Aqui pedimos os valores de largura da sépala
                  #O que dá na mesma que fazer assim:
iris[ , 2]        #Aqui é a mesma coisa, mas chamamos pela numeração, e não pelo nome


######################################

#Vamos aprender alguns cálculos estatísticos simples:

mean(iris$Sepal.Width)   #Calcula a média (de largura da sépala)
var(iris$Sepal.Width)    #Calcula a variância
sd(iris$Sepal.Width)     #Calcula o desvio padrão

median(iris$Sepal.Width)   #Calcula a mediana
quantile(iris$Sepal.Width) #Calcula alguns percentis
								#Também é possível usar a função quantile para calcular outros percentis

##
#Calculando para cada espécie:

tapply(iris$Sepal.Width, iris$Species, mean)

#tapply funciona assim:tapply(variável quantitativa, variável categórica, o que calcular)

#Se eu quiser, posso fazer o mesmo para o desvio padrão:
tapply(iris$Sepal.Width, iris$Species, sd)

#Comparando medianas e quartis:
tapply(iris$Sepal.Width, iris$Species, quantile)

##
#Boxplot: nosso primeiro gráfico no R!

boxplot(iris$Sepal.Width~iris$Species, range=0)
	#boxplot é a função que cria o gráfico
	#usamos o formato y~x, que significa "y responde a x"
	#range=0 faz com que as barrinhas externas cheguem aos valores mínimos e máximos







