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
----- configuracion local

local led = 2
gpio.mode(led, 0)
gpio.write(led, 0)

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
------============
-- Configuración de MQTT
local status = false
client = mqtt.Client(node.chipid(), 120)

--callback on connect and disconnects
client:on(
    "connect",
    function(con)
        print("connected")
        status = true
    end
)
client:on(
    "offline",
    function(con)
        print("offline")
        status = false
    end
)

client:on(
    "message",
    function(conn, topic, data)
        if data ~= nil then
            print(type(data))
            print(data)
            print("topic:\t" ..topic)
            if topic == "xizuth/push" then
                print("xizuth/push:" .. data)
                if data == "0" then
                    gpio.write(led, 0)
                    conn:publish("xizuth/led",0,0,0,function(conn) print("se apago led") end)
                elseif data == "1" then
                    gpio.write(led, 1)
                    conn:publish("xizuth/led",1,0,0,function(conn) print("se prende led") end)
                end
            end

            if topic == "xizuth/slider" then
                print("xizuth/slider:" .. data)
            end
        end
    end
)
-- broker.hivemq.com
-- mqtt.eclipse.org
-- test.mosquitto.org

client:connect(
    "broker.hivemq.com",
    1883,
    false,
    function(conn)
        print("connected")
        client:subscribe(
            "xizuth/",
            0,
            function(conn)
                client:publish(
                    "xizuth/",
                    "Hello from LUA - PRUEBA EXITOSA",
                    0,
                    0,
                    function(conn)
                        print("sent")
                    end
                )
            end
        )
        client:subscribe(
            "xizuth/slider",
            0,
            function(conn)
                print("conectado al slider")
            end
        )
        client:subscribe(
            "xizuth/push",
            0,
            function(conn)
                print("conectado al push")
            end
        )
    end
)
