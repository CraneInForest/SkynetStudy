local skynet = require 'skynet'
require 'skynet.manager'

skynet.start(function()
    skynet.register('.realsender')
end)