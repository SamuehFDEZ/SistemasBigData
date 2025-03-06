# Ejercicio 4.2. Usar la función anterior para crear una función para calcular las medias
# de las columnas de un data frame numérico. La función debe devolver un vector con las
# medias de las columnas. Usarla para calcular el data frame formado por los vectores (1,
# 2, NA, 3, 4) y (-1, 0, -2, 0, NA).

medias <- function(df){
    medias <- NULL
    for (i in colnames(df)){
        medias <- c(medias, media(df[[i]]))
    }
    return(medias)
}
df <- data.frame(x = c(40, 22, 10, 33, 41), y = c(-11, 0, -222, 0, NA))
print(medias(df))