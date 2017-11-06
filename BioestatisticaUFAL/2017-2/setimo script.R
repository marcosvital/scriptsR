################################
#Bioestatística UFAL           #
#06-11-2017                    #
#Prof Marcos Vital             #
#Script 7, Qui-quadrado        #
################################

###############
###Lendo os dados

dados<-read.table("https://raw.githubusercontent.com/marcosvital/scriptsR/master/BioestatisticaUFAL/Dados/fumo.txt",
header=T)

summary(dados)

#Criando a tabela de contingência:
tabela<-table(dados$Fumo, dados$Câncer)

#Olhando os valores da tabela:
tabela

#Executando o teste estatístico:
chisq.test(tabela)

#Criando um gráfico, versão 1:
barplot(tabela, beside=T)

#Gráfico, versão 2:
tabela2<-table(dados$Câncer, dados$Fumo)
barplot(tabela2, beside=T)


#Gráfico, versão 2 com melhorias!

dados$Fumo<-relevel(dados$Fumo, "Não")         #Mudando a ordem das categorias, "não" primeiro
tabela.nova<-table(dados$Câncer, dados$Fumo)   #Criando a nova tabela, com dados acima
tabela.nova                                    #Conferindo a nova tabela

cores<-c("blue4", "red4")                      #Cores para categorias

#Gráfico:
barplot(tabela.nova, beside=T, las=1, xlab="Hábito de fumar",
ylab="Número de pacientes", col=cores)

#Legenda:
legend("topright", legend=c("não", "sim"), title="Câncer", col=cores, pch=15)
