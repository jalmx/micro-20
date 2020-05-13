--========== CONECTADO AL MODEM
-- Configuro el mensaje de conexión
local waiting = tmr.create()
waiting:alarm(
    500,
    tmr.ALARM_AUTO,
    function()
        print("Conectando...")
    end
)
-----
--- Configuro los valores para conectarme al MODEM
wifi.sta.sethostname("ESP-MAIN") -- le doy nombre al micro

wifi.setmode(wifi.STATION) -- primero se define como cliente STATION
station_cfg = { -- creo la tabla con los datos de mi MODEM
    ssid = "IronMan",
    pwd = "vengadores"
}

station_cfg.got_ip_cb = function(data)
    waiting:unregister() -- desactivo el anuncio de conectando
    ip = data.IP
    print("My IP: " .. ip)
end

wifi.sta.config(station_cfg)

wifi.sta.autoconnect(1)

--- TERMINA LA CONFIGURACIÓN Y CONEXIÓN DEL WI-FI AL MODEM

--- SE CREA EL SERVIDOR
srv = net.createServer(net.TCP)

srv:listen(
    80,
    function(conn)
        conn:on(
            "receive",
            function(conn, request)
                print(request)
                conn:send(
                    [[ 
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Mi servidor NodeMCU</title>
            <link rel="stylesheet" href="https://mecatronica85.com/style.css">
        </head>
        <body>
            <h1>Servidor en ESP8266 Node MCU con Lua</h1> 
            <h2>Bienvenidos todos a Mecatrónica 85 - IoT</h2>
            <p style="text-align: center; background-color: white">
            <img src="https://raw.githubusercontent.com/jalmx/mecatronica85/master/imgs/lg_85.png" width="50%" alt="foto">
            </p>
            
        </body>
        </html>
      ]]
                )

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
