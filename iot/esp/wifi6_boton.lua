--========== CONECTADO AL MODEM ========
-- CONTROL DE UN LED, CON BOTÓN REMOTO Y LOCAL
---
local data = dofile("data.lc") -- importo una libreria

-- Configuro el mensaje de conexión
local status = true
local ledWaiting = 8
gpio.mode(ledWaiting, 0)

local waiting = tmr.create()
waiting:alarm(
  1000,
  tmr.ALARM_AUTO,
  function()
    print("Conectando...")

    if status then
      gpio.write(ledWaiting, 1)
    else
      gpio.write(ledWaiting, 0)
    end
    status = not status
  end
)

--- Configuro los valores para conectarme al MODEM 
wifi.setmode(wifi.STATION) -- primero se define como cliente
station_cfg = {ssid = "IronMan", pwd = "vengadores"}

station_cfg.got_ip_cb = function(data)
  waiting:unregister() -- desactivo el anuncio de conectando
  gpio.write(ledWaiting, 1) -- dejo encendido el led de que conecto
  ip = data.IP
  print("My IP: " .. ip)
end

wifi.sta.config(station_cfg)

wifi.sta.autoconnect(1)

--- TERMINA LA CONFIGURACIÓN Y CONEXIÓN DEL WI-FI AL MODEM
-- Configuración del pin en donde estará el LED
local led = 2
gpio.mode(led, 0) -- configuro como salida
gpio.write(led, 0) -- apago el led

-- declaracion de variables
local ledStatusOn = "Encendido" -- mensaje en la pagina
local ledStatusOff = "Apagado" -- mensaje en la pagina
local ledStatus = ledStatusOff -- mensaje en la pagina
local claseRed = "red" -- clase para que el boton sea rojo
local claseRedDark = claseRed .. "-dark" -- clase que el boton sea rojo oscuro
local clase = claseRedDark -- clase final
local on, off = "on", "off" -- comparar el valor que mandan por la url
local orden = on -- la variable que tiene el estado del led

-- configuración del boton
local boton = 1 
gpio.mode(boton, gpio.INT) -- configuro como interrupcion

local statusLed = true

local function pinCk(level, when)
  gpio.trig(boton, "none")
  tmr.delay(250000)

  if statusLed then
    print("prender")
    gpio.write(led, 1)
    ledStatus = ledStatusOn
    clase = claseRed
    orden = off
  else
    print("apagar")
    gpio.write(led, 0)
    ledStatus = ledStatusOff
    clase = claseRedDark
    orden = on
  end
  statusLed = not statusLed

  gpio.trig(boton, "up", pinCk)
end

gpio.trig(boton, "up", pinCk) -- configuro el trigger
-- Fin de disparo del botón

--- SE CREA EL SERVIDOR
srv = net.createServer(net.TCP)
srv:listen(
  80,
  function(conn)
    conn:on(
      "receive",
      function(conn, request)
        local GET = data.getData(request)

        if GET.pin == "on" then
          gpio.write(led, 1)
          ledStatus = ledStatusOn
          clase = claseRed
          orden = off
        elseif GET.pin == "off" then
          gpio.write(led, 0)
          ledStatus = ledStatusOff
          clase = claseRedDark
          orden = on
        end

        local html =
          [[
              <!DOCTYPE html>
              <html lang="en">
              <head>
                  <meta charset="UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <meta http-equiv="refresh" content="2;URL=/">                        
                  <title>Control de un LED</title>
                  <link rel="stylesheet" href="https://www.alejandro-leyva.com/micro-20/iot/esp/style.css">
              </head>
              <body>
                  <h1>Control de LEDs</h1>
                  <div class="buttons">
                      <a class="button ]] .. clase .. [[" href="/?pin=]] .. orden .. [[" >]] .. orden .. [[ LED</a> 
                  </div>
                  <h2>
                      Estado del Led Rojo: <span>]] .. ledStatus .. [[</span> 
                  </h2> 
              </body>
              </html>
                ]]
        conn:send(data.getHeader())
        conn:send(html)
        conn:on(
          "sent",
          function(sck)
            sck:close()
          end
        )
      end
    )
  end
)
