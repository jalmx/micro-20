adc.force_init_mode(adc.INIT_ADC) -- arranco el ADC

pwm.setup(7,500,0) -- CONFIGURO EL PWM
pwm.start(7)

while true do
    local duty = adc.read(0)
    duty = duty - 1 -- para que el valor máximo sea 1023
    pwm.setduty(7, duty)
    tmr.delay(250000)
end