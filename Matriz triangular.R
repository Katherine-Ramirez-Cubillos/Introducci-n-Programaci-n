#Punto 1:

print("Ingrese las dimanesiones de la matriz")
f <-as.integer(readline(prompt = "Ingrese el número de filas"))
c <-as.integer(readline(prompt = "Ingrese el número de columnas"))

#Las iensiones de la matriz deben ser positivas  
if (f&c >0){
  #La matriz debe ser cuadrada
  if (f==c){
    #Se crea la matriz con ceros
    print("Ingrese los valores de la matriz. Se cargarán por filas")
    m <-scan (, numeric(), (f*c))
    m <- matrix(m,f,c, byrow = T)
    
    #Se crea función para comporbar si es triangular
    triangular=function(X){
      K=0
      N=((nrow(X)*(nrow(X)-1))/2)
      for (i in 2:nrow(X)){
        for(j in 1:ncol(X)){
          #cuenta 1 si hay ceros debajo de la diagonal
          if (i>j & X[i,j] == 0){K=K+1}
        }
      }
      if (K==N){
        print("Es triangular superior")
      } else{
        print("No es triangular superior")
      }
    }
    triangular(m)
    
  } else{
    print("Error en las dimensiones de la matriz. Debe ser cuadrada")
    
  }
  
} else{
  print("Error en las dimensiones de la matriz. Los números deben ser positivos")
}
