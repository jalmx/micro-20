gpio.mode(5, 0)

pwm.setup(7,100,0)
pwm.start(7)

local duty = 0

while true do

    if gpio.read(5) == 1 then
        duty = duty + 10
        pwm.setduty(7, duty)
        tmr.delay(250000)

        if duty >= 1020 then
            duty = 0 
        end 
    end

    tmr.delay(100000)
end
