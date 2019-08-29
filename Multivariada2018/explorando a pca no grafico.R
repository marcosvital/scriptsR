###Brincando com o gráfico da pca

##Leitura dos dados:

amb<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsEnv.csv", row.names=1)
spa<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsSpa.csv", row.names=1)
peixes<-read.csv("https://raw.githubusercontent.com/marcosvital/scriptsR/master/Multivariada2018/dados/DoubsSpe.csv", row.names=1)

library(vegan)

#############################################
local<-ifelse(amb$alt>350, "montante", "jusante")
local<-as.factor(local)

amb.pca<-rda(amb, scale=T)
summary(amb.pca)
biplot(amb.pca)

loadings.amb<-scores(amb.pca, display="species")

#O gráfico com as setas adicionadas manualmente:
pontos<-c(1, 16)
plot(amb.pca, type="n", las=1)
points(amb.pca, pch=pontos[local])
legend("topright", legend=levels(local), pch=pontos)
arrows(0,0, loadings.amb[,1], loadings.amb[,2], length = 0.05, col="blue4")

#Com o gráfico aberto, adicionando os nomes, um por um:
text(x=loadings.amb[1, 1]+0.2, y=loadings.amb[1, 2]-0.1, labels=row.names(loadings.amb)[1], col="blue4")
text(x=loadings.amb[2, 1]-0.1, y=loadings.amb[2, 2]-0.05, labels=row.names(loadings.amb)[2], col="blue4")
text(x=loadings.amb[3, 1]-0.1, y=loadings.amb[3, 2]-0.1, labels=row.names(loadings.amb)[3], col="blue4")
text(x=loadings.amb[4, 1], y=loadings.amb[4, 2]+0.1, labels=row.names(loadings.amb)[4], col="blue4")
text(x=loadings.amb[5, 1]+0.1, y=loadings.amb[5, 2]+0.1, labels=row.names(loadings.amb)[5], col="blue4")
text(x=loadings.amb[6, 1]+0.1, y=loadings.amb[6, 2], labels=row.names(loadings.amb)[6], col="blue4")
text(x=loadings.amb[7, 1]+0.1, y=loadings.amb[7, 2]+0.1, labels=row.names(loadings.amb)[7], col="blue4")
text(x=loadings.amb[8, 1]+0.1, y=loadings.amb[8, 2]+0.1, labels=row.names(loadings.amb)[8], col="blue4")
text(x=loadings.amb[9, 1]+0.2, y=loadings.amb[9, 2]+0.1, labels=row.names(loadings.amb)[9], col="blue4")
text(x=loadings.amb[10, 1]+0.1, y=loadings.amb[10, 2]+0.1, labels=row.names(loadings.amb)[10], col="blue4")
text(x=loadings.amb[11, 1]+0.1, y=loadings.amb[11, 2], labels=row.names(loadings.amb)[11], col="blue4")


