 -- Programa para leer cuando esta presionado un boton y enciende un led

--declaramos los pines como variables
local LED = 4
local SW = 2

-- configuramos las entradas y salidas
gpio.mode(LED, 0) -- 0 es entrada 
gpio.mode(SW, 1) -- 1 es salida

-- comienza un bucle infinito 
while 1 do
    local boton = gpio.read(SW)

    if boton == 1 then
        gpio.write(LED, 1) 
        print("LED encendido")
        tmr.delay(250000)
    else
        gpio.write(LED, 0 )
        print("LED apagado")
        tmr.delay(250000)
    end
tmr.delay(100)
end
