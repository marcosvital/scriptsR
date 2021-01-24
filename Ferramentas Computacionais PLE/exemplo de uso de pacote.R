#Sript de exemplo de uso de um pacote
#Marcos V C Vital, 13-01-2021
#Disciplina Ferramentas Computacionais UFAL

#Vamos usar o pacote vegan
#Antes de usar, você deve instalar o pacote, o que pode ser feito via menu
#Se quiser, pode usar a função install.packages()

#Carregando o pacote:
library(vegan)

#Um exemplo mega rápido com funções do vegan:
data(dune)   #Carregando os dados para o exemplo

#Vamos calcular uma curva de acúmulo de espécies
resultado.curva<-specaccum(dune)   #Calculando a curva
plot(resultado.curva)              #Visualizando o gráfico
resultado.curva                    #Visualizando os resultados numéricos


#Preferencialmente, deixe os comandos de carregar pacotes no começo do script
