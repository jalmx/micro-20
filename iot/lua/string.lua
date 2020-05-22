-- string.format( texto , variables)

-- Especificadores de formato
-- %f -->numbero con punto decimal
-- %c --> caracter
-- %s --> string
-- %d --> enteros, digito
-- %i --> enteros, integer

local nombre = "Alejandro"
local edad  = 30
local altura = 1.70

local oracionNombre = string.format("Mi nombre es: %s", nombre )
local oracionEdad = string.format("Mi edad: %d", edad ) 

print(oracionNombre)
print(oracionEdad)
print(string.format("Mi altura es: %f", altura))

local oracionCompleta = string.format("Mi nombre es %s, con una edad de %d, y mido %f", nombre, edad, altura)

print(oracionCompleta)

local voltaje =  24.38676

-- %2.2f
print(string.format("%.2f" , voltaje))
print(string.format("%.4f" , voltaje))