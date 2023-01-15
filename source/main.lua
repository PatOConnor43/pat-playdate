import 'CoreLibs/crank'
import 'CoreLibs/graphics'

local gfx = playdate.graphics

gfx.setColor(gfx.kColorBlack)
local crankValue = 0
local counter = 0
local radius = 250
local transformer = function (r)
    return r + 3
end

function playdate.update()
    gfx.fillRect(0, 0, 400, 240)
    playdate.drawFPS(0,0)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.setColor(gfx.kColorWhite)
    radius = transformer(radius)

    if radius < -1 then
        transformer = function (r)
            return r + 3
        end
    elseif radius > 250 then
        transformer = function (r)
            return r - 3
        end
    end
    gfx.fillCircleAtPoint(200, 120, radius)
    gfx.setColor(gfx.kColorBlack)
end

function playdate.cranked(changed, acceleratedChange)
    crankValue = changed
end

function playdate.AButtonDown()
    counter = counter + 1
end
