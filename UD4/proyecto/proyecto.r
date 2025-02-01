set.seed(123) # Para reproducibilidad de datos

# Definir nombres de tiendas y meses
tiendas <- c("Tienda A", "Tienda B", "Tienda C", "Tienda D", "Tienda E")
meses <- month.name

# Generación de datos lógicos para 5 tiendas en 12 meses
datos <- data.frame(
  Mes = factor(rep(meses, each = 5), levels = month.name, ordered = TRUE),
  Tienda = rep(tiendas, times = 12),
  Ingresos = round(runif(60, 50000, 150000), 2),
  Material = round(runif(60, 5000, 20000), 2),
  Personal = round(runif(60, 20000, 50000), 2),
  Publicidad = round(runif(60, 3000, 10000), 2),
  GastosElectricos = round(runif(60, 2000, 7000), 2)
)

# Cálculo de total de gastos y beneficio
datos$TotalGastos <- datos$Material + datos$Personal + datos$Publicidad + datos$GastosElectricos
datos$Beneficio <- datos$Ingresos - datos$TotalGastos

# Cálculo de totales globales
totalGlobales <- aggregate(cbind(Ingresos, TotalGastos, Beneficio, Material, Personal, Publicidad, GastosElectricos) ~ Mes, data = datos, sum)
totalGlobales$Mes <- factor(totalGlobales$Mes, levels = month.name, ordered = TRUE)

# Cálculo de totales por tienda
totalesTienda <- aggregate(cbind(Ingresos, TotalGastos, Beneficio, Material, Personal, Publicidad, GastosElectricos) ~ Tienda + Mes, data = datos, sum)
totalesTienda$Mes <- factor(totalesTienda$Mes, levels = month.name, ordered = TRUE)

# Identificación de meses clave
ingresosMaximosMes <- totalGlobales$Mes[which.max(totalGlobales$Ingresos)]
ingresosMinimosMes <- totalGlobales$Mes[which.min(totalGlobales$Ingresos)]
beneficioMaximoMes <- totalGlobales$Mes[which.max(totalGlobales$Beneficio)]
beneficioMinimoMes <- totalGlobales$Mes[which.min(totalGlobales$Beneficio)]

# Meses clave por tienda
mesesClaveTienda <- aggregate(cbind(Ingresos, Beneficio) ~ Tienda + Mes, data = datos, sum)
ingresosMaxTienda <- mesesClaveTienda[which.max(mesesClaveTienda$Ingresos),]
ingresosMinTienda <- mesesClaveTienda[which.min(mesesClaveTienda$Ingresos),]
beneficioMaxTienda <- mesesClaveTienda[which.max(mesesClaveTienda$Beneficio),]
beneficioMinTienda <- mesesClaveTienda[which.min(mesesClaveTienda$Beneficio),]

# Función para calcular la moda
calcularModa <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Estadísticas globales
ingresosEstadisticas <- c(
  mean = mean(totalGlobales$Ingresos),
  median = median(totalGlobales$Ingresos),
  moda = calcularModa(totalGlobales$Ingresos),
  sd = sd(totalGlobales$Ingresos)
)
beneficioEstadisticas <- c(
  mean = mean(totalGlobales$Beneficio),
  median = median(totalGlobales$Beneficio),
  moda = calcularModa(totalGlobales$Beneficio),
  sd = sd(totalGlobales$Beneficio)
)

# Estadísticas por tienda
estadisticasTienda <- aggregate(cbind(Ingresos, Beneficio) ~ Tienda, data = datos, function(x) c(mean = mean(x), median = median(x), moda = calcularModa(x), sd = sd(x)))

# Resumen de hallazgos
cat("Mes con mayores ingresos:", ingresosMaximosMes, "\n")
cat("Mes con menores ingresos:", ingresosMinimosMes, "\n")
cat("Mes con mayor beneficio:", beneficioMaximoMes, "\n")
cat("Mes con menor beneficio:", beneficioMinimoMes, "\n")

cat("\nEstadísticas de ingresos mensuales:\n")
print(ingresosEstadisticas)

cat("\nEstadísticas de beneficio mensual:\n")
print(beneficioEstadisticas)

cat("\nEstadísticas por tienda:\n")
print(estadisticasTienda)

cat("\nMeses clave por tienda:\n")
print(ingresosMaxTienda)
print(ingresosMinTienda)
print(beneficioMaxTienda)
print(beneficioMinTienda)

# Conclusiones
cat("\nConclusiones:\n")
cat("Se observa que algunas tiendas tienen ingresos y beneficios más estables, mientras que otras presentan más variabilidad.\n")
cat("Las tendencias en los gastos también afectan directamente el beneficio, especialmente en personal y publicidad.\n")
cat("Es recomendable analizar estrategias para optimizar los gastos en las tiendas con menor rentabilidad.\n")
                                
library(ggplot2)
                                
# Gráfico de ingresos por mes
ggplot(totalGlobales, aes(x = Mes, y = Ingresos, group = 1)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 2) +
  ggtitle("Ingresos Totales por Mes") +
  xlab("Mes") +
  ylab("Ingresos") +
  theme_minimal() +
  theme(axis.text.x = elementText(angle = 45, hjust = 1))  # Rotar etiquetas

# Gráfico de beneficios por mes
ggplot(totalGlobales, aes(x = Mes, y = Beneficio, group = 1)) +
  geom_line(color = "green", size = 1) +
  geom_point(color = "red", size = 2) +
  ggtitle("Beneficio Total por Mes") +
  xlab("Mes") +
  ylab("Beneficio") +
  theme_minimal() +
  theme(axis.text.x = elementText(angle = 45, hjust = 1))  # Rotar etiquetas

# Gráfico de ingresos por tienda
ggplot(totalesTienda, aes(x = Mes, y = Ingresos, fill = Tienda)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Ingresos por Tienda y Mes") +
  xlab("Mes") +
  ylab("Ingresos") +
  theme_minimal() +
  theme(axis.text.x = elementText(angle = 45, hjust = 1))  # Rotar etiquetas

# Gráfico de beneficios por tienda
ggplot(totalesTienda, aes(x = Mes, y = Beneficio, fill = Tienda)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Beneficio por Tienda y Mes") +
  xlab("Mes") +
  ylab("Beneficio") +
  theme_minimal() +
  theme(axis.text.x = elementText(angle = 45, hjust = 1))  # Rotar etiquetas