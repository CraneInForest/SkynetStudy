local skynet = require 'skynet'
local snax = require 'skynet.snax'

skynet.start(function()
    --local snaxobj = snax.newservice('simplesnax', 'aaa', 111, true)
    snax.uniqueservice('simplesnax', 'aaa', 111, true)

    local snaxobj = snax.queryservice('simplesnax')

    local r = snaxobj.post.hello('I am hello', 666)
    skynet.error('snax post result = ', r)

    r = snaxobj.req.hello('I am hello', 666)
    skynet.error('snax req result = ', r)

    snax.globalservice('simplesnax', 'aaa', 111, true)
    local globalsnax = snax.queryglobal('simplesnax')

    r = globalsnax.req.hello('I am hello', 666)
    skynet.error('global snax req result = ', r)

    snaxobj.post.quit()
    --snax.kill(snaxobj, 'bbb', 222, false)
end)