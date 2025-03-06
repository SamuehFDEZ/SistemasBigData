# 1. Creación de la matriz
generarMatriz <- function(seed = 42, n_rows = 5, n_cols = 10, min_val = 1, max_val = 100) {
  set.seed(seed)
  
  matriz <- matrix(
    sample(min_val:max_val, n_rows * n_cols, replace = TRUE), 
    nrow = n_rows, 
    ncol = n_cols
  )
  
  return(matriz)
}

# 2. Funciones para cálculos estadísticos
calcularMedia <- function(matriz) {
  apply(matriz, 2, mean)
}

calcularMediana <- function(matriz) {
  apply(matriz, 2, median)
}

calcularVarianza <- function(matriz) {
  apply(matriz, 2, var)
}

calcularDesviacionEstandar <- function(matriz) {
  apply(matriz, 2, sd)
}

# 3. Representación gráfica
mostrarGraficos <- function(stats, option) {
  colores <- c("yellow", "blue", "green", "purple", "orange")
  
  switch(option,
         "media" = barplot(
           stats$medias, 
           col = colores,
           main = "Media de cada columna",  
           xlab = "Columnas",          
           ylab = "Valor",               
           border = "black",             
           las = 1
         ),
         "mediana" = barplot(
           stats$medianas, 
           col = colores,
           main = "Mediana de cada columna",  
           xlab = "Columnas",          
           ylab = "Valor",               
           border = "black",             
           las = 1
         ),
         "varianza" = barplot(
           stats$varianzas, 
           col = colores,
           main = "Varianza de cada columna",  
           xlab = "Columnas",          
           ylab = "Valor",               
           border = "black",             
           las = 1
         ),
         "desviacion" = barplot(
           stats$desviaciones, 
           col = colores,
           main = "Desviación estándar de cada columna",  
           xlab = "Columnas",          
           ylab = "Valor",               
           border = "black",             
           las = 1
         ),
         stop("Opción no válida. Usa 'media', 'mediana', 'varianza' o 'desviacion'.")
  )
}

# 4. Flujo principal
# Generar la matriz
matriz <- generarMatriz()

# Calcular las estadísticas
estadisticos <- list(
  medias = calcularMedia(matriz),
  medianas = calcularMediana(matriz),
  varianzas = calcularVarianza(matriz),
  desviaciones = calcularDesviacionEstandar(matriz)
)

# Mostrar los resultados
print("Matriz generada:")
print(matriz)

print("Estadísticas calculadas:")
print(estadisticos)

# Graficar las estadísticas
mostrarGraficos(estadisticos, "desviacion")
