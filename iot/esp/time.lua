local LED = 1
local LED2 = 2
gpio.mode(LED,1)
gpio.write(LED,0)
gpio.mode(LED,2)
gpio.write(LED,0)
local status = false
local status = false

local ledBlinkAlarm = tmr.create()
local ledBlinkAlarm2 = tmr.create()

ledBlinkAlarm:alarm(
    250,
    tmr.ALARM_AUTO,
    function()
        if not status then
            gpio.write(LED, 1)
        else
            gpio.write(LED, 0)
        end
        status = not status
    end
)

ledBlinkAlarm2:alarm(
    350,
    tmr.ALARM_AUTO,
    function()
        if not status then
            gpio.write(LED2, 1)
        else
            gpio.write(LED2, 0)
        end
        status = not status
    end
)
