-- 2.1.1 Leer una entrada digital, encenderá el LED mientras se mantenga presionado el push button

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

while true do
    
    local valorBoton = gpio.read(BOTON)

    if valorBoton == 1 then -- si está siendo precionado el botón, se enciende
        gpio.write(LED1, 1) 
        gpio.write(LED2, 1) 
        gpio.write(LED3, 1) 
        tmr.delay(10000)
    else 
        gpio.write(LED1,0)
        gpio.write(LED2,0)
        gpio.write(LED3,0)
    end 

    tmr.delay(250000)
end