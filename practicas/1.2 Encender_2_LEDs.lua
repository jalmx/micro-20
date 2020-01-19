-- Declaramos una variable en la decimos es D1 
pin1 = 1
pin2 = 2
-- Se configura el modo del pin como salida
gpio.mode(pin1, 0)
gpio.mode(pin2, 0)

-- Se pone en Alto el pin 
gpio.write(pin1, 1)
gpio.write(pin2, 1)


