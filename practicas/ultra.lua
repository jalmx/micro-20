--
-- Simple object avoider robot using the ESP8266/Nodemcu ESP-12
-- Using a L9110s h-bridge and an hc-sr04 with a 1k resistor
-- on the ECHO pin.
--
-- The current ESP only allows for 3 active pwms at any one time.
-- We get around this by the fact we only need 2 at any time. Each
-- direction change resets them pins used as pwm.
--
-- Written by Scott Beasley 2015
-- Open and free to change and use. Enjoy.
--
function setup()
    gpio.mode(2, gpio.OUTPUT) -- ia1     - GPIO4
    gpio.mode(3, gpio.OUTPUT) -- ia2     - GPIO0
    gpio.mode(1, gpio.OUTPUT) -- ib1     - GPIO5
    gpio.mode(4, gpio.OUTPUT) -- ib2     - GPIO2

    gpio.mode(8, gpio.OUTPUT) -- trigger - GPIO15
    gpio.mode(7, gpio.INPUT) -- echo    - GPIO13

    -- Halt, just in case...
    halt()
end

function loop()
    local distance = 0
    local command = 0
    local timestart = 0

    distance = read_usonic()
    -- Go forward until an object is 5cm or less
    if (distance > 5) then
        forward()
    else
        back_up()
        turn_left()
    end

    -- Do something to yield to the system a bit.
    tmr.wdclr()
    delay_ms(80)
end

function read_usonic()
    local pulse_start = 0
    local pulse_end = 0

    -- Send out the trigger signal to the sensor
    gpio.write(8, gpio.LOW)
    delay_us(5)
    gpio.write(8, gpio.HIGH)
    delay_us(10)
    gpio.write(8, gpio.LOW)

    -- Wait for echo to go HIGH
    while (gpio.read(7) == 0) do
        tmr.wdclr()
        pulse_start = tmr.now()
    end

    -- Wait for echo to drop LOW again
    while (gpio.read(7) == 1) do
        tmr.wdclr()
        pulse_end = tmr.now()
    end

    -- Return centimeters
    return ((pulse_end - pulse_start) / 58)
end

function back_up()
    -- gpio.write (2, gpio.LOW);
    -- gpio.write (3, gpio.HIGH);
    -- gpio.write (1, gpio.LOW);
    -- gpio.write (4, gpio.HIGH);

    set_pwm_on_pins(3, 4)
    pwm.setduty(3, 200)
    pwm.setduty(4, 200)

    delay_ms(500) -- Delay 500ms
    halt()
end

function turn_left()
    -- gpio.write (2, gpio.LOW);
    -- gpio.write (3, gpio.LOW);
    -- gpio.write (1, gpio.HIGH);
    -- gpio.write (4, gpio.LOW);

    set_pwm_on_pins(1, 4)
    pwm.setduty(1, 200)
    pwm.setduty(4, 200)

    delay_ms(500) -- Delay 500ms
    halt()
end

function forward()
    -- gpio.write (2, gpio.HIGH);
    -- gpio.write (3, gpio.LOW);
    -- gpio.write (1, gpio.HIGH);
    -- gpio.write (4, gpio.LOW);

    set_pwm_on_pins(1, 2)
    pwm.setduty(1, 400)
    pwm.setduty(2, 400)
end

function halt()
    pwm.stop(1)
    pwm.stop(2)
    pwm.stop(3)
    pwm.stop(4)
    pwm.close(1)
    pwm.close(2)
    pwm.close(3)
    pwm.close(4)
    -- gpio.write (2, gpio.LOW);
    -- gpio.write (3, gpio.LOW);
    -- gpio.write (1, gpio.LOW);
    -- gpio.write (4, gpio.LOW);
end

function delay_ms(milli_secs)
    local ms = milli_secs * 1000
    local timestart = tmr.now()

    while (tmr.now() - timestart < ms) do tmr.wdclr() end
end

function delay_us(micro_secs)
    local timestart = tmr.now()

    while (tmr.now() - timestart < micro_secs) do tmr.wdclr() end
end

function set_pwm_on_pins(pin1, pin2)
    -- Close off pwm on pins to free them up
    pwm.close(1)
    pwm.close(2)
    pwm.close(3)
    pwm.close(4)

    -- Set the pins sent in as pwm
    pwm.setup(pin1, 500, 512)
    pwm.setup(pin2, 500, 512)

    -- Start up the timer on pins
    pwm.start(pin1)
    pwm.start(pin2)
end

-- Function to test the delays with
function blink()
    gpio.write(2, gpio.LOW)
    print("on")
    delay_ms(1000)

    gpio.write(2, gpio.HIGH)
    print("off")
    delay_ms(1000)
end

-- Run the bot code
setup()
while (1) do loop() end

-- TODO: compilar, reducir y probar