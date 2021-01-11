#Meu primeiro script do R <3
#Marcos Vital, 06-01-2021
#Disciplina Ferramentas Computacionais, UFAL

# O R faz operações matemáticas simples:
10 + 10  #soma
20 - 35  #subtração
13 * 3   #multiplicação
14 / 8   #divisão

#E se eu quiser calcular raiz ou log?
#Vamos usar uma função!
#Uma função SEMPRE é um nome seguido de parênteses
#Dentro dos parênteses podem ir argumentos
#Os argumentos são separados por vírgulas

sqrt(10)      #Calcula raiz quadrada
log(557, 10)  #Calcula log(número, base)

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

#Acima, usamos a função data() para abrir o conjunto 'iris'
#'iris' é um conjunto de dados de exemplo, que existe na memória do R

#Agora, iris é um objeto na memória do R
#Se você "chamar" o objeto no console, o R tenta mostrar o conteúdo
#Veja por você:
iris

#######
#Alguns comandos básicos para se lidar com dados

summary(iris)  #Dá um resumo dos dados

#Sempre que temos uma tabela de dados (data.frame, na linguagem do R)
#nós podemos lidar com um formato de [linhas, colunas]

iris[37 , 1]      #Comprimento da sépala da flor 37 (ou seja, linha 37, coluna 1)
iris[ , 2]        #Apenas os valores da coluna 2 (largura da sépala)
iris[15, ]        #Apenas os valores da flor na linha 15 (para todas as colunas)
iris[10:20 , 3:4] #Valores das linhas 10 até 20, colunas 3 até 4

#Alternativamente, ou, dependendo do contexto, podemos usar os nomes das coisas
iris$Sepal.Width  #Mostrando apenas os valores da coluna 2 (largura da sépala)

#Isto vale apenas para nomes de colunas! Depois vamos ver como usar os nomes
#de categorias de variáveis categóricas.


######
#Alguns comandos básicos com fins estatísticos

#Calculando a média do comprimento da pétala (os dois métodos fazem a mesma coisa):
mean(iris[ , 3])
mean(iris$Petal.Length)

#Alguns comandos simples:
sd(iris$Petal.Length)       #Desvio padrão
var(iris$Petal.Length)      #Variância
median(iris$Petal.Length)   #Mediana
quantile(iris$Petal.Length) #Mínimo, 1o quartil, mediana, 3o quartil, máximo

####################################
##Vamos calcular o comprimento médio das pétalas para cada espécie
#Vou fazer por caminhos diferentes

#Podemos fazer isso "chamando" as linhas correspondentes:
mean(iris[1:50 , 3])      #setosa 
mean(iris[51:100 , 3])    #versicolor
mean(iris[101:150 , 3])   #virginica

#Podemos fazer de forma compacta com a função tapply:
tapply(iris$Petal.Length, iris$Species, mean)

#A função tapply sempre segue o seguinte padrão de argumentos:
#A variável a ser calculada, a variável categórica de referência, e o que se quer calcular

#Mas vou mostrar uma terceiro caminho ainda, também um pouco trabalhoso:
mean(iris$Petal.Length[iris$Species=="setosa"])
mean(iris$Petal.Length[iris$Species=="versicolor"])
mean(iris$Petal.Length[iris$Species=="virginica"])

#########################################

######
#Vamos fazer alguns gráficos!

##
#Boxplot:
boxplot(iris$Petal.Length ~ iris$Species, range=0, las=1, xlab="Espécie",
ylab="Comprimento da pétala")

##Argumentos dos boxplots:
#range=0 define os tracejados para irem até mínimo e máximo


#Histograma
hist(iris$Petal.Length, las=1, xlab="Tamanho da pétala", ylab="Frequência",
main=" ", ylim=c(0, 40))

#Histograma apenas para a espécie Iris setosa
hist(iris$Petal.Length[iris$Species=="setosa"], las=1, xlab="Tamanho da pétala", ylab="Frequência",
main=" ", ylim=c(0, 15), xlim=c(1, 2), col="red4")


#Gráfico de dispersão básico
plot(iris$Petal.Length ~ iris$Sepal.Length, pch=16, las=1,
xlab="Comprimento da sépala", ylab="Comprimento da pétala")


#Gráfico de dispersão básico diferenciando as espécies
cores<-c("red", "blue", "green")

plot(iris$Petal.Length ~ iris$Sepal.Length, pch=16, las=1,
xlab="Comprimento da sépala", ylab="Comprimento da pétala",
col=cores[iris$Species])

legend("bottomright", levels(iris$Species), pch=16, col=cores)


##Argumentos gerais de gráfico:
#las define a orientação dos valores nos eixos (experimente valores de 0 a 3)
#xlab e ylab definem os nomes dos eixos x e y
#main determina o título de um gráfico, sempre entre aspas
#xlim e ylim determinam valores iniciais e finais dos eixos
#os valores acima precisam ser concatenados, usando c(inicial, final)
#col determina a cor dos elementos gráficos
#você pode usar nomes de cores básicas, seguidos de números de 1 a 4
#estes nomes devem estar entre aspas: "red4", "blue2", "green3", pink, purple
#em gráficos de dispersão, pch define o símbolo
#execute ?pch para ver uma lista