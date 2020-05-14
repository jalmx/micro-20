data = dofile("data.lc")

local statusLed = true
local ledWaiting = 8
gpio.mode(ledWaiting, 0)
local waitingLed =  tmr.create() 
waitingLed:alarm(200, tmr.ALARM_AUTO,
function() 
  if status then
    gpio.write(ledWaiting,1)
  else
    gpio.write(ledWaiting,0)
  end
  status = not status
end) 

wifi.sta.sethostname("ESP-MAIN") -- le doy nombre al micro cuando este conectado

wifi.setmode(wifi.STATION) -- primero se define como cliente
station_cfg = {ssid = "IronMan", pwd = "vengadores"} 

station_cfg.got_ip_cb = function(data)
  waitingLed:unregister()
  print("\r------")
  print("My IP: " .. data.IP)
  print("------")
  gpio.write(8, 1)
end

station_cfg.auto = true
station_cfg.save = true
wifi.sta.config(station_cfg)

wifi.sta.autoconnect(1)

gpio.mode(2, 0)
gpio.mode(3, 0)
gpio.mode(4, 0)
gpio.write(2, 0)
gpio.write(3, 0)
gpio.write(4, 0)

srv = net.createServer(net.TCP)

local off = "Apagado"
local on = "Encendido"
local led1, led2, led3 = off, off,off

srv:listen(
  80,
  function(conn)
    conn:on(
      "receive",
      function(client, request)
        local _GET = data.getData(request) 

        if (_GET.pin == "on1") then
          led1 = on
          gpio.write(2, 1)
        elseif (_GET.pin == "off1") then
          led1 = off
          gpio.write(2, 0)
        elseif (_GET.pin == "on2") then
          led2 = on
          gpio.write(3, 1)
        elseif (_GET.pin == "off2") then
          led2 = off
          gpio.write(3, 0)
        elseif (_GET.pin == "on3") then
          led3 = on
          gpio.write(4, 1)
        elseif (_GET.pin == "off3") then
          led3 = off
          gpio.write(4, 0)
        end

        local html =
          [[ 
              <!DOCTYPE html>
              <html lang="en">
              <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <link rel="stylesheet" href="https://www.alejandro-leyva.com/micro-20/iot/esp/style.css">
              <title>Control de Leds</title>
              </head>
              <body>
              <h1>Control de LEDs</h1>
              <div class="buttons">
                  <a class="button red" href="/?pin=on1" >Encender Rojo</a>
                  <a class="button red-dark" href="/?pin=off1" >Apagar Rojo</a>
                  <a class="button yellow" href="/?pin=on2" >Encender Amarillo</a>
                  <a class="button yellow-dark" href="/?pin=off2" >Apagar Amarillo</a> 
                  <a class="button green" href="/?pin=on3" >Encender Verde</a>
                  <a class="button green-dark" href="/?pin=off3" >Apagar Verde</a> 
              </div> 
              <h2>
                  Estado del Led Rojo: <span>]] ..
                        led1 ..
                          [[</span></h2> 
              <h2>
                  Estado del Led Amarillo: <span>]] ..
                            led2 ..
                              [[</span></h2> 
              <h2>
                  Estado del Led Verde: <span>]] .. led3 .. [[</span></h2>               
              </div>
              </body>
              </html>
          ]]

        client:send(data.getHeader())
        client:send(html)
      end
    )
    conn:on(
      "sent",
      function(c)
        c:close()
      end
    )
  end
)
