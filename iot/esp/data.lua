local _data = {}

function _data.getData(request)
    local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP")
    if (method == nil) then
        _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP")
    end
    local _GET = {}
    if (vars ~= nil) then
        for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
            _GET[k] = v
        end
    end

    return _GET, path
end 

function _data.getHeader()
    return "HTTP/1.1 200 OK\r\nConnection: keep-alive\r\nContent-Type: text/html; charset=UTF-8\r\n\r\n"
end

return _data