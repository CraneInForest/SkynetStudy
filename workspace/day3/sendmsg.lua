local skynet = require 'skynet'

skynet.start(function()
    local receivemsg = skynet.localname('.receivemsg')
    local r = skynet.send(receivemsg, 'lua', 'send', 20, false)
    skynet.error('r0 = ', r)

    local msg, sz = skynet.pack('raw send', 50, true)
    r = skynet.rawsend(receivemsg, 'lua', msg, sz)
    skynet.error('r1 = ', r)

    local content, age, sex = skynet.call(receivemsg, 'lua', 'call', 10, false)
    skynet.error('callresult : conent = ', content, ' age = ', age, ' sex = ', sex)
    
    msg, sz = skynet.pack('raw call', 50, true)
    msg, sz = skynet.rawcall(receivemsg, 'lua', msg, sz)
    content, age, sex = skynet.unpack(msg, sz)
    skynet.error('rawcall result : conent = ', content, ' age = ', age, ' sex = ', sex)
end)