-- ipairs -> arrays
-- pairs -> tablas

-- ** foreach
-- for index, value in ipairs(array)
-- for key, value in pairs(table)

alumnos = {"Camila", "Dani", "Migue", "Carlos", "Shaiel"}

-- Forma normal
print("FOR")
for i=1, #alumnos,1 do
    print("index: " .. i .. " - value: " .. alumnos[i])
end

-- FOR EACH 
-- for index, value in ipairs(array) do block end
print("-----------------")
print("FOR EACH")

for perrito, patito in ipairs(alumnos) do
    print("index: ".. perrito .. " - value: " .. patito)
end
