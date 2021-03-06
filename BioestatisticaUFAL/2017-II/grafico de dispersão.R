##################################
#Bioestat�stica: mais gr�ficos####
#Marcos V C Vital, maio de 2018###
##################################

#Lendo os dados (desta vez, do github)

dados<-read.table("https://raw.githubusercontent.com/marcosvital/scriptsR/master/BioestatisticaUFAL/2017-II/pratica1.txt", h=T)
summary(dados)

########################################
#Gr�fico de dispers�o:

plot(dados$Riqueza~dados$�rea, las=1, pch=16)

#Da aula passada:
library(sciplot)
lineplot.CI(dados$Ambiente, dados$Riqueza, type="p",
xlab="Tipo de Ambiente", ylab="N�mero de esp�cies", las=1)


#Adicionando o tipo de ambiente no gr�fico de dispers�o
cores<-c("green4", "red4")
nomes<-c("Mata prim�ria", "Mata secund�ria")

#O gr�fico:
plot(dados$Riqueza~dados$�rea, las=1, pch=16,
col=cores[dados$Ambiente])

#A legenda:
legend("topleft", legend=nomes, pch=16, col=cores)







