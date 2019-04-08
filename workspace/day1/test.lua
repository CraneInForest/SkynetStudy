local skynet = require 'skynet'

skynet.start(function()
    skynet.error('test!')
    local env = skynet.getenv("envtest")
    skynet.error("env = ", env)
    skynet.setenv('wanzi', 'linhe')
end)