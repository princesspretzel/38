local fortuneClass = { }
fortuneClass.__index = fortuneClass

function Fortune(id, text, x, xConstant, xMod, xOffset, y, yConstant, yMod, yOffset, cR, cG, cB)
    -- no clue why this doesn't work
    -- textWidth = text:getWidth( )
    -- textHeight = text:getHeight( )
    local instance = {
        id = id,
        text = text,
        w = 70,
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

function fortuneClass:chase()
    local moveX = love.math.random(20)
    local moveY = love.math.random(20)

    local updown = love.math.random(0,1)
    if updown == 0 then
        self.y = self.y - moveY
    else
        self.y = self.y + moveY
    end

    local leftright = love.math.random(0,1)
    if leftright == 0 then
        self.x = self.x - moveX
    else
        self.x = self.x + moveX
    end
end

function fortuneClass:draw()
    if ((chosen == '') or (chosen == self.id)) then
        love.graphics.setColor(self['cR'], self['cG'], self['cB'], 255)
        love.graphics.print(self['text'], self['x'], self['y'], 0, 1, 1)
    end
end

function fortuneClass:update(dt)
    local w = width
    local h = height
    local chaser = chosen

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

    if (self.id == chaser) then
        self:chase()
    end
end

return Fortune