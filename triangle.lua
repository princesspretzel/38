local triangleClass = { }
triangleClass.__index = triangleClass

function Triangle(id, chosen, cR, cG, cB, x1, y1, x2, y2, x3, y3)
    local instance = {
        id = id,
        chosen = chosen,
        cR = cR,
        cG = cG,
        cB = cB,
        x1 = x1,
        y1 = y1,
        x2 = x2,
        y2 = y2,
        x3 = x3,
        y3 = y3
    }
    setmetatable(instance, triangleClass)
    return instance
end

function triangleClass:draw()
    love.graphics.setColor(self['cR'], self['cG'], self['cB'], 255)
    love.graphics.polygon('fill', self['x1'], self['y1'], self['x2'], self['y2'], self['x3'], self['y3'])
end

function triangleClass:update(dt)
    local width, height = love.graphics.getDimensions()

    if not (self.x1 == 0) then
        self.x1 = width
    end   
    if not (self.y1 == 0) then
        self.y1 = height
    end
 
    if not (self.x2 == 0) then
        self.x2 = width
    end   
    if not (self.y2 == 0) then
        self.y2 = height
    end

    if chosen == '' then
        self.x3 = width/2
        self.y3 = height/2
    else
        if self.chosen == true then
            if self.id == 'top' then
                self.x3 = width/2
                self.y3 = self.y3 + 10
            end
            if self.id == 'left' then
                self.x3 = self.x3 + 10
                self.y3 = height/2
            end
            if self.id == 'right' then
                self.x3 = self.x3 - 10
                self.y3 = height/2
            end
            if self.id == 'bottom' then
                self.x3 = width/2
                self.y3 = self.y3 - 10
            end
        else
            if self.id == 'top' then
                self.x3 = width/2
                self.y3 = self.y3 - 10
            end
            if self.id == 'left' then
                self.x3 = self.x3 - 10
                self.y3 = height/2
            end
            if self.id == 'right' then
                self.x3 = self.x3 + 10
                self.y3 = height/2
            end
            if self.id == 'bottom' then
                self.x3 = width/2
                self.y3 = self.y3 + 10
            end
        end
    end
end

return Triangle