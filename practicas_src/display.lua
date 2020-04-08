-- Declarión de variables  -- salidas
local A = 0
local B = 1
local C = 2
local D = 3
local E = 4
local F = 5
local G = 6

-- configuración de pines 
gpio.mode(A, gpio.OUTPUT)
gpio.mode(B, gpio.OUTPUT)
gpio.mode(C, gpio.OUTPUT)
gpio.mode(D, gpio.OUTPUT)
gpio.mode(E, gpio.OUTPUT)
gpio.mode(F, gpio.OUTPUT)
gpio.mode(G, gpio.OUTPUT)

function display(a, b, c, d, e, f, g) 
    gpio.write(A, a)
    gpio.write(B, b)
    gpio.write(C, c)
    gpio.write(D, d)
    gpio.write(E, e)
    gpio.write(F, f)
    gpio.write(G, g)
end

display(1, 1, 1, 1, 1, 1, 0) -- 0 

valor = 0
-- configuración I/O
while 1 do 
    print(valor)
-- A B C D E F G
    if valor == 1 then 
        display(0, 1, 1, 0, 0, 0, 0) -- 1 
    elseif valor == 2 then 
        display(1,1,0,1,1,0,1) -- 2 
    elseif valor == 3 then 
        display(1,1,1,1,0,0,1) -- 3 
    elseif valor == 4 then 
        display(0,1,1,0,0,1,1) -- 4 
    elseif valor == 5 then 
        display(1,0,1,1,0,1,1) -- 5 
    --continuar con el conteo <----
    elseif valor > 5 then  --reinicio el contador
        valor=0
        display(1, 1, 1, 1, 1, 1, 0) -- 0 
    end
    
    valor = valor + 1 
    tmr.delay(500000)
end