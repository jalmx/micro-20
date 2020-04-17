local status = true
for i = 0, 8 do
    gpio.mode(i, 0)
end

local blinkLed0 = tmr.create()
local blinkLed1 = tmr.create()
local blinkLed2 = tmr.create()
local blinkLed3 = tmr.create()
local blinkLed4 = tmr.create()
local blinkLed5 = tmr.create()
local blinkLed6 = tmr.create()
local blinkLed7 = tmr.create()
local blinkLed8 = tmr.create()

function blink0()
    status = not status
    if status then
        gpio.write(0, 1)
    else
        gpio.write(0, 0)
    end
end
function blink1()
    status = not status
    if status then
        gpio.write(1, 1)
    else
        gpio.write(1, 0)
    end
end
function blink2()
    status = not status
    if status then
        gpio.write(2, 1)
    else
        gpio.write(2, 0)
    end
end

function blink3()
    status = not status
    if status then
        gpio.write(3, 1)
    else
        gpio.write(3, 0)
    end
end
function blink4()
    status = not status
    if status then
        gpio.write(4, 1)
    else
        gpio.write(4, 0)
    end
end
function blink5()
    status = not status
    if status then
        gpio.write(5, 1)
    else
        gpio.write(5, 0)
    end
end
function blink6()
    status = not status
    if status then
        gpio.write(6, 1)
    else
        gpio.write(6, 0)
    end
end
function blink7()
    status = not status
    if status then
        gpio.write(7, 1)
    else
        gpio.write(7, 0)
    end
end
function blink8()
    status = not status
    if status then
        gpio.write(8, 1)
    else
        gpio.write(8, 0)
    end
end

variables = {
    blinkLed0,
    blinkLed1,
    blinkLed2,
    blinkLed3,
    blinkLed4,
    blinkLed5,
    blinkLed6,
    blinkLed7,
    blinkLed8
}
funciones = {
    blink0,
    blink1,
    blink2,
    blink3,
    blink4,
    blink5,
    blink6,
    blink7,
    blink8
}

local time = 100
for i = 1, #variables do
    variables[i]:register(time, tmr.ALARM_AUTO, funciones[i])
    variables[i]:start()
    time = time + 200
end
