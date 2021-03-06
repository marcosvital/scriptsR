#########################
#Meu primeiro script    #
#Marcos Vital           #
#05-03-2018             #
#########################


#O R faz opera��es matem�ticas b�sicas:

10+10  #Adi��o
15*3   #Multiplica��o
17/2   #Divis�o
14-50  #Subtra��o

#Tamb�m podemos fazer outras opera��o:

2^3      #Pot�ncia (no exemplo: dois ao cubo)
sqrt(15) #Raiz quadrada (usando uma fun��o)


#################################################

# Brincando com dados de exemplo

#Carregando um conjunto de dados de exemplo, usando a fun��o data()
data(iris)

#Se eu quiser, eu posso mostrar o objeto na tela do console
#Mas isso n�o � muito pr�tico, veja s�:
iris

#Uma alternativa � pedir para o R mostrar a tabela em uma janela:
View(iris)

#Mais interessante do que isso, � pedir um resumo dos dados:
summary(iris)

#Vou pedir para o R mostrar apenas os valores de comprimento de p�tala
iris$Petal.Length

#Calculando a m�dia do comprimento da p�tala:
mean(iris$Petal.Length)

#Calculando a mesma m�dia, mas agora para cada esp�cie:
tapply(iris$Petal.Length, iris$Species, mean)

#O tapply() sempre funciona com tr�s argumentos:
# uma vari�vel quantitativa
# uma vari�vel categ�rica
# uma fun��o a ser calculada


#Antes de ir embora, vamos fazer um gr�fico simples:
boxplot(iris$Petal.Length~iris$Species)



