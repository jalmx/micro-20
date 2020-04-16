local delayms = 400
local LEDpin = 1
local LEDstate = true

gpio.mode(LEDpin, gpio.OUTPUT)

function tog()
    if LEDstate then
        gpio.write(LEDpin, gpio.LOW)
        print(0)
    else
        gpio.write(LEDpin, gpio.HIGH)
        print(1)
    end
    LEDstate = not LEDstate
end

-- oo calling method
local mytimer = tmr.create()
mytimer:register(delayms, tmr.ALARM_AUTO, function() tog() end)
mytimer:start()