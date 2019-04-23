local skynet = require 'skynet'

require 'skynet.manager'

local sc = require 'skynet.socketchannel'

local channel = sc.channel{
    host = '127.0.0.1',
    port = '8001'
}

local function response(sock)
    --skynet.sleep(100)
    return true, sock:read()
end

local function task()
    local i = 0

    while i < 3 do

        --skynet.fork(function()
            local resp = channel:request('data'..i..'\n', response)
            skynet.error('resp = ', resp)
        --end)
        

        i = i + 1
    end

    channel:close()
end

skynet.start(function()
    skynet.fork(task)
end)