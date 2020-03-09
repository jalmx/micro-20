-- https://roboindia.com/tutorials/lcd-on-esp8266-lua/
-- Ref: http://giantmetalrobot.blogspot.in/2015/07/esp8266-i2c-lcd.html
local M
do
local id = 0
local sda = 3      -- GPIO0
local scl = 4      -- GPIO2
local dev = 0x3F   -- I2C Address
local reg = 0x00   -- write
i2c.setup(id, sda, scl, i2c.SLOW)

local bl = 0x08      -- 0x08 = back light on

local function send(data)
   local value = {}
   for i = 1, #data do
      table.insert(value, data[i] + bl + 0x04 + rs)
      table.insert(value, data[i] + bl +  rs)      -- fall edge to write
   end
  
   i2c.start(id)
   i2c.address(id, dev ,i2c.TRANSMITTER)
   i2c.write(id, reg, value)
   i2c.stop(id)
end
 
if (rs == nil) then
-- init
 rs = 0
 send({0x30})
 tmr.delay(4100)
 send({0x30})
 tmr.delay(100)
 send({0x30})
 send({0x20, 0x20, 0x80})      -- 4 bit, 2 line
 send({0x00, 0x10})            -- display clear
 send({0x00, 0xc0})            -- display on
end

local function cursor(op)
 local oldrs=rs
 rs=0
 if (op == 1) then 
   send({0x00, 0xe0})            -- cursor on
  else 
   send({0x00, 0xc0})            -- cursor off
 end
 rs=oldrs
end

local function cls()
 local oldrs=rs
 rs=0
 send({0x00, 0x10})
 rs=oldrs
end

local function home()
 local oldrs=rs
 rs =0
 send({0x00, 0x20})
 rs=oldrs
end


local function lcdprint (str,line,col)
if (type(str) =="number") then
 str = tostring(str)
end

rs = 0
--move cursor
if (line == 2) then
 send({0xc0,bit.lshift(col,4)})
elseif (line==1) then 
 send({0x80,bit.lshift(col,4)})
end

rs = 1
for i = 1, #str do
 local char = string.byte(string.sub(str, i, i))
 send ({ bit.clear(char,0,1,2,3),bit.lshift(bit.clear(char,4,5,6,7),4)})
end

end

M={
lcdprint=lcdprint,
cls = cls,
home=home,
cursor=cursor,
}
end
return M

--[[

1. For clearing screen –
dofile(“lcd.lua”).cls();
2. Set cursor at Column 0 and Row 0 
dofile(“lcd.lua”).home();
3. To show cursor
dofile(“lcd.lua”).cursor(1);
4.  to hide cursor
dofile(“lcd.lua”).cursor(0);

4.2 Printing functions:
dofile(“lcd.lua”).lcdprint(“String”,Row,Column);

Rows can be 1 and 2. Columns can be 0 to 15.

example – dofile(“lcd.lua”).lcdprint(“Hello World!”,0,0);

]]