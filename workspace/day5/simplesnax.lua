local skynet = require 'skynet'
local snax = require 'skynet.snax'

local i = 10

g_test = 999

function init(...)
    skynet.error('simple snax service init', ...)
end

function exit(...)
    skynet.error('simple snax service exit', ...)
end


--使用accept来处理无响应请求
function accept.hello(...)
    skynet.error('accept hello', ...)
    skynet.error('i = ', i)
    skynet.error('g_test = ', g_test)
    return 1
end

function accept.quit(...)
    snax.exit(...)
    --snax.kill(snax.self(), 'exit info')
end

--使用response来处理有响应请求
function response.hello(...)
    skynet.error('response hello', ...)
    return 2
end