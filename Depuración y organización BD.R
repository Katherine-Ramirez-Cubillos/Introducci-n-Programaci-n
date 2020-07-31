### Punto 3
# LibrerÃ?as
#Importar librerias
install.packages("xlsx")
install.packages("dplyr")
install.packages("reshape")
install.packages("stringr")

library(xlsx)
library(dplyr)
library(reshape)
library(stringr)
setwd("C:/Users/Acer/Desktop/TALLER/CodigosR")

# Importar bases de datos 
#Departamentos
depa = read.csv('departamentos.csv', sep = ";")
head(depa)
sapply(depa,class)

#Economicos
econo=read.csv('economicos.csv', sep="," , row.names = 1 )
head(econo)
sapply(econo,class)

#Empresas
empre=read.csv('empresas.csv', sep=",", row.names=1, encoding='latin-1')
head(empre)
sapply(empre, class)

## Unión bases
union1 = merge (x=depa, y=empre, by =c("MUNI_ID_DPTO", "MUNI_ID_MPIO"), all=TRUE)
head(union1)
sapply(union1,class)

## Unión base3
union2= merge(x=union1, y=econo, by="NIT", all=TRUE)
head(union2)
sapply(union2,class)

#Número de valores perdidos
is.na.data.frame(union2)
colSums(is.na.data.frame(union2))

# Identificar los valores perdidos
union2[union2=="na"] <- NA
union2[union2=="--"] <- NA
union2[union2=="n/a"] <- NA
union2[union2=="NaN"] <- NA
union2[union2=="NoSe"] <- NA
union2[union2=="?"] <- NA

colSums(is.na.data.frame(union2))

# Tratamiento: En R la clase de las columnas cambia, por ello hay que modificarla para que realicemos las interpolaciones
sapply(union2,class)
union2[c(8,9,10,11,13)]<- lapply(union2[c(8,9,10,11,13)], as.numeric)
sapply(union2,class)


colSums(is.na.data.frame(union2))

getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

null1 = median(union2[,c('NIT')], na.rm = TRUE)
null2 = getmode(union2[,c('RAZON_SOCIAL')])
null3 = getmode(union2[,c('DIRECCION')])
null4 = median(union2[,c('CIIU_4')], na.rm = TRUE)
null5 = mean(union2[,c('Utilidad.operacional')], na.rm = TRUE)
null6 = mean(union2[,c('Year')], na.rm = TRUE)
null7 = mean(union2[,c('Empleados')], na.rm = TRUE)
null8 = getmode(union2[,c('Tiene.pagina.web')])
null9 = median(union2[,c('UVT')],na.rm = TRUE)


union2$NIT[is.na(union2$NIT)] <-null1
union2$RAZON_SOCIAL[is.na(union2$RAZON_SOCIAL)] <- null2
union2$DIRECCION[is.na(union2$DIRECCION)] <- null3
union2$CIIU_4[is.na(union2$CIIU_4)] <- null4
union2$Utilidad.operacional[is.na(union2$Utilidad.operacional)] <- null5
union2$Year[is.na(union2$Year)] <- null6
union2$Empleados[is.na(union2$Empleados)] <- null7
union2$Tiene.pagina.web[is.na(union2$Tiene.pagina.web)] <- null8
union2$UVT[is.na(union2$UVT)] <- null9


colSums(is.na.data.frame(union2))


# Eliminar duplicados y valores perdidos
union2 <- distinct(union2)
union2 <- na.omit(union2)
summary(union2)

#Subconjunto departamento Meta
Meta = subset(union2, MUNI_ID_DPTO == '50')
Meta

#Crear una nueva columna que clasifique las empresas

Meta2 <- Meta

#Consultas en la base de datos

summary(Meta2)
unique(Meta2$NIT)  

#1.Número total de empresas en el departamnto
empretotaldepa <- group_by(Meta2, MUNI_ID_DPTO)
summarise(empretotaldepa, mean=mean(NIT), n=n())
#En total hay 4456 empresas en el departamento

#2.Número total de empresas por municipio
empretotalmuni <- group_by(Meta2, MUNI_ID_MPIO)
summarise(empretotalmuni, mean=mean(NIT), n=n())
#  MUNI_ID_MPIO       mean     n
#<int>      <dbl> <int>
#  1            1 894456044.  3095
#2            6 892347697.   318
#3          110 891618070.    31
#4          124 897676749.    27
#5          150 890046323.    51
#6          223 894614519.    13
#7          226 892329625.    61
#8          245 886137979.     7
#9          251 889395969.    14
#10          270 893498032.    11
#....


#2.Número total de TRABAJADORES en el departamnto
trabajadores <- group_by(Meta2, MUNI_ID_DPTO)
summarise(trabajadores, mean=mean(Empleados), n=n())
#En total hay 4456 trabajadores en el departamento
#En promedio hay 101 trabajadores


#3. Clasificación de empresas
Metacla <- Meta2

Metacla[ Metacla$UVT <= 23563, 14] <- 'Micro'
Metacla[ Metacla$UVT > 23563 & Meta$UVT <= 204995, 14] <- 'Pequeña'
Metacla[ Metacla$UVT > 204995 & Meta$UVT <= 1736565, 14] <- 'Mediana'
Metacla[ Metacla$UVT > 1736565, 14] <- 'Grande'

#Numero total empresas
#Mediana    2268
#Grande     1887
#Pequeña     271
#Micro        30

EmpresasCla <- group_by(Metacla, V14)
summarise(EmpresasCla, mean=mean(V14), n=n())


#4.Utilidad total del departamento:405742823
Utilidad <- group_by(Meta2, MUNI_ID_DPTO)
summarise(Utilidad, sum(Utilidad.operacional))
#Utilidad operacional del departamento es 405742823

#5.Empresas con sitio web

Paginaweb <- group_by(Meta2, NIT)
summarise(Paginaweb, mean=mean(Tiene.pagina.web), n=n(), sum())

#6.Pincipales CIUU:
CIUU <- group_by(Meta2, MUNI_ID_DPTO)
summarise(CIUU, mean=mean(CIUU), n=n(), sum())




#7 principales Utilidad operacional por municipios 
Utilidadmuni <- group_by(Meta2, MUNI_ID_MPIO)
summarise(Utilidadmuni, sum(Utilidad.operacional), decreasing = FALSE)
#Utilidad operacional del departamento es 405742823
# MUNI_ID_MPIO `sum(Utilidad.operacional)` decreasing
#<int>                       <dbl>      
 # 1            1                  283326569.    
#2            6                   27653560.      
#3          110                    2834405       
#4          124                    2481088       
#5          150                    4336195       





