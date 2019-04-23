local skynet = require 'skynet'

local mc = require 'skynet.multicast'

local channel = nil

local function task()
    local i = 0
    
    while i < 50 do
        --skynet.error('pulish')
        channel:publish('data'..i)
        i = i + 1
        skynet.sleep(100)
    end

    channel:delete()
end

skynet.start(function()
    channel = mc.new()
    skynet.error('channel ID', channel.channel)

    skynet.fork(task)
end)