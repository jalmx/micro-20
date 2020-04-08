-- Vamos a declarar los pines
local A = 0
local B = 1
local C = 2
local D = 3
local E = 4
local F = 5
local G = 6

-- configuración de pines

gpio.mode(A,0)
gpio.mode(B,0)
gpio.mode(C,0)
gpio.mode(D,0)
gpio.mode(E,0)
gpio.mode(F,0)
gpio.mode(G,0)

function display(a,b,c,d,e,f,g)
    gpio.write(A,a)
    gpio.write(B,b)
    gpio.write(C,c)
    gpio.write(D,d)
    gpio.write(E,e)
    gpio.write(F,f)
    gpio.write(G,g)
end

local time = 1000000
while true do 
    -- ENCIENDO EL DIGITO 0 
    display(1,1,1,1,1,1,0)
    tmr.delay(time)
    -- ENCIENDO EL DIGITO 1
    display(0,1,1,0,0,0,0)
    tmr.delay(time)
    -- ENCIENDO EL DIGITO 2
    display(1,1,0,1,1,0,1)
    tmr.delay(time)
    -- ENCIENDO EL DIGITO 3 
    display(1,1,1,1,0,0,1)
    tmr.delay(time)
    -- ENCIENDO EL DIGITO 4 
    display(0,1,1,0,0,1,1)
    tmr.delay(time)
end