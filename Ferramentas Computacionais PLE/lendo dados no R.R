#Lendo dados no R, um script de exemplo
#Usando formatos txt e csv
#Marcos V C Vital, janeiro de 2021
#Disciplina Ferramentas Computacionais, UFAL


#Primeiro, a explicação, depois seguiremos com os exemplos

# Etapas:
## 1 - Determinar a pasta de trabalho
## 2 - Leitura do arquivo em si
## 3 - Conferindo se foi lido corretamente


###################################################
#Arquivos do tipo txt


#Determinando a pasta de trabalho
setwd("C:/R/Ferramentas computacionais PLE")
#Ajuste para a pasta correta no seu computador

#Lendo o arquivo:
dados<-read.table("exemplo.txt", header=T, dec=".", sep="\t", stringsAsFactors = T, encoding = "UTF-8")

#Conferindo o arquivo:
summary(dados)


#Sempre coloque o nome do arquivo entre aspas
#header indica que o arquivo tem cabeçalho
#dec indica o separador decimal (mude para "," se for necessário para os seus dados)
#sep indica o separador de colunas ("\t" indica que é tabulação)
##se você baixar dados seguindo outro padrão de separação, mude para o que for necessário
#stringsAsFactors = T faz o R reconhecer as variáveis categóricas de forma correta
#encoding = "UTF-8" pode ser necessário no caso de uso de acentos e caracteres especiais

###########################################
#Arquivos do tipo csv


#Siga as mesmas etapas, o que muda é a função de leitura:
dados2<-read.csv("exemplo.csv", header=T, dec=".", stringsAsFactors = T)

summary(dados2)

#Perceba que os arquivos csv exigem menos argumentos
#Não precisa definir separador (é padrão em arquivos deste tipo)
#Não precisa indicar o encoding