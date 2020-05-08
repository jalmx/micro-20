-- Arrays
-- Estructura de datos, => base de datos
-- Guarda datos en forma secuencia o, uno junto al otro

-- *(array)Cajonera -> misCosas*
-- misCosas[4]  index(índece)
-- [zapatos]      1
-- [calzones]     2
-- [calcetines]   3
-- [uniforme]     4

-- Puntero (hermanito)
-- -> uniforme

-- SINTAXIS del array

-- nombre = { datos, separados , por , coma }
alumnos = {
    "Carlos",   -- 1    
    "Dani",     -- 2
    "Fidel",    -- 3    
    "Migue",    -- 4   
    "Osiris",    -- 5   
    "Shaiel",  -- 6
    "Eduardo",  -- 7
    "Camila"  -- 8
} 
-- me da la longitud del array
print(#alumnos)

-- Saco un dato con base a su posición
nombreCarlos = alumnos[1] 
nombreDani = alumnos[2] 
nombreFidel = alumnos[3] 
nombreMigue = alumnos[4] 
nombreOsiris = alumnos[5] 
nombreCamila = alumnos[8] 
print(nombreDani)

--------------
print("------- WHILE ----------")
print("El array con el while")
contador = 1 
while contador <= #alumnos do
    print("Nombre: " .. contador .. " es " .. alumnos[contador])
    contador = contador + 1
end

print("------- FOR ----------")
-- *********************************
-- Sintaxis 

-- for inicio = 1, valorTope, losPasos do
-- cuerpo del for
-- end 

for i = 1, #alumnos do
    print("Nombre " .. i .. " es: " .. alumnos[i])
end

---

print("--------------------------")
-- Multi asignación
nombre, edad , lenguaje = "Alejandro" , 30, "Kotlin"

print(nombre)
print(edad)
print(lenguaje)

print("--------FUNCIONES CON MULTI RETURN-------------")
function areaCuadrado() 
    aBase = 20
    aAltura = 60
    return aBase, aAltura
end

base = areaCuadrado()
print(base)

print("****")

bBase, bAltura = areaCuadrado()
print(bBase)
print(bAltura)
