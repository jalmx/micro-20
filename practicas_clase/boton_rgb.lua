gpio.mode(5,1) -- configuro el boton 
pwm.setup(1, 500,0 ) -- configuro cada pin para el RGB
pwm.setup(2, 500,0 ) -- configuro cada pin para el RGB
pwm.setup(3, 500,0 ) -- configuro cada pin para el RGB
pwm.start(1)  -- arranca cada PWM 
pwm.start(2)  -- arranca cada PWM
pwm.start(3)  -- arranca cada PWM

local pin = 1

while true do
    local an = adc.read(0)
    an = an - 1 

    if gpio.read(5) == 1 then
        pin = pin + 1
        if pin >= 4 then
            pin = 1 -- me regresa al primero (rojo)
        end
        tmr.delay(250000) -- por transitorios o picos del boton
     end
        
    if pin == 1 then
        pwm.setduty(1,an)
        print("red")
    elseif pin == 2 then
        pwm.setduty(2,an)
        print("green")
    elseif pin == 3 then
        pwm.setduty(3,an)
        print("blue")
    end
    print(an) 
    tmr.delay(100000)

end
