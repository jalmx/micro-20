-- https://nodemcu.readthedocs.io/en/master/modules/adc/

adc.force_init_mode(adc.INIT_ADC) -- por buenas prácticas se inicia el adc

while true do
    local an = adc.read(0)
    print("valor del adc ".. an)
    tmr.delay(1000000)
end