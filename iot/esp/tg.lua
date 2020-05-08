-- Programa que usa interrupciones para encender/apagar un led
local boton = 1
local led = 2

gpio.mode(led, 0)

gpio.mode(boton, gpio.INT)

local statusLed = true

local function pinCk(level, when) 
    gpio.trig(boton, "none") 
    tmr.delay(250000)

    if statusLed then
        gpio.write(led, 1)
        print("prender")
    else
        gpio.write(led, 0) 
        print("apagar")
    end
    statusLed = not statusLed

    gpio.trig(boton, "up", pinCk)
end

gpio.trig(boton, "up", pinCk)
 