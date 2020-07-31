# Introducci-n-Programaci-n
Este repositorio contiene ejercicios que realicé a lo largo del curso Introducción al Machine Learning desarrollado por el profesor Brian Salamanca 
Los ejercicios serán desarrollados en RStidio y Python. 

### Matriz triangular
Una matriz triangular es una matriz cuadrada la cual tiene triángulos de ceros por encima o por debajo de la diagonal principal dependiendo de si es una matriz triangular superior o una matriz triangular inferior. Este tipo de matrices son últiles en análisis numérico para resolver sistemas de ecuaciones lineales, calcular inversas y determinantes de matrices.
En este código se le pide al usuario ingresar las dimensiones y los valores de la matriz a trabajar, luego el programa determina si la matrices es triangular superior o no lo es. 

### Operaciones de matirces
En este programa se utilizan dos matrices predeterminadas y se pide calcular la suma, producto vectorial y longitud. 

### Base de datos
Este código utiliza el Directorio Estadístico de Empresas del DANE, del cual se tomaron 266.008 registros, de los cuales se simulan los siguientes campos: }
1. Utilidad operacional
2. Año de creación. 
3. Número de empleados. 
4. Si tiene página web
5. Unidades de valor tributario. 

De acuerdo a esta base de datos se consultan los siguientes datos del departamento del Meta. 
1. El número total de empresas en el departamento, y para cada municiío del departamento. 
2. ¿Cuántas personas laboran en el departamento? En promedio: ¿Cuántos?
3. De acuerdo al decreto 957, asigne los tamaños a cada empresa y diga cuántas empresas son micro, pequeñas, medianas y grandes en el departamento. 
4. ¿Cuánta utilidad operacional tiene el departamento?
5. En promedio ¿Cuaántas empresas tienen sitio web?
6. ¿Cuáles son lso principales CIU por departamento? Si los hay

###Bases de datos
#### Empresas.csv: Contiene el código del departamento y su nombre. 
#### Departamentos.csv: Contiene el código del departamento y su nombre.
#### Económicos.csv: Contiene los valores económicos de cada empresa. 

El código permite tener una sola base, uniendo los nombres del departeamento y los valores económicos con las empresas, utilizando las llaves foráneas "MUNI:ID:DPTO" Y "MUNI_ID_MPIO" y la llave principal "NIT". 








