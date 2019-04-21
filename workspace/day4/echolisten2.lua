local skynet = require 'skynet'
local socket = require 'skynet.socket'



local function accept(ID, addr)
    skynet.error(ID)
    skynet.error(addr)

    skynet.error('ID type = ', type(ID))
    skynet.newservice('socketagent', ID)
end

skynet.start(function()
    local ipaddress = '0.0.0.0:8001'

    local LID = socket.listen(ipaddress)

    skynet.error('LID = ', LID)

    assert(LID)

    socket.start(LID, accept)
end)