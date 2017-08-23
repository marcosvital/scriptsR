###############################################################
#ESTATISTICA MULTIVARIADA AULA 1 NO R                         #
#10/08/2017                                                   #
#Marcos V C Vital                                             #
#Estat. multivariada, ppg-dibict, ufal                        #
###############################################################

#Explorando dados multivariados 

data(iris)  #carrega o conjunto de dados iris

iris        #mostra todo o objeto no console (ruim se o objeto for grande!)

summary(iris)   #resume o objeto
str(iris)       #Mostra a estrutura do objeto (alternativa ao summary)


iris$Sepal.Width  #mostra apenas a coluna indicada

iris [ , 2]                    #mostra apenas a coluna 2
iris [4, ]                     #mostra apenas a linha 4
iris[1:10, ]                   #mostra linhas 1 a 10
iris[ , 3:4]                   #mostra colunas 3 a 4
iris [2:6, 1]                  #linhas de 2 a 6 da coluna 1
iris [ ,c(2, 4)]               #colunas 2 e 4 (usando concatenar)
iris[c(1:10, 15:20), c(1, 5)]  #linhas 1 a 10 e 15 a 20, colunas 1 e 5


#######################################################################

#Gráficos simples

plot(iris$Petal.Length, iris$Petal.Width, las=1, pch=16,
xlab="Comprimento das pétalas", ylab="Largura das pétalas")

#se quiser ver todas as possibilidades, chame ?par
#las define a orientação dos números dos eixos x e y
#pch define o tipo de símbolo, veja ?pch para mais detalhes
#xlab e ylab dão nomes aos eixos


#Recriando o gráfico, com cores

levels(iris$Species)  #Para conferir a ordem das espécies
cores<-c("red4", "green4", "blue4")

plot(iris$Petal.Length, iris$Petal.Width, las=1, pch=16,
xlab="Comprimento das pétalas", ylab="Largura das pétalas",
col=cores[iris$Species])

espécies<-levels(iris$Species)
legend("topleft", legend=espécies, col=cores, pch=16, text.font=3)

#"topleft" foi a posição (canto superior esquerdo)
#legend etabeleceu o que foi escrito
#col e pch fez o mesmo que no gráfico
#tex.font mudou o tipo de fonte (2 para negrito, 3 para itálico, 4 os dois)











