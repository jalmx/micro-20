x = 0

while true do
    gpio.mode(x,0)
    gpio.write(x,0)
    tmr.delay(1000000)
    gpio.write(x,1) 

    print(x)

    x = x+1
    if x == 8 then
        x=11
    end
    if x == 13 then
        x=0
    end
end