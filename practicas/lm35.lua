-- https://nodemcu.readthedocs.io/en/master/modules/adc/

adc.force_init_mode(adc.INIT_ADC) -- por buenas prácticas se inicia el adc

while true do
    local an = adc.read(0)
    print("valor del adc ".. an)
    local temp = (an * 330)/1023
    print("La temperatura es: " .. temp)
    local temp = (an * 330)/1024
    print("La temperatura es: " .. temp)
    tmr.delay(1000000)
end