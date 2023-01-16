import 'CoreLibs/graphics'
import 'CoreLibs/sprites'

local gfx <const> = playdate.graphics

class('Bar').extends(playdate.graphics.sprite)

local padding = 2

function Bar:init(width, height)
    self.imageWidth = width
    self.imageHeight = height
    local image = gfx.image.new(width, height)
    gfx.pushContext(image)
    gfx.setColor(gfx.kColorBlack)
    gfx.drawRect(0, 0, width, height)



    gfx.fillRect(padding, padding, width - (padding * 2), height - (padding * 2))
    gfx.popContext(image)
    self:setImage(image)
    self:setZIndex(100)
    self.barProgress = 100
    self.animator = function(s)
        self.barProgress = s.barProgress - 2
    end
end

function Bar:update()
    self:animator()
    if self.barProgress < 0 then
        self.animator = function(s)
            self.barProgress = s.barProgress + 2
        end
    elseif self.barProgress > 100 then
        self.animator = function(s)
            self.barProgress = s.barProgress - 2
        end
    end

    local image = gfx.image.new(self.imageWidth, self.imageHeight)
    gfx.pushContext(image)
    gfx.setColor(gfx.kColorBlack)
    gfx.drawRect(0, 0, self.imageWidth, self.imageHeight)
    -- math.max ensures that the the top of the black bar won't cross into the expected padding
    local topOfBlackBar = math.max((self.barProgress * 0.01 * self.imageHeight) - padding, padding)
    -- math.max ensures that the the bottom of the black bar won't cross into the expected padding
    local bottomOfBlackBar = math.max(100 - padding - topOfBlackBar, 0)
    gfx.fillRect(padding, topOfBlackBar, self.imageWidth - (padding * 2), bottomOfBlackBar)
    gfx.popContext(image)
    self:setImage(image)
    self:setZIndex(100)
end
