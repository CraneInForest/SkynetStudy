local skynet = require 'skynet'
require 'skynet.manager'

skynet.start(function()
    skynet.error('test exit!')
    --skynet.exit()
    skynet.error('self = ', skynet.address(skynet.self()))
    --skynet.abort()
end)