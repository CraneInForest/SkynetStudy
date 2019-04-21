local skynet = require 'skynet'
local socket = require 'skynet.socket'

local function asclient(ID)
    local i = 0

    while true do
        socket.write(ID, 'data'..i..'\n')

        local str ,strend = socket.readline(ID)
        if (str) then
            skynet.error('str frome ID = ', ID, str)
        else
            socket.close(ID)
            skynet.error('disconnect', strend)
            break
        end

        skynet.sleep(100)

        i = i + 1
    end
end


skynet.start(function()
    local ID = socket.open('127.0.0.1', 8001)

    assert(ID)

    skynet.fork(asclient, ID)
end)