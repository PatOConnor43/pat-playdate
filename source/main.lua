import 'CoreLibs/crank'
import 'CoreLibs/graphics'
import 'bar'

local gfx = playdate.graphics
gfx.clear()

local crankValue = 0
local counter = 0

local function initialize()
    bar = Bar(20, 100)
    bar:moveTo(200, 120)
    bar:add()
end

function playdate.update()
    playdate.drawFPS(0,0)
    gfx.sprite.update()
end

function playdate.cranked(changed, acceleratedChange)
    crankValue = changed
end

function playdate.AButtonDown()
    counter = counter + 1
end

initialize()
