# Se dispone de los siguientes datos de una persona:
# Variable Valor
# edad 20
# estatura 165
# peso 60
# sexo mujer
# a. Declarar las variables anteriores y asignarles los valores correspondientes.

edad <- 20
estatura <- 165
peso <- 60
sexo <- "mujer"
print(edad)
print(estatura)
print(peso)
print(sexo)

# b. Definir la variable numérica imc con el índice de masa corporal aplicando la siguiente fórmula a las variables 
# anteriores:
# imc = peso (kg) / estatura (m)2

imc <- peso/(estatura/100) ^ 2


# c. Mostrar por pantalla el indice de masa corporal calculado en el apartado anterior
# redondeado a dos decimales y con sus unidades en mayúsculas.

print(paste("Indice de masa corporal: ", round(imc,2), toupper("KG/M²")))


# d. Definir la variable booleana obesa con el valor correspondiente a la siguiente condición: ser 
# mujer y no tener una edad superior a 60 y tener un índice de masa
# corporal mayor o igual que 30. ¿Es esta persona obesa?

obesa <- False 


