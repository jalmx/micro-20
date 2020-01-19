-- https://nodemcu.readthedocs.io/en/master/modules/dht/
local pin = 3

function read( )
    
    dht=require("dht")

    status, temp, humi, temp_dec, humi_dec = dht.read11(pin)
    
    if status == dht.OK then
        -- Integer firmware using this example
        print(string.format("DHT Temperature:%d.%03d;Humidity:%d.%03d\r\n",
              math.floor(temp),
              temp_dec,
              math.floor(humi),
              humi_dec
        ))

        print("DHT Temperature:"..temp..";".."Humidity:"..humi)
    
    elseif status == dht.ERROR_CHECKSUM then
        print( "DHT Checksum error." )
    elseif status == dht.ERROR_TIMEOUT then
        print( "DHT timed out." )
    end 
end

while true do
    tmr.delay(500000)
    read()
end