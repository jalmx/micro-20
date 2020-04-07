local salir = 0
local suma = 0

while true do
  print("Dar un valor a sumar")
  local valor = io.read("n")
  suma = suma + valor
  print("0) Continuar sumando\n1)Salir")
  local salir = io.read("n")
  if salir == 1 then
    break 
  end 
end

print("La suma es: " .. suma)