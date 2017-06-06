##################################################
#Primeiros passos no R############################
#Marcos V C Vital#################################
#Delineamento experimental, PPGDIBICT 2017########
#31-05-2017#######################################
##################################################

#Carregando dados de exemplo do próprio R:
data(iris)

#Resumir os dados:
summary(iris)

#Olhando de outra forma (útil quando temos muitas colunas):
str(iris)

#Olhando em forma de planilha:
View(iris)

###################################################
#Princípios básicos de uma planilha no R (data frame)

#Todo data frame do R, funciona com o formato: df[linhas, colunas]

#Por exemplo, se eu quero ver a linha dez:
iris[10, ]

#E se eu quiser olhar as linhas 5 a 15:
iris[5:15, ]

#E para colunas, olhando uma só (no caso, a coluna 3):
iris[ , 3]

#Duas colunas ao mesmo tempo:
iris[, 4:5]

#Se eu quero ver um único valor específico:
iris[17, 1]

#Ou usando o nome da coluna, no lugar do seu número:
iris[17, "Sepal.Length"]

#Agora vamos complicar um pouco, pegando elementos não contíguos na planilha
#Por exemplo: quero olhar linhas 1 a 10 das colunas 1 e 5
#Para isso, vamos usar a função concatenar: c()
#Lá vai:
iris[1:10, c(1,5)]

#De novo, usando os nomes:
iris[1:10, c("Sepal.Length", "Species")]


############
#Nomes das colunas

#Olha que erro bacana:
Species

#Agora vai funcionar, olha:
iris$Species

#Perceba que é igualzin fazer isso:
iris[ , 5]

#Outra opção é o attach(), mas muito cuidado ao usar...

####################
#Continuando com elementos de exploração e visualização da planilha

#Aqui vamos olhar apenas as linhas de uma espécie:
iris[iris$Species=="setosa", ]

#Aqui eu quero ver todos os dados das flores com comprimento da sépala maior ou igual a 7:
iris[iris$Sepal.Length>=7, ]

#Eu posso usar a mesma restrição, para uma única variável
#Por exemplo, olhando apenas as larguras das sépalas com comprimento maior ou igual a 7:
iris$Sepal.Width[iris$Sepal.Length>=7]



