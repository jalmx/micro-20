-- Función 

-- PARA QUÉ USO UNA FUNCIÓN? 
-- ESTRUCTURA DE UNA FUNCIÓN
--[[
function nombreDeLaFuncion(arg1, arg2, arg3) -- inicia la función 

    -- CUERPO DE LA FUNCION
    return "Aquí pongo lo que me devulve la función"
end --aquí acaba la función 
]]--

--- AREA DE FUNCIONES
function saludo()
    print("Hola a todos")
end

function saludoPersona(nombre)
    print("Hola " .. nombre)
end

-- SCOPE , ALCANCE DE VARIABLES
function suma(a , b)
    local resultado = a + b
    return resultado
end

function areaRectangulo(ancho, alto)
    local area = ancho * alto
    return area
end

function areaCirculo(radio)
    local area = 3.1416 * radio^2
    return area
end
-- POR CONVENCION, SI UNA FUNCION RETORNA UN VALOR >BOOLEANO<, SE DEBE DE NOMBRAR
-- COMENZADO CON "is" , 
-- isEmpty
-- isAprobado
-- isFull
function isAprobo(cal1, cal2, cal3)

    local promedio = (cal1 + cal2 + cal3) /3

    if promedio >= 6 then
        return true ---<>>>>>>>>> termina
    else
        return false
    end -- fin del if-else

end -- fin de la función

function isAproboTexto(cal1, cal2, cal3)

    local promedio = (cal1 + cal2 + cal3) /3

    if promedio >= 6 then
        return "Aprobo" ---<>>>>>>>>> termina
    else
        return "No aprobo"
    end -- fin del if-else

end -- fin de la función
-----------------------------------------
-- INICIA MI PROGRAMA 

print( isAproboTexto(10, 0 , 7) )