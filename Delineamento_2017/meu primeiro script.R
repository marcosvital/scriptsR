#########################################################
#Meu primeiro script do R################################
#Marcos Vital############################################
#30-05-2017##############################################
#Disciplina de Delineamento do PPG-DIBICT, turma 2017####
#########################################################

#Para começar, podemos usar o R como uma calculadora
#Por exemplo, podemos fazer operações aritméticas

10+12   #Adição
12-25   #Subtração
12*3    #Multiplicação
3/4     #Divisão

#Note que o seperador decimal do R é o ponto '.'
#Veja como funciona:
1.5*2

#Já aqui, vai dar erro:
1,5*2

#Se eu quero usar potência, o símbolo é '^':
3^2

###########################################################

#Criando um objeto no R
#Tudo se resume a usar '<-'

dez<-10  #Criamos um objeto chamado dez, com o número 10 dentro dele
dez      #Aqui "chamamos" o objeto no R
dez*2    #Aqui pedimos pro R multiplicar o conteúdo do objeto por 2  
dez      #Mas note que o objeto não foi alterado

#Uma função simples:
sqrt(dez)   #Calcula a raiz quadrada de um número

#Uma função que usa mais de um argumento:
log(100, 10)  #Calcula o log de (x, base)

#Chamando o sistema de ajuda:
help(log)   #Chama a ajuda da função desejada
?log        #Faz a mesma coisa, versão mais rápida para os preguiçosos

#E se eu não sei o nome da função???
help.search("square root")



