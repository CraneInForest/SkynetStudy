local skynet = require 'skynet'

skynet.register_protocol(
    {
        name = 'system',
        id = skynet.PTYPE_SYSTEM,
        pack = skynet.pack,
        unpack = skynet.unpack
    }
)



skynet.start(function()
    skynet.send('.custommsg', 'system', 'custommsg test')

    local result = skynet.call('.custommsg', 'system', 'custommsg test 2')
    skynet.error('call result = ', result)
end)