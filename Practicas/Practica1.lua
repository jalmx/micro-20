--  1.1.1 Configuración de salidas desde archivo
-- configurar los pines a usar

local pin = 1 -- D9 - GPIO3

gpio.mode(pin, 0) -- configuro el pin D1 como salida

gpio.write(pin, 1) -- enciende el pin D1