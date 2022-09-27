#Função Modes
#Calcula a moda (ou modas, se houver mais de uma) de um conjunto de dados
#Origem da função: https://stackoverflow.com/questions/2547402/how-to-find-the-statistical-mode
#Testada em R 4.0.3


Modes <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)]
}

