local skynet = require 'skynet'

skynet.start(function()
    local msg, sz = skynet.pack('aaaa中国', 20, false)
    skynet.error('msg: ', msg, 'sz: ', sz)

    local content, age, sex = skynet.unpack(msg, sz)
    skynet.error('content = ', content, 'age = ', age, 'sex = ', sex)
end)