#Esta função foi criada por mim (Marcos V C Vital) e pela turma do ano de 2016 da
#disciplina de Ferramentas Computacionais aplicadas à Ecologia, do curso de Ciências
#Biológicas da UFAL.

#A função pega o resultado da função specaccum do pacote vegan, e cria um gráfico
#Os argumentos são apenas três:
#o objeto com o resultado da specaccum
#o nome do eixo horizontal
#o nome do eixo vertical

#Um tutorial sobre a criação desta função pode ser encontrado no Cantinho do R:
#https://cantinhodor.wordpress.com/arquivo/

curvacum<-function(resultado, nome.x, nome.y) {
	riqueza<-resultado$richness
	desvio<-resultado$sd
	amostras<-resultado$sites

	y.minimo<-min(riqueza)
	y.maximo<-max(riqueza)
	y.baixo<-y.minimo*0.80
	y.alto<-y.maximo+(y.minimo*0.20)
	limites.y<-c(y.baixo, y.alto)

	plot(riqueza~amostras, type="l", ylim=limites.y, las=1, xlab=nome.x, ylab=nome.y)
	arrows(amostras, riqueza-desvio, amostras, riqueza+desvio, angle=90, code=3, length=0.05)
	points(riqueza~amostras, pch=21, bg="white")

}

