local skynet = require 'skynet'
require 'skynet.manager'

--给服务注册system消息
skynet.register_protocol(
    {
        name = 'system',
        id = skynet.PTYPE_SYSTEM,
        pack = skynet.pack,
        unpack = skynet.unpack
    }
)

skynet.start(function()
    skynet.register('.custommsg')
    skynet.dispatch('system', function(session, address, ...)
        skynet.error('session = ', session)
        skynet.error('address = ', address)
        local msg = ...
        skynet.error('msg = ', msg)
        skynet.ret(skynet.pack(...))
    end)
end)