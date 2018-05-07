#########################
#Meu primeiro script    #
#Marcos Vital           #
#05-03-2018             #
#########################


#O R faz operações matemáticas básicas:

10+10  #Adição
15*3   #Multiplicação
17/2   #Divisão
14-50  #Subtração

#Também podemos fazer outras operação:

2^3      #Potência (no exemplo: dois ao cubo)
sqrt(15) #Raiz quadrada (usando uma função)


#################################################

# Brincando com dados de exemplo

#Carregando um conjunto de dados de exemplo, usando a função data()
data(iris)

#Se eu quiser, eu posso mostrar o objeto na tela do console
#Mas isso não é muito prático, veja só:
iris

#Uma alternativa é pedir para o R mostrar a tabela em uma janela:
View(iris)

#Mais interessante do que isso, é pedir um resumo dos dados:
summary(iris)

#Vou pedir para o R mostrar apenas os valores de comprimento de pétala
iris$Petal.Length

#Calculando a média do comprimento da pétala:
mean(iris$Petal.Length)

#Calculando a mesma média, mas agora para cada espécie:
tapply(iris$Petal.Length, iris$Species, mean)

#O tapply() sempre funciona com três argumentos:
# uma variável quantitativa
# uma variável categórica
# uma função a ser calculada


#Antes de ir embora, vamos fazer um gráfico simples:
boxplot(iris$Petal.Length~iris$Species)



