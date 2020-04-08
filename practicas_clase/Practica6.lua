-- 2.1.5 Toggle: Al presionar el push button se debe encender el led y mantenerce en ese estado; hasta que se vuelva a presionar el led regresará a su estado anterior

-- declaración de variables
local BOTON = 8
local LED1 = 1
local LED2 = 2
local LED3 = 3

-- configuro los pines
gpio.mode(BOTON, 1) -- configuro el pin como entra
gpio.mode(LED1, 0)
gpio.mode(LED2, 0)
gpio.mode(LED3, 0)

-- Las tareas a ejecutar

gpio.write(LED1,0)
gpio.write(LED2,0)
gpio.write(LED3,0)

local status = true -- me indica el estado de los LEDs

while true do
    
    local valorBoton = gpio.read(BOTON)

    if valorBoton == 1 then
        if status == true then 
            gpio.write(LED1,1)
            gpio.write(LED2,1)
            gpio.write(LED3,1)
            status = false
        else
            gpio.write(LED1,0)
            gpio.write(LED2,0)
            gpio.write(LED3,0) 
            status = true
        end
        tmr.delay(10000)
    end
    
    tmr.delay(250000)
end