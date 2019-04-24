local skynet = require 'skynet'

local dns = require 'skynet.dns'

skynet.start(function()
    -- dns.server()

    -- local ip, ips = dns.resolve('github.com')
    -- skynet.error('ip = ', ip)

    -- for _, v in pairs(ips) do
    --     skynet.error('v = ', v)
    -- end

    local dnsservice = skynet.localname('.dnsservice')

    local ipaddress = skynet.call(dnsservice, 'lua', 'reslove', 'gitbub.com', true)

    skynet.error('ipaddress = ', ipaddress)
end)