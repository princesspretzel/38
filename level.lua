local levelClass = { }
levelClass.__index = levelClass

function Level(bR, bG, bB)
    local instance = {
        backgroundR = 0,
        backgroundG = 0,
        backgroundB = 0
    }
    setmetatable(instance, levelClass)
    return instance
end

function levelClass:draw()
    love.graphics.setBackgroundColor(self.backgroundR, self.backgroundG, self.backgroundB) 
end

function levelClass:update(dt)
    width, height = love.graphics.getDimensions()   
    if w < 500 or h < 500 then
        self.backgroundR = 100
        self.backgroundG = 100
        self.backgroundB = 100
    end    
    if w < 400 or h < 400 then
        self.backgroundR = 200
        self.backgroundG = 200
        self.backgroundB = 200
    end
    if w < 300 or h < 300 then
        self.backgroundR = 300
        self.backgroundG = 300
        self.backgroundB = 300
    end
end

return Level