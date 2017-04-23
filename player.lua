local playerClass = { }
playerClass.__index = playerClass

function Player(x, y, image, imgWidth, imgHeight)
    local instance = {
        x = x,
        y = y,
        w = imgWidth,
        h = imgHeight,
        speed = 200,
        image = img
    }
    setmetatable(instance, playerClass)
    return instance
end

function playerClass:chooseImage(c)
    local img = ''
    if c == 'top' then
        img = '/images/skellyt1.png'
    end
    if c == 'right' then
        img = '/images/skellyt2.png'
    end
    if c == 'left' then
        img = '/images/skellyt3.png'
    end
    if c == 'bottom' then
        img = '/images/skellyt4.png'
    end
    return img
end

function playerClass:isOutOfBounds()
    local width, height = love.graphics.getDimensions()
    local window = {
        x = 0,
        y = 0,
        w = width,
        h = height
    }
    local edge, inside = isInside(self, window)
    return edge, not inside
end

function playerClass:eggCream()
    local secretSpot = {
        x = width - 100,
        y = height - 100,
        w = 100,
        h = 100
    }
    local inside = isTouching(self, secretSpot)
    return inside
end

function playerClass:draw()
    w, h = love.graphics.getDimensions() 
    if not (w < 200 and h < 200) then
        love.graphics.draw(self.image, self.x, self.y)
    end
end

function playerClass:update(dt)
    local dx, dy = 0, 0    

    if love.keyboard.isDown('left') then
        dx = -1
    end
    if love.keyboard.isDown('right') then
        dx = 1
    end
    if love.keyboard.isDown('down') then
        dy = 1
    end
    if love.keyboard.isDown('up') then
        dy = -1
    end

    edge, inside = self:isOutOfBounds()
    if inside then
        if edge == 'top' then
            self.y = self.y + shrinkRate*2
        end
        if edge == 'left' then
            self.x = self.x + shrinkRate*2
        end
        if edge == 'right' then
            self.x = self.x - shrinkRate*3
        end
        if edge == 'bottom' then
            self.y = self.y - shrinkRate*3
        end
    end

    if dx ~= 0 or dy ~= 0 then
        local length = (dx^2+dy^2)^.5
        dx = dx/length * self.speed*dt
        dy = dy/length * self.speed*dt

        self.x = self.x + dx
        self.y = self.y + dy

        if inside then
            self.x = self.x - dx
            self.y = self.y - dy
        end
    end
end

return Player