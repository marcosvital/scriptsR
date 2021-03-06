#Meu primeiro script do R <3
#Marcos Vital, 06-01-2021
#Disciplina Ferramentas Computacionais, UFAL

# O R faz opera��es matem�ticas simples:
10 + 10  #soma
20 - 35  #subtra��o
13 * 3   #multiplica��o
14 / 8   #divis�o

#E se eu quiser calcular raiz ou log?
#Vamos usar uma fun��o!
#Uma fun��o SEMPRE � um nome seguido de par�nteses
#Dentro dos par�nteses podem ir argumentos
#Os argumentos s�o separados por v�rgulas

sqrt(10)      #Calcula raiz quadrada
log(557, 10)  #Calcula log(n�mero, base)

#Vamos criar objetos simples
abacate<-10

#Posso "chamar" o objeto:
abacate

teste<-"gato"
teste

abacate*5

########################################

#Vamos ler um conjunto de dados de exemplo
data(iris)

#Acima, usamos a fun��o data() para abrir o conjunto 'iris'
#'iris' � um conjunto de dados de exemplo, que existe na mem�ria do R

#Agora, iris � um objeto na mem�ria do R
#Se voc� "chamar" o objeto no console, o R tenta mostrar o conte�do
#Veja por voc�:
iris

#######
#Alguns comandos b�sicos para se lidar com dados

summary(iris)  #D� um resumo dos dados

#Sempre que temos uma tabela de dados (data.frame, na linguagem do R)
#n�s podemos lidar com um formato de [linhas, colunas]

iris[37 , 1]      #Comprimento da s�pala da flor 37 (ou seja, linha 37, coluna 1)
iris[ , 2]        #Apenas os valores da coluna 2 (largura da s�pala)
iris[15, ]        #Apenas os valores da flor na linha 15 (para todas as colunas)
iris[10:20 , 3:4] #Valores das linhas 10 at� 20, colunas 3 at� 4

#Alternativamente, ou, dependendo do contexto, podemos usar os nomes das coisas
iris$Sepal.Width  #Mostrando apenas os valores da coluna 2 (largura da s�pala)

#Isto vale apenas para nomes de colunas! Depois vamos ver como usar os nomes
#de categorias de vari�veis categ�ricas.


######
#Alguns comandos b�sicos com fins estat�sticos

#Calculando a m�dia do comprimento da p�tala (os dois m�todos fazem a mesma coisa):
mean(iris[ , 3])
mean(iris$Petal.Length)

#Alguns comandos simples:
sd(iris$Petal.Length)       #Desvio padr�o
var(iris$Petal.Length)      #Vari�ncia
median(iris$Petal.Length)   #Mediana
quantile(iris$Petal.Length) #M�nimo, 1o quartil, mediana, 3o quartil, m�ximo

####################################
##Vamos calcular o comprimento m�dio das p�talas para cada esp�cie
#Vou fazer por caminhos diferentes

#Podemos fazer isso "chamando" as linhas correspondentes:
mean(iris[1:50 , 3])      #setosa 
mean(iris[51:100 , 3])    #versicolor
mean(iris[101:150 , 3])   #virginica

#Podemos fazer de forma compacta com a fun��o tapply:
tapply(iris$Petal.Length, iris$Species, mean)

#A fun��o tapply sempre segue o seguinte padr�o de argumentos:
#A vari�vel a ser calculada, a vari�vel categ�rica de refer�ncia, e o que se quer calcular

#Mas vou mostrar uma terceiro caminho ainda, tamb�m um pouco trabalhoso:
mean(iris$Petal.Length[iris$Species=="setosa"])
mean(iris$Petal.Length[iris$Species=="versicolor"])
mean(iris$Petal.Length[iris$Species=="virginica"])

#########################################

######
#Vamos fazer alguns gr�ficos!

##
#Boxplot:
boxplot(iris$Petal.Length ~ iris$Species, range=0, las=1, xlab="Esp�cie",
ylab="Comprimento da p�tala")

##Argumentos dos boxplots:
#range=0 define os tracejados para irem at� m�nimo e m�ximo


#Histograma
hist(iris$Petal.Length, las=1, xlab="Tamanho da p�tala", ylab="Frequ�ncia",
main=" ", ylim=c(0, 40))

#Histograma apenas para a esp�cie Iris setosa
hist(iris$Petal.Length[iris$Species=="setosa"], las=1, xlab="Tamanho da p�tala", ylab="Frequ�ncia",
main=" ", ylim=c(0, 15), xlim=c(1, 2), col="red4")


#Gr�fico de dispers�o b�sico
plot(iris$Petal.Length ~ iris$Sepal.Length, pch=16, las=1,
xlab="Comprimento da s�pala", ylab="Comprimento da p�tala")


#Gr�fico de dispers�o b�sico diferenciando as esp�cies
cores<-c("red", "blue", "green")

plot(iris$Petal.Length ~ iris$Sepal.Length, pch=16, las=1,
xlab="Comprimento da s�pala", ylab="Comprimento da p�tala",
col=cores[iris$Species])

legend("bottomright", levels(iris$Species), pch=16, col=cores)


##Argumentos gerais de gr�fico:
#las define a orienta��o dos valores nos eixos (experimente valores de 0 a 3)
#xlab e ylab definem os nomes dos eixos x e y
#main determina o t�tulo de um gr�fico, sempre entre aspas
#xlim e ylim determinam valores iniciais e finais dos eixos
#os valores acima precisam ser concatenados, usando c(inicial, final)
#col determina a cor dos elementos gr�ficos
#voc� pode usar nomes de cores b�sicas, seguidos de n�meros de 1 a 4
#estes nomes devem estar entre aspas: "red4", "blue2", "green3", pink, purple
#em gr�ficos de dispers�o, pch define o s�mbolo
#execute ?pch para ver uma lista