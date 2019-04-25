local skynet = require 'skynet'

local gs, fd = ...
fd = tonumber(fd)

skynet.start(function()
    skynet.call(gs, 'lua', 'kick', fd)
    skynet.exit()
end)