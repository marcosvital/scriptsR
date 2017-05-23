######################################
#Script 5 de bioestatística###########
#Gráficos no R########################
#Prof Marcos Vital UFAL###############
#13-03-2017###########################
######################################

##Lendo o arquivo:

dados<-read.table(file.choose(), header=T) #Abra o arquivo fumo.txt
summary(dados)								  #Aqui conferimos os dados
attach(dados)								  #Aqui fazemos o R reconhecer as colunas 

############################################################################

tabela<-table(Fumo, Câncer)
tabela

tabela2<-table(Câncer, Fumo)
tabela2

#Aqui podemos experimentar o gráfico com as duas tabelas
#E ficar com o que for mais intuitivo e fácil de interpretar
barplot(tabela, beside=T)
barplot(tabela2, beside=T)
#Quase sempre, a versão com a variável explicativa no X, e a resposta nas cores
#é a mais fácil de interpretar; mas a decisão é sua!


#################

#Vamos melhorar bastante este gráfico!

levels(Fumo)                #Conferir a ordem das classes da var. categórica

Fumo<-relevel(Fumo, "Não")  #Altera a ordem das classes, colocando o "Não" primeiro

levels(Fumo)                #Conferindo de novo, só pra ver se deu certo

#Veja como mudou no gráfico:
tabela2<-table(Câncer, Fumo) #Criando a tabela2 de novo, agora com a variável nova
barplot(tabela2, beside=T)   #Vendo como ficou no gráfico

levels(Câncer)               #Para ver em que ordem as barras apareceram

#Agora sim, criando um gráfico melhor:
limites.y<-c(0, 300)                              #Estabeleci os limites de y em um objeto
cores<-c("gray", "black")                         #Estabeleci a ordem das cores
nomes<-c("não tem câncer", "tem câncer")          #Nomes para aparecerem na legenda

barplot(tabela2, beside=T, las=1, ylim=limites.y, col=cores,
xlab="Hábito de fumar", ylab="Fre	quência")

legend("topright", nomes, col=cores, pch=15)      #Adiciona a legenda no gráfico (gráfico tem que estar aberto!)
                                                  #pch=15 foi usado para se desenhar os quadrados


#####################
#Desafio!
#Vamos adicionar valores relativos em porcentagem em cima das barras

somas<-colSums(tabela2)               #Calculando as somas das colunas da tabela 2
somas                                 #Olhando os valores

não.fumantes<-round((tabela2[,1]/somas[1])*100, 1)  #Porcentagens de câncer entre não fumantes
moderados<-round((tabela2[,2]/somas[2])*100, 1)     #O mesmo para os fumantes moderados
pesados<-round((tabela2[,3]/somas[3])*100, 1)       #O mesmo para os fumantes pesados
#A função round foi usada para arrendondar para uma casa decimal

#Olhando os valores:
não.fumantes
moderados
pesados

#Criando o gráfico de novo:
limites.y<-c(0, 350)
barplot(tabela2, beside=T, las=1, ylim=limites.y, col=cores,
xlab="Hábito de fumar", ylab="Fre	quência")

legend("topright", nomes, col=cores, pch=15)      #Adiciona a legenda no gráfico (gráfico tem que estar aberto!)
                                                  #pch=15 foi usado para se desenhar os quadrados

#E com ele aberto vamos adicionar os valores
text(1.5, tabela2[1,1]+10, não.fumantes[1])
text(2.5, tabela2[2,1]+10, não.fumantes[2])

text(4.5, tabela2[1,2]+10, moderados[1])
text(5.5, tabela2[2,2]+10, moderados[2])

text(7.5, tabela2[1,3]+10, pesados[1])
text(8.5, tabela2[2,3]+10, pesados[2])
