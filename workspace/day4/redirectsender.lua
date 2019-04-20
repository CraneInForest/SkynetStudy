local skynet = require 'skynet'
require 'skynet.manager'

skynet.start(function()
    local receiver = skynet.localname('.redirectreceiver')
    local realsender = skynet.localname('.realsender')

    local msg, sz = skynet.pack('this is wanzi')

    skynet.error('receiver = ', receiver)
    skynet.error('realsender = ', realsender)

    skynet.redirect(receiver, realsender, 'lua', 0, msg, sz)
end)