local skynet = require 'skynet'

local gateserver = require 'snax.gateserver'
local netpack = require 'skynet.netpack'

local handler = {}

function handler.connect(fd, ipaddr)
    skynet.error('fd = ', fd, ' ipaddr = ', ipaddr)
    gateserver.openclient(fd)
end

function handler.message(fd, msg, sz)
    skynet.error('fd = ', fd, ' msg = ', netpack.tostring(msg, sz), ' sz = ', sz)
end

function handler.disconnect(fd)
    skynet.error('fd = ', fd)
end

 
--如果你希望在监听端口打开的时候，做一些初始化操作，可以提供 open 这个方法。 --source 是请求来源地址，conf 是开启 gate 服务的参数表(端口，连接数，是否延迟)。 function handler.open(source, conf)
function handler.open(source, conf)
    skynet.error('open by source : ', skynet.address(source))
    
    for _, v in pairs(conf) do
        skynet.error(v)
    end
end

--当一个连接异常(通常意味着断开)，error 被调用，除了 fd ，还会拿到错误信息 msg(通常用于 log 输出)。 function handler.error(fd, msg)
function handler.error(fd, msg)
    gateserver.closeclient(fd)
end

--当 fd 上待发送的数据累积超过 1M 字节后，将回调这个方法。你也可以忽略这个消息。 function handler.warning(fd, size)
function handler.warning(fd, size)
    skynet.error('waring size > 1M ', size)
    gateserver.closeclient(fd)
end

local CMD = {}

function CMD.kick(...)
    skynet.error('call kick function', ...)
    local fd = ...
    gateserver.closeclient(fd)
end

--提供command回调函数,当其它服务发送非open以及close消息的时候,该回调会被调用
function handler.command(cmd, source, ...)
    skynet.error('lua command', cmd, skynet.address(source), ...)
    CMD[cmd](...)
end

gateserver.start(handler)
