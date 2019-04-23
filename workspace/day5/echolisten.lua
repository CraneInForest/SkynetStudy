local skynet = require 'skynet'
local socket = require 'skynet.socket'


local function echo(ID)
    socket.start(ID)

    while (true) do
        local str, endstr = socket.readline(ID, '\n')

        if (str) then
            skynet.error('receive form ID', ID, 'content = ', str)
            skynet.fork(function()
                socket.write(ID, str:upper()..'\n')
                skynet.sleep(100)
            end)
            
        else
            skynet.error('the othe side closed', endstr)
            socket.close(ID)

            break
        end
    end
end


local function accept(ID, addr)
    skynet.error(ID)
    skynet.error(addr)

    skynet.fork(echo, ID)
end

skynet.start(function()
    local ipaddress = '0.0.0.0:8001'

    local LID = socket.listen(ipaddress)

    skynet.error('LID = ', LID)

    assert(LID)

    socket.start(LID, accept)
end)