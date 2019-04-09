local skynet = require 'skynet'
require 'skynet.manager'

skynet.start(function()
    skynet.error('test!')
    local env = skynet.getenv("envtest")
    skynet.error("env = ", env)
    skynet.setenv('wanzi', 'linhe')

    skynet.exit()
end)