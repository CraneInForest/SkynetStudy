local skynet = require 'skynet'
require 'skynet.manager'

local db = {}
local command = {}
local queue = require 'skynet.queue'
local cs = queue()

function command.setDB(key, value)
    -- skynet.error('setDB key = ', key, ' value = ', value)
    db[key] = value
end

function command.getDB(key)
    skynet.sleep(600)
    return db[key]
end

skynet.start(function()
    skynet.register('.receivemsg')

    skynet.dispatch('lua', function(session, address, cmd, ...)
        --skynet.error('session = ', session)
        --skynet.error('address = ', skynet.address(address))

        local f = command[cmd]
        skynet.error('f = ', f)
        if (f) then
            local result = cs(f, ...)

            skynet.retpack(result)
        else
            skynet.error('function not found')
        end
    end)
end)