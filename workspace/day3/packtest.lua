local skynet = require 'skynet'

skynet.start(function()
    local msg, sz = skynet.pack('aaaa', 20, false)
    skynet.error('msg: ', msg, 'sz: ', sz)

end)