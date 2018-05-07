##################################
#Bioestatística: mais gráficos####
#Marcos V C Vital, maio de 2018###
##################################

#Lendo os dados (desta vez, do github)

dados<-read.table("https://raw.githubusercontent.com/marcosvital/scriptsR/master/BioestatisticaUFAL/2017-II/pratica1.txt", h=T)
summary(dados)

########################################
#Gráfico de dispersão:

plot(dados$Riqueza~dados$Área, las=1, pch=16)

#Da aula passada:
library(sciplot)
lineplot.CI(dados$Ambiente, dados$Riqueza, type="p",
xlab="Tipo de Ambiente", ylab="Número de espécies", las=1)


#Adicionando o tipo de ambiente no gráfico de dispersão
cores<-c("green4", "red4")
nomes<-c("Mata primária", "Mata secundária")

#O gráfico:
plot(dados$Riqueza~dados$Área, las=1, pch=16,
col=cores[dados$Ambiente])

#A legenda:
legend("topleft", legend=nomes, pch=16, col=cores)







