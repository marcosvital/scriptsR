###########################################
#NMDS, envfit e permanova                 #
#Estatística multivariada, ufal, 2018     #
#Prof Marcos Vital                        #
#Agosto de 2018                           #
###########################################

##Leitura dos dados:

amb<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsEnv.csv", row.names=1)
spa<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsSpa.csv", row.names=1)
peixes<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsSpe.csv", row.names=1)

library(vegan)

#############################################
##NMDS

#Etapa 1: criando a matriz de distância
peixes.bray<-vegdist(peixes[-8, ], method="bray")

#o peixes[-8, ] significa que removemos a linha 8 da análise (era uma linha vazia)

#Etapa 2: fazendo o NMDS:
peixes.nmds.bray<-metaMDS(peixes.bray, trymax=100)

peixes.nmds.bray  #Conferindo o resultado

#Gráfico básico:
plot(peixes.nmds.bray, type="t")

#Elaborando o gráfico:
local<-ifelse(amb[-8,]$alt>350, "montante", "jusante")
local<-as.factor(local)

pontos<-c(1, 16)
plot(peixes.nmds.bray, type="n", las=1)
points(peixes.nmds.bray, pch=pontos[local])
legend("bottomleft", legend=levels(local), pch=pontos)

text(peixes.nmds.bray, labels=row.names(peixes[-8, ]), pos=1)

####

#Explorando graficamente o resultado do nmds

#Mínimo polígono convexo:
plot(peixes.nmds.bray, type="n", las=1)
points(peixes.nmds.bray, pch=pontos[local])
legend("bottomleft", legend=levels(local), pch=pontos)

ordihull(peixes.nmds.bray, local)

#Elipses de 95% de confiança:
cores<-c("red4", "green4")
plot(peixes.nmds.bray, type="n", las=1)
points(peixes.nmds.bray, col=cores[local], pch=16)
legend("bottomleft", legend=levels(local), pch=16, col=cores)

ordiellipse(peixes.nmds.bray, local, col=cores, draw="polygon")

######
#envift (preditores lineares da ordenação no nmds)

plot(peixes.nmds.bray, type="t")

resultado.envift<-envfit(peixes.nmds.bray, amb[-8, ])

resultado.envift

plot(resultado.envift)

########
#adonis (permanova adapatada para matriz de distância)

adonis(peixes.bray~local)
