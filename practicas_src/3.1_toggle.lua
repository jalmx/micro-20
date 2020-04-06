-- Programa para leer cuando esta presionado un boton y enciende 
-- configuración de pines
local LED = 3
local SW = 1
local status = 0

gpio.mode(LED, 0)
gpio.mode(SW, 1, gpio.PULLUP)

while true do
    valor = gpio.read(SW) -- leyendo la entrada del pin 1
    print("el switch " .. valor)

    if valor == 1 then
        if status >= 1 then
            status = 0
        else
            status = 1
        end
        gpio.write(LED, status)
        print("valor de status: " .. status)
        tmr.delay(250)
    end
    tmr.delay(100)
end
