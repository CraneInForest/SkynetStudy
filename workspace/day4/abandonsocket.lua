local skynet = require 'skynet'
local socket = require 'skynet.socket'

local test123 = false

local function accept(ID, addr)
    skynet.error(ID)
    skynet.error(addr)

    socket.start(ID)
    local str, strend = socket.readline(ID, '\n')
    socket.write(ID, str:upper())

    socket.abandon(ID)

    if (test123 == false) then
        test123 = true
        
    end
    
    skynet.newservice('socketagent', ID)
end

skynet.start(function()
    local ipaddress = '0.0.0.0:8001'

    local LID = socket.listen(ipaddress)

    skynet.error('LID = ', LID)

    assert(LID)

    socket.start(LID, accept)
end)