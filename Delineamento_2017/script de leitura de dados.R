#####################################################
#Lendo arquivos de dados
#Disciplina Delineamento e Análise ppg-dibict 2017
#Prof Marcos Vital
#06-06-2017
#####################################################

### Etapa 1: determinar uma pasta de trabalho

# Método "manual":
setwd("D:/R/Delineamento 2017")

dir()    #Lista os arquivos dentro da pasta
getwd()  #Se quiser, com este comando ele mostra qual a pasta de trabalho


#Método "com janelinha", bom para compartilhar:
setwd(choose.dir())   #Abre uma janela para seleção da pasta


### Etapa 2: ler o arquivo

# Método "manual":
dados<-read.table("pratica1.txt", header=TRUE, sep="\t")

#O argumento header=TRUE pode ser escrito de maneira resumida, apenas h=T
#O argumento sep determina o tipo de separador, "t" é uma tabulação


# Método "com janelinha"
dados<-read.table(file.choose(), header=TRUE, sep="\t")
#Aqui apenas colocamos file.choose() no lugar do nome do arquivo
#O resto fica igual


# Método online:
dados<-read.table("https://github.com/marcosvital/scriptsR/raw/master/BioestatisticaUFAL/Dados/pratica1.txt", header=TRUE, sep="\t")
#Aqui basta colocar o endereço do arquivo, entre aspas
#No caso do GitHub, sempre use o endereço do "raw"

### Etapa 3: conferir o arquivo lido

#Se não tiver muitas colunas:
summary(dados)

#Caso tenha colunas demais, uma alternativa é:
str(dados)


#################################################

### Erros comuns:

#nome errado do arquivo / arquivo não está na pasta / escolheu a pasta errada:

teste<-read.table("blabla.txt")

#esquecer do header=T

teste2<-dados<-read.table("pratica1.txt")
summary(teste2)   #Veja o erro pela forma como ele resumiu os dados no summary

#Se aparacer o danado do "+", você esqueceu de fechar parênteses ou aspas
#Neste caso, aperte esc no console, corrija e comece de novo

#Esquecer do sep quando existem espaços nos nomes das colunas ou valores
teste3<-read.table("dados_erro.txt", h=T)
#Agora veja quando você coloca o sep:
teste3<-read.table("dados_erro.txt", h=T, sep="\t")
summary(teste3)


################################################

#Bônus: como gerar um código com dados, para um bom CMR:

dput(dados)  #Copie e cole essa parada doida que sai do comando

#Agora execute tudo de uma vez, e veja a mágica:
dados2<-structure(list(UA = 1:50, Ambiente = structure(c(1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L), .Label = c("primário", 
"secundário"), class = "factor"), Área = c(101L, 115L, 143L, 
92L, 51L, 89L, 128L, 149L, 127L, 108L, 83L, 140L, 163L, 41L, 
107L, 79L, 104L, 60L, 82L, 148L, 97L, 49L, 164L, 110L, 51L, 40L, 
92L, 163L, 128L, 130L, 122L, 96L, 59L, 73L, 90L, 48L, 166L, 121L, 
167L, 48L, 78L, 105L, 90L, 105L, 166L, 84L, 57L, 81L, 122L, 112L
), Riqueza = c(35L, 31L, 39L, 25L, 22L, 35L, 43L, 48L, 35L, 38L, 
32L, 33L, 40L, 16L, 31L, 23L, 32L, 35L, 22L, 41L, 24L, 18L, 39L, 
32L, 19L, 20L, 31L, 26L, 20L, 33L, 36L, 32L, 28L, 23L, 28L, 16L, 
44L, 27L, 37L, 24L, 19L, 28L, 27L, 28L, 27L, 20L, 34L, 20L, 31L, 
14L), Abund_sp1 = c(3L, 3L, 1L, 6L, 1L, 0L, 3L, 5L, 0L, 2L, 0L, 
2L, 2L, 3L, 5L, 3L, 1L, 4L, 3L, 0L, 2L, 3L, 1L, 3L, 3L, 1L, 3L, 
1L, 2L, 2L, 2L, 2L, 8L, 5L, 1L, 0L, 3L, 0L, 3L, 2L, 0L, 2L, 0L, 
0L, 1L, 3L, 3L, 4L, 1L, 0L)), .Names = c("UA", "Ambiente", "Área", 
"Riqueza", "Abund_sp1"), class = "data.frame", row.names = c(NA, 
-50L))

summary(dados2)