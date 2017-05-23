####################################
#Primeiro script de bioestatística##
#Prof Marcos Vital##################
#06-02-2017#########################
####################################

#########################################################
#Vamos ler o nosso primeiro arquivo de exemplo:

dados<-read.table(file.choose(), header=T)

#read.table() lê um arquivo
#file.choose() permite abrir uma janela para escolher o arquivo
#header=T informa a função read.table que o arquivo tem cabeçalho


#Conferindo o arquivo lido com um resumo:
summary(dados)


#Fazer o R reconhecer os nomes das variáveis
attach(dados)
############################################################

#Calculando a média do número de espécies:
mean(Riqueza)

#Para Área:
mean(Área)


