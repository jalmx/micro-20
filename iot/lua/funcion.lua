local suma = function (a, b) 
    if type(a) ~= "number" or type(b) ~= "number" then
        print("Las variables deben ser números")
    else 
        return a + b
    end
end

print(suma(2,5))
print(suma(2,"es un string"))
print(suma(false, 5))