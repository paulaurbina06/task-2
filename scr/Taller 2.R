#Elaborado por: Monica Palomino 200611835, Paula Urbina 201633091, Nicolás Danies 201822710
#Colaborador: Todos los miembros!
#Fecha de elaboración:30 de abril del 2021
#Fecha última modificación: 10 de marzo del 2021

#Se realizó el Taller A

#configuración inicial
rm(list = ls())
library(tidyr)
library(data.table)


#Punto 1
#Punto 1.0

#Leer el archivo .rds
lista_df <- readRDS("data/input/lista.rds")
#View(lista_df$`homicidios-2010`)

#Punto 1.1 y 1.2

#View(lista_df[[1]])

#nombres de cada una de las categorías del archivo
tipo=names(lista_df)
#Recorro sobre las 74 lineas
for (i in seq(1:74)){
  #Quitamos todas las filas que contengan NA en sus valores
  lista_df[[i]]<-na.omit(lista_df[[i]])
  #Tomamos la primera fila, la transformamos a strings, la convertimos en minusculas
  #las definimos como títulos con names()
  names(lista_df[[i]])=tolower(as.character(lista_df[[i]][1,]))
  #Eliminamos la fila que designamos para los títulos
  lista_df[[i]] <- lista_df[[i]][-1,]
  #Creamos una columna titulada tipo_delito y le asignamos en todas las filas 
  #el nombre de la categoria
  lista_df[[i]]$tipo_delito=rep(tipo[i],nrow(lista_df[[i]]))
}



#Punto 1.3
#Juntamos todas las posiciones de la lista con rbindlist
df=rbindlist(lista_df,use.names = TRUE ,fill = TRUE)
#Visualizamos nuestro dataframe
View(df)


#Punto 2 familia apply

#revisar tabla df y ver variables:
summary(df)
colnames(df)


#usando lapply
#las variables con datos van desde la columna 2 hasta la 21, por eso se acota
#para ver la descripcion de las variables usamos summary
lapply(df[,2:21],summary)

#para contar el numero de veces que se repite la observacion podemos usar table
lapply(df[,2:21],table)

#el taller pide una tabla de frecuencia para cada variables del objeto
tabla_frequencia=lapply(df[,2:21],table)
View(tabla_frequencia)

#tabla_frecuencia deja ver cada variable con su frecuencia



#Punto 3 lapply


#Punto 3.1
#Creamos la función convertir_a_min
convertir_a_min <- function(v) {
  #Si el vector es de string, convertimos en minúsculas.
  #De lo contrario lo pasamos a minúsculas
  if (is.character(v)==TRUE){
    return(tolower(v)) 
  }else{
    print("No se pudo realizar esta conversión")
  }
}
#Hacemos pruebas de la función
convertir_a_min(c(133,444))
convertir_a_min(c('VUIJLKJnmjjj','MMMMMMMMMMM'))


#Punto 3.2
#convertir elementos de df a minúsculas
view(lista_df)
lapply(df[,2:21],convertir_a_min)
