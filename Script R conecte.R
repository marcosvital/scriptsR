#Um script de exemplo de uso do R!
#Prof Marcos V C Vital, para o CONECTE na UFAL, em 2021
#Script criado usando R vers�o 4.1.0

#Isto � um coment�rio

#O R funciona como calculadora:
10 + 10  #Soma
27 - 90  #Subtra��o
23 / 7   #Divis�o
40 * 5   #Multiplica��o

#Uma fun��o do R � sempre chamada assim: fun��o (argumentos)
sqrt (15)      #Calcula raiz quadrada
log (150, 10)  #Calcula log (no exemplo, log de 150 na base 10)

#Vamos criar um objeto:
banana <- 15

#Agora que o objeto existe:
banana
sqrt (banana)

#Agora um objeto com mais coisas:
gato <- c (10, 15, 23, 3, 90)

#E vamos us�-lo:
sqrt (gato)

#O sistema de ajuda pode ser chamado com a fun��o help () ou uma simples interroga��o:
?hist

#Se quiser fazer uma busca interna, use help.search ()
#Mas no geral, � melhor usar o bom e velho google

############################################

#Voc�s podem conhecer as bases de dados do R chamando a fun��o data ():
data ()

#Os dados que vamos usar hoje:
data ("airquality")

#Para saber mais:
?airquality

#Olhando um resumo dos dados:
summary (airquality)

#####################################
#Para entender um pouco alguns detalhes
#O R entende um formato de data.frame [linhas, colunas]
airquality [15, ]       #Apenas a linha 15
airquality [20:30, ]    #Linhas 20 a 30
airquality [ , 1]       #Apenas a coluna 1
airquality [ , 2:3]     #Colunas 2 e 3
airquality [1:10 , 3:5] #Linhas 1 a 10, colunas 3 a 5

#O R entende o $ como um s�mbolo de "hierarquia"
#Por exemplo, data.frame$nome.da.coluna
airquality$Ozone       #Apenas dados da vari�vel Oz�nio
#####################################

#Vamos explorar um pouco destes dados!
mean (airquality$Temp)  #M�dia da temperatura
sd (airquality$Temp)    #Desvio padr�o da temperatura

hist (airquality$Temp)  #Um histograma simples...

#Mas podemos melhorar!
hist (airquality$Temp, las=1, xlab="Temperatura (F)", ylab="Frequ�ncia", main=" ", col="red4")
box ()

#E como a temperatura varia por m�s?
#Se eu fosse fazer manualmente, poderia fazer isso:
mean (airquality$Temp[airquality$Month==6])

#Mas � claro que o R tem ferramentas para automatizar:
tapply (airquality$Temp, airquality$Month, mean)

#Agora vamos visualizar a varia��o por m�s:
boxplot (airquality$Temp ~ airquality$Month, las=1, xlab="M�s", ylab="Temperatura")
