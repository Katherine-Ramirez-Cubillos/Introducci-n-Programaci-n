#Punto 2
#Programa para operaciones con vectores los cuales el usurio debe ingresar 
#cuando se le solicite.

#Para los vectores solicitados
#A=cblind(32,45,68,79)
#B=cblind(29,18,86,94)

#Los resultados son:
#Suma
#Suma=cblind(61,63,154,173)
#Producto punto
#15012
#La norma del vector 1 es:
#117.9576
#La norma del vector 2 es:
#131.8977


#Este programa le pide al usuario que ingrese los vectores que quiere evaluar   
print("Ingrese los valores del primer vector columna")
v1 <-scan (, numeric(),4)
v1 <- cbind(v1)


print("Ingrese los valores del segundo vector columna")
v2 <-scan (, numeric(),4)
v2 <- cbind(v2)

#declaci�n de elemntos
vectorsuma<-cbind()
vectorial <-0
vectormulti <-cbind()
norma1<-0
norma2<-0
vectormulti1 <-cbind()
vectormulti2 <-cbind()

#Operaciones
 
for (i in 1:length(4)) {
  vectorsuma <- v1+v2
  vectormulti <- v1*v2
  vectorial <-sum(vectormulti[seq(1,length(vectormulti),1)])
  vectormulti1<-v1*v1
  norma1 <-sqrt(sum(vectormulti1[seq(1,length(vectormulti1),1)]))
  vectormulti2<-v2*v2
  norma2 <-sqrt(sum(vectormulti2[seq(1,length(vectormulti2),1)]))
  
  #Imprimir los resultados
  print("El vector suma es:")
  print(vectorsuma)
  print("El producto punto es:")
  print(vectorial)
  print("La norma del vector 1 es:")
  print(norma1)
  print("La norma del vector 2 es:")
  print(norma2)
  
}


########

####el producto vectorial encontré esta función, pero 
####no se puede hacer un producto vectorial de dos vectores de tamaño 4 deber�???an haber 3 vectores 
xprod <- function(A,B) {
  args <- list(A,B)
  
  # Check for valid arguments
  
  if (length(args) == 0) {
    stop("No hay datos")
  }
  len <- unique(sapply(args, FUN=length))
  if (length(len) > 1) {
    stop("Todos los vectores tienen que tener la misma longitud")
  }
  if (len != length(args) + 1) {
    stop("Deben haber N-1 vectores de tamaño N")
  }
  
  # Compute generalized cross product by taking the determinant of sub-matricies
  
  m <- do.call(rbind, args)
  sapply(seq(len),
         FUN=function(i) {
           det(m[,-i,drop=FALSE]) * (-1)^(i+1)
         })
}
xprod(c(32,45,68,79),c(20,18,86,94))
xprod(c(2,0,1),c(1,-1,3))




