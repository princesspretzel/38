local fortuneClass = { }
fortuneClass.__index = fortuneClass

function Fortune(id, text, x, xConstant, xMod, xOffset, y, yConstant, yMod, yOffset, cR, cG, cB)
    -- no clue why this doesn't work
    -- textWidth = text:getWidth( )
    -- textHeight = text:getHeight( )
    local instance = {
        id = id,
        speed = 5,
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
        r = 0,
        sx = 1,
        sy = 1,
        cR = cR,
        cG = cG,
        cB = cB
    }
    setmetatable(instance, fortuneClass)
    return instance
end

function fortuneClass:chase(x, y)
    local moveX = self.speed
    local moveY = self.speed

    yDiff = math.abs(self.y - y)
    xDiff = math.abs(self.x - x)

    if yDiff > xDiff then
        if self.y > y then
            self.y = self.y - moveY
        else
            self.y = self.y + moveY
        end
    else
        if self.x > x then
            self.x = self.x - moveX
        else
            self.x = self.x + moveX
        end
    end
end

function fortuneClass:draw()
    if ((chosen == '') or (chosen == self.id)) then
        love.graphics.setColor(self['cR'], self['cG'], self['cB'], 255)
        love.graphics.print(self['text'], self['x'], self['y'], self['r'], self['sx'], self['sy'])
    end
end

function fortuneClass:update(dt)
    if chosen == '' then
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
    else
        self.r = math.random(-3,3)
        self.sx = (math.random(5,15))/10
        self.sy = (math.random(5,15))/10
    end
end

return Fortune