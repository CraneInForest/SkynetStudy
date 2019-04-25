local skynet = require 'skynet'

skynet.start(function()
    local gateserver = skynet.newservice('mygateserver')

    skynet.call(gateserver, 'lua', 'open', {
        port = 8002,
        maxclient = 64,
        nodelay = true
    })

    skynet.call(gateserver, 'lua', 'kick', 111)
    skynet.exit()
end)