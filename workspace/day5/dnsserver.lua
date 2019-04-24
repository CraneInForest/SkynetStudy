local skynet = require 'skynet'

local dns = require 'skynet.dns'

require 'skynet.manager'

local COMMAND = {}

function COMMAND.reslove(name, ipv6)
    return dns.resolve(name, ipv6)
end

function COMMAND.flush()
    dns.flush()
end

skynet.start(function()
    dns.server()

    skynet.dispatch('lua', function(_, _, cmd, ...)
        local f = COMMAND[cmd:lower()]

        if (f) then
            skynet.retpack(f(...))
        end
    end)

    skynet.register('.dnsservice')
end)