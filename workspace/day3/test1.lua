local skynet = require 'skynet'
require 'skynet.manager'

t = {['name'] = 'linhe', ['age'] = '30'}

skynet.start(function()
    skynet.error('test1!')
    
end)