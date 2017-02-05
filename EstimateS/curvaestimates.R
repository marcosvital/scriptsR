##Função para ler um arquivo de resultado do EstimateS e criar um gráfico aqui no R
##Por Marcos V C Vital, https://cantinhodor.wordpress.com/

#O único argumento da função é o nome do arquivo, entre aspas e incluindo a extensão
#O arquivo deve estar no seu diretório de trabalho, beleza?

curva.estimates <- function(arquivo) {
  #Lê o arquivo:
  dados.estimates<-read.table(arquivo, skip=3, header=T, sep="\t")
  
  #Lê os parâmetros para a curva:
  amostras<-dados.estimates$Samples
  riqueza<-dados.estimates$S.est.
  erro<-dados.estimates$S.est..SD
  
  #Separa os valores do Jacknife:
  linha.final<-dim(dados.estimates)[1]
  estimador<-dados.estimates$Jack.1.Mean[linha.final]
  erro.estimador<-dados.estimates$Jack.1.SD..analytical.[linha.final]
  
  #Estabelecendo limites para os eixos:
  y.mínimo<-min(riqueza)
  y.máximo<-max(riqueza)
  y.baixo<-y.mínimo*0.80
  y.alto<-estimador+erro.estimador
  limites.y<-c(y.baixo, y.alto)
  
  #Mostra os resultados na tela, para conferir:
  print("Valores de riqueza")
  print(riqueza)
  print("Estimador e seu erro padrão")
  print(c(estimador, erro.estimador))
  
  ##Finalmente, vamos fazer o gráfico:
  #Criando a curva:
  plot(riqueza~amostras, type="l", ylim=limites.y, las=1, xlab="Esforço amostral", ylab="Riqueza de espécies", xlim=c(0, max(amostras)+2))
  
  #Adicionando as barras de erro:
  arrows(amostras, riqueza-erro, amostras, riqueza+erro, angle=90, code=3, length=0.05)
  
  #E adicionando os pontos:
  points(riqueza~amostras, pch=21, bg="white")
  
  ##
  #Agora adicionando o ponto do estimador:
  points(max(amostras)+1, estimador, pch=16)
  
  #E adicionando a barrinha de erro do estimador:
  arrows(max(amostras)+1, estimador-erro.estimador, max(amostras)+1, estimador+erro.estimador, angle=90, code=3, length=0.05)
  
  }
