import 'CoreLibs/crank'
import 'CoreLibs/graphics'

local gfx = playdate.graphics

local crankValue = 0
local counter = 0
local radius = 250
local transformer = function (r)
    return r + 3
end
local pos_x = 200
local pos_y = 120

local function handle_buttons(p_x, p_y)
    if playdate.buttonIsPressed(playdate.kButtonLeft) then
        p_x = (p_x - 5) % 400
    end
    if playdate.buttonIsPressed(playdate.kButtonRight) then
        p_x = (p_x + 5) % 400
    end
    if playdate.buttonIsPressed(playdate.kButtonUp) then
        p_y = (p_y - 5) % 240
    end
    if playdate.buttonIsPressed(playdate.kButtonDown) then
        p_y = (p_y + 5) % 240
    end

    return p_x, p_y
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
    pos_x, pos_y = handle_buttons(pos_x, pos_y)
    gfx.fillCircleAtPoint(pos_x, pos_y, 10)
    gfx.setColor(gfx.kColorBlack)
end

function playdate.cranked(changed, acceleratedChange)
    crankValue = changed
end

function playdate.AButtonDown()
    counter = counter + 1
end
