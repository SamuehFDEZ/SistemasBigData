# 1. Creación de la matriz
# • Genera una matriz de 5 filas y 10 columnas cuyos elementos sean números aleatorios
# entre 1 y 100. Asegúrate de que los valores sean reproducibles utilizando una semilla
# fija

set.seed(42)
print(matrix(sample(1:100, 50, replace = TRUE), nrow = 5, ncol = 10))


# 2. Cálculos estadísticos
# • Calcula los siguientes valores estadísticos para cada columna de la matriz:
# • Media
# • Mediana
# • Varianza
# • Desviación estándar
print("-----------------------------------------------------------------")

medias <- apply(matriz, 2, mean)
print("Media de cada columna:")
print(medias)

medianas <- apply(matriz, 2, median)
print("Mediana de cada columna:")
print(medianas)

varianzas <- apply(matriz, 2, var)
print("Varianza de cada columna:")
print(varianzas)

desviaciones <- apply(matriz, 2, sd)
print("Desviación estándar de cada columna:")
print(desviaciones)

# 3. Representación gráfica
# • Utiliza gráficos de barras para mostrar los valores calculados en el punto anterior. 
#  Cada gráfico debe contener:
# • Un título descriptivo.
# • Ejes claramente etiquetados.
# • Barras con colores distintos para cada gráfico.
print("-----------------------------------------------------------------")

colores <- c("yellow", "blue", "green", "purple", "orange")

barplot(
        medias, 
        col = colores,
        main = "Media de cada columna",  
        xlab = "Columnas",          
        ylab = "Valor",               
        border = "black",             
        las = 1
)   

barplot(
        medianas, 
        col = colores,
        main = "Mediana de cada columna",  
        xlab = "Columnas",          
        ylab = "Valor",               
        border = "black",             
        las = 1
) 


barplot(
        varianzas, 
        col = colores,
        main = "Varianzas de cada columna",  
        xlab = "Columnas",          
        ylab = "Valor",               
        border = "black",             
        las = 1
) 

barplot(
        desviaciones, 
        col = colores,
        main = "Desviaciones de cada columna",  
        xlab = "Columnas",          
        ylab = "Valor",               
        border = "black",             
        las = 1
)