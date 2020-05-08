-- MANIPULACIÓN DEL ARRAY

alumnos = {"Camila", "Dani", "Migue", "Carlos", "Shaiel"} 

for _, value in ipairs(alumnos) do
    print(value)
end 

-- AGREGAR MÁS DATOS AL ARRAY
alumnos[#alumnos+1] = "Fidel" 
alumnos[#alumnos+1] = "Tome" 

print("-----------------------")
for _, value in ipairs(alumnos) do
    print(value)
end

print("-----------------------")

-- CAMBIAR DATOS EN EL ARRAY
alumnos[2] = "Daniela"

for _, value in ipairs(alumnos) do
    print(value)
end

print("-----------------------")

-- ELIMINAR DATOS DEL ARRAY 
print(#alumnos) -- tamaño del array
alumnos[#alumnos] = nil -- elimino ultima posición
print(#alumnos) -- imprimo el tamaño del array

alumnos[3] = "" -- elimino la position 3 

for _, value in ipairs(alumnos) do
    print(value)
end

print(type(alumnos))