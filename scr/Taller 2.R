#Elaborado por: Monica Palomino 200611835, Paula Urbina 201633091, Nicolás Danies 201822710
#Colaborador: Todos los miembros!
#Fecha de elaboración:30 de abril del 2021
#Fecha última modificación: 10 de marzo del 2021

#Se rralizó el Taller A

#initial configuration

library(tidyr, data.table)


#Punto 1
#Punto 1.0

lista_df <- readRDS("data/input/lista.rds")
View(lista_df$`homicidios-2010`)

#Punto 1.1 y 1.2

View(lista_df[[1]])

tipo=names(lista_df)
for (i in seq(1:74)){
  lista_df[[i]]<-lista_df[[i]]
  lista_df[[i]]<-na.omit(lista_df[[i]])
  names(lista_df[[i]])=tolower(as.character(lista_df[[i]][1,]))
  lista_df[[i]] <- lista_df[[i]][-1,]
  lista_df[[i]]$tipo_delito=rep(tipo[i],nrow(lista_df[[i]]))
}


#Punto 1.3
df=rbindlist(lista_df,use.names = TRUE ,fill = TRUE)
View(df)


#Punto 2 familia apply



#Punto 3 lapply
#Punto 3.1
convertir_a_min <- function(v) {
  if (is.character(v)==TRUE){
    return(tolower(v)) 
  }else{
    print("No se pudo realizar esta conversión")
  }
}
convertir_a_min(c(133,444))
convertir_a_min(c('VUIJLKJnmjjj','MMMMMMMMMMM'))


#Punto 3.2