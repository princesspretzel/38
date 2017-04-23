local levelClass = { }
levelClass.__index = levelClass

function Level(bR, bG, bB)
    local instance = {
        title = 'choose yr misfortune',
        backgroundR = 0,
        backgroundG = 0,
        backgroundB = 0
    }
    setmetatable(instance, levelClass)
    return instance
end

function levelClass:draw()
    love.graphics.setBackgroundColor(self.backgroundR, self.backgroundG, self.backgroundB)
    love.window.setTitle(self.title)
end

function levelClass:update(dt)
    w, h = love.graphics.getDimensions()
    if w < 600 or h < 600 then
        self.title = 'prepare for the shrinkage'
        self.backgroundR = 30
        self.backgroundG = 50
        self.backgroundB = 70        
    end
    if w < 500 or h < 500 then
        self.title = 'it\'s coming'
        self.backgroundR = 90
        self.backgroundG = 110
        self.backgroundB = 130
    end    
    if w < 400 or h < 400 then
        self.title = 'it\'s here'
        self.backgroundR = 150
        self.backgroundG = 190
        self.backgroundB = 170
    end
    if w < 300 or h < 300 then
        self.title = 'it\'s taken over your small small world'
        self.backgroundR = 250
        self.backgroundG = 230
        self.backgroundB = 210
    end
end

return Level