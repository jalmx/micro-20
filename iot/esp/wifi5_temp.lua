--========== CONECTADO AL MODEM ========
-- Sensor de temperatura LM35
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
---===================
---- Configuraciones básicas
adc.force_init_mode(adc.INIT_ADC) -- por buenas prácticas se inicia el adc

local function getTemperature()
    return string.format("%.2f", (adc.read(0) - 3) * (330 / 1024)) 
end

--- SE CREA EL SERVIDOR

srv = net.createServer(net.TCP)
srv:listen(
    80,
    function(conn)
        conn:on(
            "receive",
            function(conn, request)
                local temp = getTemperature()
                print("Temp: " .. temp)
                local html =
                    [[
                    <!DOCTYPE html>
                    <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <meta http-equiv="refresh" content="2;URL=/">
                        <title>Temperatura LM35</title>
                        <link rel="stylesheet" href="https://www.alejandro-leyva.com/micro-20/tercero/style.css">
                    </head>
                    <body style="background-color: black; height: 100vh;">
                    <h2 class="segment_red">NODEMCU ESP8266</h1>
                    <h2 class="segment_red">T e m p e r a t u r a</h1>
                    <h2 class="segment_red">
                        ]].. temp..[[ &#164 C
                    </h1>
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
