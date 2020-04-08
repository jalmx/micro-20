-- 1.2.3 Parpadear LED con un intervalo de un cuarto de segundo (tmr)
-- configuro los pines
local D1 = 1
local D2 = 2 
-- condiguro los pines como salida

gpio.mode(D1,0)
gpio.mode(D2,0)

-- encneder los LEDs

while true do -- while-true -> ciclon infinito
    gpio.write(D1,1)
    gpio.write(D2,1)
    print("enciendo")
    
    tmr.delay(100000) -- espero 100000 mS
    
    gpio.write(D1,0)
    gpio.write(D2,0)
    print("apago")
    
    tmr.delay(100000) -- espero 10000mS 
end
