local fortuneClass = { }
fortuneClass.__index = fortuneClass

function Fortune(id, text, x, xConstant, xMod, xOffset, y, yConstant, yMod, yOffset, cR, cG, cB)
    -- no clue why this doesn't work
    -- textWidth = text:getWidth( )
    -- textHeight = text:getHeight( )
    local instance = {
        id = id,
        text = text,
        w = 20,
        h = 5,
        x = x,
        xConstant = xConstant,
        xMod = xMod,
        xOffset = xOffset,
        y = y,
        yConstant = yConstant,
        yMod = yMod,
        yOffset = yOffset,
        cR = cR,
        cG = cG,
        cB = cB
    }
    setmetatable(instance, fortuneClass)
    return instance
end

function fortuneClass:draw()
    love.graphics.setColor(self['cR'], self['cG'], self['cB'], 255)
    love.graphics.print(self['text'], self['x'], self['y'], 0, 1, 1)
end

function fortuneClass:update(dt)
    local width, height = love.graphics.getDimensions()
    local w = width
    local h = height
    if self.xMod == true then
        w = width/2
    end
    if not self.xConstant then
        self.x = w + self.xOffset
    end

    if self.yMod == true then
        h = height/2
    end
    if not self.yConstant then
        self.y = h + self.yOffset
    end
end

return Fortune