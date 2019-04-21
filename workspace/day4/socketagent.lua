local skynet = require 'skynet'
local socket = require 'skynet.socket'

local ID = ...
ID = tonumber(ID)

local function echo()
    socket.start(ID)
    
    while true do
        local str, endstr = socket.readline(ID, '\n')

        if (str) then
            skynet.error('str = ', str)
            socket.write(ID, str:upper())
        else
            skynet.error('disconnect  ', endstr)
            socket.close(ID)
            break
        end
    end

    skynet.exit()
end

skynet.start(function()
    

    skynet.fork(echo)
end)