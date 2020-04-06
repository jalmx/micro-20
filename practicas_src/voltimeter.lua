
adc.force_init_mode(adc.INIT_ADC) -- por buenas prácticas se inicia el adc

local resolution = 1024
local voltageMax = 3.3

while true do
    local an = adc.read(0)
    print("valor del adc ".. an)

    local volt =  an * (voltageMax/resolution)
    print("voltaje ".. volt)
    tmr.delay(1000000)
end