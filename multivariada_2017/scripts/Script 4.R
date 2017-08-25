#Estatistica Multivariada, PPG-DIBICT UFAL
#Prof Marcos Vital
#24-08-2017
#Aula 4
##############################################

#Lendo os dados
setwd("D:/R/multivariada 2017")
#Mude o endereço acima, para o da pasta de trabalho no seu computador

spe<-read.csv("DoubsSpe.csv", row.names=1)  #Dados das espécies de peixes
env<-read.csv("DoubsEnv.csv", row.names=1)  #Variáveis ambientais nos locais de coleta
spa<-read.csv("DoubsSpa.csv", row.names=1)  #Coordenadas dos locais de coleta

#Vamos criar um objeto com as variáveis físico-químicas da água:
fisqui<-env[ , 5:11]

#Dados das espécies, das var físico-químicas e das ambientais, sem a unidade amostral 8
spe_8<-spe[-8, ]
fisqui_8<-fisqui[-8, ]
env_8<-env[-8, ]

#Carregando pacotes:
library(vegan)
#######################################

##
#NMDS

#Criando a matriz de distância
spe.jac<-vegdist(spe_8, method="jaccard", binary=T)

#Realizando a análise

nmds.jac<-metaMDS(spe.jac, try=50, trymax=50)
#Lide com try e trymax na medida em que a solução demorar para aparecer
#Se necessário, aumente os valores

plot(nmds.jac, type="t")


#Vamos olhar um pouco para a variação de altitude
#Na tentativa de encontrar uma maneira de agrupar os dados

as.data.frame(env[, 2])

#Vou classificar os pontos como 1 a 10, depos de 11 em diante
#Pois isso representa uma "quebra" na altitude

#Criando a classe:
alt.clas<-ifelse(env_8$alt>600, "alto", "baixo")
alt.clas<-as.factor(alt.clas)   #Transforma o objeto em fator (var. categórica)

cores.alt<-c("blue4", "red4")

plot(nmds.jac, type="n")
points(nmds.jac, pch=16, col=cores.alt[alt.clas])
ordihull(nmds.jac, alt.clas, col=cores.alt)
legend("topleft", legend=levels(alt.clas), pch=16, col=cores.alt)

##
#envfit

envfit.jac<-envfit(nmds.jac, fisqui_8)

#Adicionando no gráfico (ele deve estar aberto):
plot(envfit.jac)

#Olhando os resultados da análise
envfit.jac

########

#Um parênteses

#Vamos verificar se uma das variáveis importantes, a oxigenação
#tem alguma relação com a altitude, que usamos para agrupar

plot(env_8$oxy~env_8$alt, pch=16)
cor(env_8$oxy, env_8$alt)

boxplot(env_8$oxy~alt.clas, range=0)
boxplot(env_8$nit~alt.clas, range=0)

#Até agora, podemos pensar que oxigênio é importante para
#determinar a composição
#E já nitrogênio parece se conectar bem com a divisão de classes
#de altitude





