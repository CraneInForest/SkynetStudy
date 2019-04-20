local skynet = require 'skynet'
require 'skynet.manager'

skynet.start(function()
    skynet.register('.redirectreceiver')

    skynet.dispatch('lua', function(session, address, msg)
        skynet.error(skynet.address(address))
        skynet.error('msg = ',  msg)
    end)
end)