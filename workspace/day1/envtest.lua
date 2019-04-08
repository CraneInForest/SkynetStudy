local skynet = require 'skynet'

skynet.start(function()
    local env = skynet.getenv('wanzi')
    skynet.error('wanzi env = ' , env)
    --skynet.setenv('wanzi', 'rouwanzi')  --can not setenv exist key
end)