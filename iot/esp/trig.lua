local push = 1
local led = 2
gpio.mode(push, gpio.INT) -- configuro el pin 1 como interrupción
gpio.mode(led, 1)
gpio.write(led, 0)

-- paso el pin, el tipo de disparo, callback
local type = "up"

local status = false

local function callback() -- callback
  gpio.trig(push, "none")
  tmr.delay(250000)

  if status then
    gpio.write(led, 1)
  else
    gpio.write(led, 0)
  end
  status = not status
  
  gpio.trig(push, type, callback)
end 

gpio.trig(push, type, callback)
