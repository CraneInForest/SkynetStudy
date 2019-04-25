local skynet = require 'skynet'

skynet.start(function()
    local gateserver = skynet.newservice('mygateserver2')

    skynet.call(gateserver, 'lua', 'open', {
        port = 8002,
        maxclient = 64,
        nodelay = true
    })
end)