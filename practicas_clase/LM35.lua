adc.force_init_mode(adc.INIT_ADC) -- por buenas prácticas se inicia el adc

local temperatura = 0

while true do
    local an = adc.read(0)
    an = an -3
    print("valor del adc ".. an)
    
    temperatura = an * (330/1024)
    print("La temperatura es: " .. temperatura .. " ºC")

    tmr.delay(1000000)
end