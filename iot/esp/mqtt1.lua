-- Configuro el mensaje de conexión
local status = true
local ledWaiting = 8
gpio.mode(ledWaiting, 0)

adc.force_init_mode(adc.INIT_ADC) -- por buenas prácticas se inicia el adc

local function getTemperature()
    return string.format("%.2f", (adc.read(0) - 62) * (330 / 1024))
end

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
---==========

------============
-- Configuración de MQTT
local status = false -- me indica el estado de la conecion al broker
local user = "xizuth-home"
local pass = "12345678"
local client = mqtt.Client("ESP8266-" .. node.chipid(), 120, user, pass)
----==
-- GENERO LA TIMER PARA MANDAR LA TEMPERATURA

local alarmTemp = tmr.create()
alarmTemp:alarm(
    2000,
    tmr.ALARM_AUTO,
    function()
        if client ~= nil and status then
            local temp = getTemperature()
            print("Temp: " .. temp)
            client:publish(
                "xizuth/temp",
                temp,
                0,
                0,
                function()
                    print("Temp sent")
                end
            )
        end
    end
)

--callback on connect and disconnects
client:on(
    "connect",
    function(con)
        print("connected to broker :D")
        status = true
    end
)
client:on(
    "offline",
    function(con)
        print("offline")
        alarmTemp:unregister()
        status = false
    end
)

client:on(
    "message",
    function(conn, topic, data)
        if data ~= nil then
            if topic == "xizuth/sw" then
                if data == "1" then
                    gpio.write(led, 1)
                elseif data == "0" then
                    gpio.write(led, 0)
                end
            elseif topic == "xizuth/mg" then
                print("Message: " .. data)
            elseif topic == "xizuth/rgb" then
                print("Slider: " .. data)
            end
        end
    end
)

local host = "broker.shiftr.io"
local port = 1883

client:connect(
    host,
    port,
    false,
    function(conn)
        print("connected to broker")
        status = true
        client:subscribe(
            "xizuth/mg",
            0,
            function(conn)
                print("connected to message")
                client:subscribe(
                    "xizuth/sw",
                    0,
                    function(conn)
                        print("connected to xizuth/sw")
                    end
                )
            end
        )
    end
)
