-- 1.2.1 Control de más salidas y su configuración
-- configuro los pines
local D1 = 1
local D2 = 2


-- condiguro los pines como salida

gpio.mode(D1, 0)
gpio.mode(D2, 0)

-- encneder los LEDs

gpio.write(D1,1)
gpio.write(D2,1)