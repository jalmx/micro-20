local json = '{"name": "xizuth", "age": 20, "protocol": "mqtt"}'
print(json)

local tb = sjson.decode(json)

for key, value in pairs(tb) do
    if type(value) == "number" then
        value = tostring(value)
    end
    print("key: " .. key .. "\tvalue: " .. value)
end

print("convirtiendo tabla a string")

local tbl = {
    host = "mqtt brojer",
    port = 1883,
    user = "xizuth",
    pwd = "contra"
}

local toJson = sjson.encode(tbl)

print(toJson)