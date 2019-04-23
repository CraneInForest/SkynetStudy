local skynet = require 'skynet'

local mc = require 'skynet.multicast'

local channelID = ...
channelID = tonumber(channelID)

local function receiveMsg(channelID, source, ...)
    skynet.error('channelID: ', channelID)
    skynet.error('source: ', skynet.address(source))
end

skynet.start(function()
    local channel = mc.new{
        channel = channelID,
        dispatch = receiveMsg
    }

    channel:subscribe()
end)