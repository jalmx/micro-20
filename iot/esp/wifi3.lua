-- CONFIGURACIÓN COMO ACCESS POINT o ESTACIÓN
-- CONTROLANDO UN LED 
local data = dofile("data.lc") -- importo una libreria

-- CONFIGURANDO ACCESS POINT
wifi.setmode(wifi.SOFTAP)

cfg = {}
cfg.ssid = "ESP-MODULO" -- nombre con el que aparecera la red del ESP
cfg.pwd = "superpassword" -- contraseña del módulo

wifi.ap.config(cfg) 
-- print current ip, netmask, gateway 
print("ip\tnetmask\tgateway ")
print(wifi.ap.getip()) -- manda a imprimir en que ip me debo conectar
gpio.mode(8,1) --el pin 8 me indica cuando ya esta listo para conectar
gpio.mode(8,1)

-- Configuración del pin en donde estará el LED
local led = 2

gpio.mode(led, 0) -- configuro como salida
gpio.write(led, 0) -- apago el led

local ledStatusOn = "Encendido"
local ledStatusOff = "Apagado"
local ledStatus = ledStatusOff 

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
                        <title>Control de un LED</title>
                        <link rel="stylesheet" href="https://www.alejandro-leyva.com/micro-20/iot/esp/style.css">
                    </head>
                    <body>
                        <h1>Control de LEDs</h1>
                        <div class="buttons">
                            <a class="button red" href="/?pin=on" ><button>Encender LED</button></a>
                            <a class="button red-dark" href="/?pin=off" ><button>Apagar LED</button></a>
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
