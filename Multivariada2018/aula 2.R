###########################################
#Análise de cluster e PCA                 #
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

##Um cluster em 5 passos

#1 - padronização dos dados
amb.pad<-decostand(amb, method="standardize")

#2 - criando a matriz de distância
amb.dist<-vegdist(amb.pad, method="euclidean")

#3 - calculando o cluster
amb.clust<-hclust(amb.dist, method="average")

#4 - coeficiente de correlação cofenética
amb.cof<-cophenetic(amb.clust)
cor(amb.dist, amb.cof, method="pearson")

#5 - gráfico!

plot(amb.clust, hang=-1)

#Versão na horizontal:
plot(as.dendrogram(amb.clust), horiz=T)

#Versão em uma janela grande (só funciona no windows):
windows(width=6, height=8, rescale="fixed")
plot(as.dendrogram(amb.clust), horiz=T)


############################

##PCA usando o pacote vegan

amb.pca<-rda(amb, scale=T)

summary(amb.pca)
biplot(amb.pca)

##Vamos explorar e criar uma variável categórica:
local<-ifelse(amb$alt>350, "montante", "jusante")
local<-as.factor(local)

#Gráfico para tentar ver isso na pca:
pontos<-c(1, 16)
plot(amb.pca, type="n", las=1)
points(amb.pca, pch=pontos[local])
legend("topright", legend=levels(local), pch=pontos)

#Extraindo os valores dos componentes principais:
componentes<-scores(amb.pca, display="sites", scaling=2, choices=1:11)

boxplot(componentes[ ,1]~local, las=1, range=0)