#Um script de exemplo de uso do R!
#Prof Marcos V C Vital, para o CONECTE na UFAL, em 2021
#Script criado usando R versão 4.1.0

#Isto é um comentário

#O R funciona como calculadora:
10 + 10  #Soma
27 - 90  #Subtração
23 / 7   #Divisão
40 * 5   #Multiplicação

#Uma função do R é sempre chamada assim: função (argumentos)
sqrt (15)      #Calcula raiz quadrada
log (150, 10)  #Calcula log (no exemplo, log de 150 na base 10)

#Vamos criar um objeto:
banana <- 15

#Agora que o objeto existe:
banana
sqrt (banana)

#Agora um objeto com mais coisas:
gato <- c (10, 15, 23, 3, 90)

#E vamos usá-lo:
sqrt (gato)

#O sistema de ajuda pode ser chamado com a função help () ou uma simples interrogação:
?hist

#Se quiser fazer uma busca interna, use help.search ()
#Mas no geral, é melhor usar o bom e velho google

############################################

#Vocês podem conhecer as bases de dados do R chamando a função data ():
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

#O R entende o $ como um símbolo de "hierarquia"
#Por exemplo, data.frame$nome.da.coluna
airquality$Ozone       #Apenas dados da variável Ozônio
#####################################

#Vamos explorar um pouco destes dados!
mean (airquality$Temp)  #Média da temperatura
sd (airquality$Temp)    #Desvio padrão da temperatura

hist (airquality$Temp)  #Um histograma simples...

#Mas podemos melhorar!
hist (airquality$Temp, las=1, xlab="Temperatura (F)", ylab="Frequência", main=" ", col="red4")
box ()

#E como a temperatura varia por mês?
#Se eu fosse fazer manualmente, poderia fazer isso:
mean (airquality$Temp[airquality$Month==6])

#Mas é claro que o R tem ferramentas para automatizar:
tapply (airquality$Temp, airquality$Month, mean)

#Agora vamos visualizar a variação por mês:
boxplot (airquality$Temp ~ airquality$Month, las=1, xlab="Mês", ylab="Temperatura")
