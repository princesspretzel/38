local playerClass = { }
playerClass.__index = playerClass

function Player(x, y)
    img = love.graphics.newImage('/images/skellyp.png')
    width, height = img:getDimensions( )
    local instance = {
        x = x,
        y = y,
        w = width,
        h = height,
        speed = 200,
        image = img
    }
    setmetatable(instance, playerClass)
    return instance
end

function playerClass:isOutOfBounds()
    local width, height = love.graphics.getDimensions()
    local window = {
        x = 0,
        y = 0,
        w = width,
        h = height
    }
    local i = isInside(self, window)
    print('is inside?', i)
    return not i
end

function playerClass:draw()
    love.graphics.draw(self.image, self.x, self.y)
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
    if love.keyboard.isDown('return') then
        love.window.close()
    end

    if dx ~= 0 or dy ~= 0 then
        local length = (dx^2+dy^2)^.5
        dx = dx/length * self.speed*dt * 2
        dy = dy/length * self.speed*dt * 2

        self.x = self.x + dx
        self.y = self.y + dy

        if self:isOutOfBounds() then
            print('out of bounds')
            love.graphics.print('out of bounds', 100, 100)
            love.graphics.clear(255,0,255)
            -- self.x = self.x - dx
            -- self.y = self.y - dy
        end
    end
end

return Player

