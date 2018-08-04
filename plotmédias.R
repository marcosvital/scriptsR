plotmédias<-function(var.x, var.y, nome.x, nome.y){
  médias<-tapply(var.y, var.x, mean)
  desvios<-tapply(var.y, var.x, sd)
  x<-1:nlevels(var.x)
  
  plot(x, médias, ylim=range(c(médias-desvios, médias+desvios)), pch=16,
     axes=F, xlab=nome.x, ylab=nome.y)

axis(2, las=1)
axis(1, x, levels(var.x))
box()

arrows(x, médias-desvios, x, médias+desvios, angle=90, code=3, length=0.05)
  
}