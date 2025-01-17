# Ejercicio 4.1. Crear una función para calcular la media de un vector numérico y usarla
# para calcular la media del vector (1, 2, NA, 3, 4).

media <- function(x){
    suma <- 0
    n <- 0
    for (i in x){
        if (!is.na(i)){
            suma <- suma + i
            n <- n + 1
        }
    }
    return(suma / n)
}

print(media(c(2, 10, NA, 3, 4)))