pin = 1
timeDelay = 1000000

gpio.mode(pin, 0)
gpio.write(pin,0)

while(true)
do
    print("enciende")
    gpio.write(pin, 1)
    tmr.delay(timeDelay)
    print("apagado")
    gpio.write(pin, 0)
    tmr.delay(timeDelay)
end
