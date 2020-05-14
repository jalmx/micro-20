--========== CONECTADO AL MODEM ========
-- CONTROL DE UN LED, CON 2 BOTONES
---
local data = dofile("data.lc") -- importo una libreria

-- Configuro el mensaje de conexión
local status = true --variable me ayuda a parpadear el LED
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

--- SE CREA EL SERVIDOR
local ledStatusOn = "Encendido"
local ledStatusOff = "Apagado"
local ledStatus = ledStatusOff
local contador = 0

srv = net.createServer(net.TCP) 
srv:listen(
    80,
    function(conn)
        conn:on(
            "receive",
            function(conn, request)
                local GET = data.getData(request)

                if GET.led == "on" then
                    gpio.write(led,1)
                    ledStatus = ledStatusOn
                    contador = contador +1
                elseif GET.led == "off" then
                    gpio.write(led,0) 
                    ledStatus = ledStatusOff
                    contador = contador +1
                end
               
                local html =  [[
                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Control de un LED</title>
                        <link rel="stylesheet" href="https://www.alejandro-leyva.com/micro-20/iot/esp/style.css">
                    </head>
                    <body>
                        <h1>Control de LEDs</h1>
                        <div class="buttons">
                            <a class="button red" href="/?led=on" >Encender LED</a>
                            <a class="button red-dark" href="/?led=off" >Apagar LED</a>
                        </div>
                        <h2>
                            Estado del Led Rojo: <span>]] ..ledStatus .. [[</span> 
                        </h2> 
                        <p>
                            Contador: ]].. string.format("%.0f", contador)  ..
                        [[
                        </p>
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