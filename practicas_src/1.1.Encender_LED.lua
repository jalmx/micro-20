-- Declaramos una variable en la decimos es D1 
pin = 1

-- Se configura el modo del pin como salida
gpio.mode(pin, 0)

-- Se pone en Alto el pin 
gpio.write(pin, 1)


