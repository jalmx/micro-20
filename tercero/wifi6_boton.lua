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
-----
--- Configuro los valores para conectarme al MODEM
wifi.sta.sethostname("ESP-MAIN") -- le doy nombre al micro

wifi.setmode(wifi.STATION) -- primero se define como cliente
station_cfg = {ssid = "CapitanAmerica", pwd = "vengadores"}

station_cfg.got_ip_cb = function(data)
    waiting:unregister() -- desactivo el anuncio de conectando
    gpio.write(ledWaiting, 1) -- dejo encendido el led de que conecto
    ip = data.IP
    print("My IP: " .. ip)
end

station_cfg.auto = true
station_cfg.save = true
wifi.sta.config(station_cfg)

wifi.sta.autoconnect(1)

--- TERMINA LA CONFIGURACIÓN Y CONEXIÓN DEL WI-FI AL MODEM
-- Configuración del pin en donde estará el LED
local led = 2

gpio.mode(led, 0) -- configuro como salida
gpio.write(led, 0) -- apago el led

--- SE CREA EL SERVIDOR
local ledStatusOn = "Encendido"
local ledStatusOff = "Apagado"
local ledStatus = ledStatusOff

srv = net.createServer(net.TCP) 
srv:listen(
    80,
    function(conn)
        conn:on(
            "receive",
            function(conn, request)
                local GET = data.getData(request)

                if GET.pin == "on" then
                    gpio.write(led,1)
                    ledStatus = ledStatusOn
                elseif GET.pin == "off" then
                    gpio.write(led,0) 
                    ledStatus = ledStatusOff
                end

                local html =  [[
                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <meta http-equiv="refresh" content="5;URL=/">
                        <title>Control de un LED</title>
                        <link rel="stylesheet" href="https://www.alejandro-leyva.com/micro-20/tercero/style.css">
                    </head>
                    <body>
                        <h1>Control de LEDs</h1>
                        <div class="buttons">
                            <a class="button red" href="/?pin=on" >Encender LED</a>
                            <a class="button red-dark" href="/?pin=off" >Apagar LED</a>
                        </div>
                        <h2>
                            Estado del Led Rojo: <span>]] ..ledStatus .. [[</span> 
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
