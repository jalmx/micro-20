alumnos = {
    --   llave (key)  = valor (value)
    alumno1 = "Camila",
    alumno2 = "Carlos",
    edad = 16,
    generacion = nil,
    grupos = {"manana", "tarde"}
}
-- Agregando valores a la table
alumnos["alumno3"] = "Dani" -- notacion de corchete cuadrado
alumnos.alumno4 = "Migue" -- notacion de punto

-- modificar valor en la tabla
alumnos.generacion = "2020"

for key, value in pairs(alumnos) do
    if type(value) ~= "table" then
        print("key: " .. key .. " - valor: " .. value)
    elseif type(value) == "table" then
        for _, value2 in pairs(value) do
            print(key .. ": " .. value2)
        end
    end
end
