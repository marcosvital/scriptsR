#################################
#Nossos primeiros gráficos <3   #
#Bioestatística UFAL, 2018-2    #
#Prof Marcos Vital              #
#################################


#Carregando um conjunto de dados de exemplo (da memória do R):
data(iris)

#Resumindo os dados:
summary(iris)

######################

#Gráfico do comprimento da pétala em resposta ao comp da sépala:
plot(iris$Petal.Length ~ iris$Sepal.Length)

#O til serve para representar a relação entre as variáveis
#O padrão é: var explicativa ~ var resposta

#Agora vamos melhor nosso gráfico:
plot(iris$Petal.Length ~ iris$Sepal.Length, pch=16, las=1,
xlab="Comprimento da sépala", ylab="Comprimento da pétala", col="red")

#Os argumentos usados:
#pch determina o símbolo (execute ?pch se quiser ver os símbolos)
#las determinar a orientação dos números (las=1 são todos na horizontal)
#xlab e ylab determinam nomes dos eixos (usar aspas!)
#col determina a cor dos pontos
#Se quiser, quebre o comando em várias linhas, sempre assim:
   #comece a nova linha após uma vírgula
   #execute tudo selecionando todas as linhas envolvidas
   #sempre confira bem os parênteses e aspas