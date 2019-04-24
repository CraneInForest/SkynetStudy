local skynet = require 'skynet'

local gateserver = require 'snax.gateserver'

local handler = {}

function handler.connect(fd, ipaddr)
    skynet.error('fd = ', fd, ' ipaddr = ', ipaddr)
    gateserver.openclient(fd)
end

function handler.message(fd, msg, sz)
    skynet.error('fd = ', fd, ' msg = ', msg, ' sz = ', sz)
end

function handler.disconnect(fd)
    skynet.error('fd = ', fd)
end

gateserver.start(handler)
