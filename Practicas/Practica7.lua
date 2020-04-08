-- 3.1.1 Creación de un contador básico con un display de 7 segmentos, el cual comenzará en 0 y terminará en F, haciendo un conteo hexadecimal, el intervalo de tiempo será de medio segundo
-- CAMEL CASE
--[[ 
patitoAmarillo -- asi se declara una variable o funcion
PI -- una declaracion de una variable en mayusculas significa que es una constante
PATITO_AMARILLO ]]--

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

local time = 1000000
while true do
    
    -- ENCIENDO EL DIGITO 0 
    gpio.write(A,1)
    gpio.write(B,1)
    gpio.write(C,1)
    gpio.write(D,1)
    gpio.write(E,1)
    gpio.write(F,1)
    gpio.write(G,0)
    tmr.delay(time)
    -- ENCIENDO EL DIGITO 1
    gpio.write(A,0)
    gpio.write(B,1)
    gpio.write(C,1)
    gpio.write(D,0)
    gpio.write(E,0)
    gpio.write(F,0)
    gpio.write(G,0)
    tmr.delay(time)
    -- ENCIENDO EL DIGITO 2
    gpio.write(A,1)
    gpio.write(B,1)
    gpio.write(C,0)
    gpio.write(D,1)
    gpio.write(E,1)
    gpio.write(F,0)
    gpio.write(G,1)
    tmr.delay(time)
    -- ENCIENDO EL DIGITO 3
    gpio.write(A,1)
    gpio.write(B,1)
    gpio.write(C,1)
    gpio.write(D,1)
    gpio.write(E,0)
    gpio.write(F,0)
    gpio.write(G,1)
    tmr.delay(time)
    -- ENCIENDO EL DIGITO 4
    gpio.write(A,0)
    gpio.write(B,1)
    gpio.write(C,1)
    gpio.write(D,0)
    gpio.write(E,0)
    gpio.write(F,1)
    gpio.write(G,1)
    tmr.delay(time)
end