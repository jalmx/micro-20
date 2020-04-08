-- 1.2.5 Realizar un semaforo sencillo

local ROJO = 3
local AMBAR = 2
local VERDE = 1

-- CONFIGURO LOS PINES COMO SALIDA
gpio.mode(ROJO, 0)
gpio.mode(AMBAR, 0)
gpio.mode(VERDE, 0)

while true do

    gpio.write(ROJO,1)
    gpio.write(AMBAR,0)
    gpio.write(VERDE,0)
    tmr.delay(2000000)

    gpio.write(ROJO,0)
    gpio.write(VERDE,1)
    tmr.delay(1500000)
    gpio.write(VERDE,0)
    tmr.delay(1000000)
    gpio.write(VERDE,1)
    tmr.delay(1000000)
    gpio.write(VERDE,0) --
    tmr.delay(1000000)
    gpio.write(VERDE,1)
    tmr.delay(1000000)
    gpio.write(VERDE,0) --
    tmr.delay(1000000)
    gpio.write(VERDE,1)
    tmr.delay(1000000)
    gpio.write(VERDE,0) --

    gpio.write(AMBAR,1)
    tmr.delay(2000000) 
end
