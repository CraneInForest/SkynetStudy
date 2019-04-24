local skynet = require 'skynet'
local snax = require 'skynet.snax'

skynet.start(function()
    local obj = snax.newservice('simplesnax')
    obj.post.hello('hello world')

    local i2, g_test2 = snax.hotfix(obj, 
    [[
        local skynet
        local i
        function accept.hello(...)
            skynet.error('hotfix accept hello', ...)
            skynet.error('i = ', i)
            skynet.error('g_test = ', g_test)
            return 1
        end

        function hotfix()
            local i2 = i
            i = -1
            return i2, g_test
        end
    ]])

    obj.post.hello('hello world')

    skynet.error('i2 = ', i2, 'g_test2 = ', g_test2)
end)