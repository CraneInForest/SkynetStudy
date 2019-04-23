local skynet = require 'skynet'

require 'skynet.manager'

local sc = require 'skynet.socketchannel'

local function dispatch(sock)
    
    local str = sock:readline()

    skynet.error('readline = ', str)
    
    local session = string.sub(str, 5)
    session = tonumber(session)
    skynet.error('session = ', session)
    return session, true, str
end


local channel = sc.channel{
    host = '127.0.0.1',
    port = '8001',
    response = dispatch
}

local function task()
    local i = 0

    while i < 3 do
        skynet.fork(function(session)
            skynet.error('channel request session = ', session)
            local resp = channel:request('data'..session..'\n', session)
            skynet.error('resp = ', resp)
        end, i)

        i = i + 1
    end
end

skynet.start(function()
    skynet.fork(task)
end)