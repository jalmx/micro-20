local segmests = { 0, 1, 2, 3, 4, 5, 6 } 
--configuro salidas 

for s=1, #segmests do 
    gpio.mode(segmests[s],0) 
end 

local 
-- Funcion para mostar digitos en el display
function showNumber(pins) 
    for p = 1, #pins do
        gpio.write(p-1,pins[p])
    end 
end -- fin funcion 

-- Declaro los numeros a mostrar
-- local digitos = {
--     {1,1,1,1,1,1,0}, -- 0
--     {0,1,1,0,0,0,0}, -- 1
--     {1,1,0,1,1,0,1}, -- 2
--     {1,1,1,1,0,0,1}, -- 3
--     {0,1,1,0,0,1,1}, -- 4
--     {1,0,1,1,0,1,1}, -- 5
--     {0,0,1,1,1,1,1}, -- 6
--     {1,1,1,0,0,0,0}, -- 7
--     {1,1,1,1,1,1,1}  -- 8   
-- }

gpio.mode(8,1) -- configuro mi entrada

local mensaje1 = {
    {0,1,1,0,1,1,1},  -- H
    {1,1,1,1,1,1,0},  -- O
    {0,0,0,1,1,1,0},  -- L 
    {1,1,1,0,1,1,1},  -- A 
} 
local mensaje2 = { 
    {1,0,0,1,1,1,0},  -- C
    {0,0,1,1,1,1,1},  -- b
    {0,0,0,1,1,1,1},  -- t
    {0,0,0,0,1,1,0},  -- i
    {1,0,1,1,0,1,1},  -- S
    {0,0,0,0,0,0,1},  -- -
    {1,1,1,1,1,1,1}, -- 8 
    {1,0,1,1,0,1,1} -- 5  
} 
---- inicia el programa

local time = 250000

local mensaje = true

local repet = 4
local c = 1 -- inicio contador de las letras            

while true do 

    if mensaje then
        local m = 0 
        while m < repet do

            showNumber(mensaje1[c])
            tmr.delay(time) 
            
            if gpio.read(8) == 1 then
                mensaje = not(mensaje)
                c = 0 --reseto el contador para pasar a la otra frase, lo paso a cero porque abajo se incrementa
                break 
            end 
            m = m + 1
        end 
        if c == #mensaje1 then 
            c = 1
        else
            c = c + 1
        end 
    else
        local m = 0 
        while m < repet do

            showNumber(mensaje2[c])
            tmr.delay(time) 
            
            if gpio.read(8) == 1 then
                mensaje = not(mensaje)
                c = 0  --reseto el contador para pasar a la otra frase, lo paso a cero porque abajo se incrementa
                break 
            end 
            m = m + 1
        end 
        if c == #mensaje2 then 
            c = 1
        else
            c = c + 1
        end 
    end    

end
