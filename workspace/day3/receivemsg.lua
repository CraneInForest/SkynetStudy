local skynet = require 'skynet'
require 'skynet.manager'

skynet.start(function()
    skynet.register('.receivemsg')

    skynet.dispatch('lua', function(session, address, ...)
        skynet.error('session = ', session)
        skynet.error('address = ', skynet.address(address))

        local args = {...}

        for _, v in pairs(args) do
            skynet.error('v = ', v)
        end

        --skynet.retpack(...)

        local msg, sz = skynet.pack(...)
        skynet.ret(msg, sz)
    end)
end)