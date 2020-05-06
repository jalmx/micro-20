-- nil, significa "sin referencia" 
nombre = "Mucha informacion"

if nombre == nil then 
    print("No tiene referencia")
else
    print("con referencia")
end

nombre = nil -- aquí elmino la referencia 
-- libero memoria

if nombre == nil then 
    print("No tiene referencia")
else
    print("con referencia")
end

---

