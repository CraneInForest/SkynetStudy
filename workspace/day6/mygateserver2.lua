local skynet = require "skynet"
local gateserver = require "snax.gateserver"
local netpack = require "skynet.netpack"
  

local handler = {}
local CMD = {}
local agents = {} 
skynet.register_protocol {
    name = "client",
    id = skynet.PTYPE_CLIENT,
}

function handler.connect(fd, ipaddr) skynet.error("ipaddr:",ipaddr,"fd:",fd,"connect")
    gateserver.openclient(fd)
    local agent = skynet.newservice("myagent", fd) 
    agents[fd] = agent
end

function handler.message(fd, msg, sz)
    local agent = agents[fd]

    skynet.error('gate receive :', skynet.tostring(msg, sz))
    skynet.redirect(agent, 0, "client", 0, msg, sz)
end

gateserver.start(handler)
  