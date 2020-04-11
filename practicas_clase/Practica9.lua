gpio.mode(1,0)

adc.force_init_mode(adc.INIT_ADC) -- por buenas prácticas se inicia el adc

while true do
    local an = adc.read(0)
    print("valor del adc ".. an)

    if an < 100 then
        gpio.write(1,1) 
    else 
        gpio.write(1,0)
    end

    tmr.delay(100000)
end