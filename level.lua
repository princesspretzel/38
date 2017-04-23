local levelClass = { }
levelClass.__index = levelClass

function Level(bR, bG, bB)
    local instance = {
        title = 'choose something bad to happen',
        backgroundR = 102,
        backgroundG = 178,
        backgroundB = 255
    }
    setmetatable(instance, levelClass)
    return instance
end

function levelClass:draw()
    love.window.setTitle(self.title)
    love.graphics.setBackgroundColor(self.backgroundR, self.backgroundG, self.backgroundB)
end

function levelClass:update(dt)
    w, h = love.graphics.getDimensions()
    if w < 500 or h < 500 then
        if not (chosen == '') then
            self.title = 'excellent decision'
        else
            self.title = 'prepare for the takeover of your small small world'
        end
        if foundSecret then
            self.title = 'this will take the edge off'
        end
        self.backgroundR = 255        
        self.backgroundG = 102
        self.backgroundB = 255
    end
    if w < 400 or h < 400 then
        if not (chosen == '') then
            self.title = 'don\'t make a big deal'
        else
            self.title = 'is it getting stuffy in here or wut'
        end
        if foundSecret then
            self.title = 'tastes good enough to forget'
        end
        self.backgroundR = 255        
        self.backgroundG = 102
        self.backgroundB = 255
    end
    if w < 300 or h < 300 then
        if not (chosen == '') then
            self.title = 'indecision or laziness?'
        else
            self.title = 'it\'s coming'
        end
        if foundSecret then
            self.title = 'i\'m melting'
        end
        self.backgroundR = 255        
        self.backgroundG = 102
        self.backgroundB = 255
    end   
    if w < 200 or h < 200 then
        if not (chosen == '') then
            self.title = 'it\'s here'
        else
            self.title = 'some choices are made for us'
        end
        if foundSecret then
            self.title = 'nothing lasts'
        end
        self.backgroundR = 255        
        self.backgroundG = 255
        self.backgroundB = 204
    end
    if w < 100 or h < 100 then
        self.title = 'it\'s all there is'
        self.backgroundR = 0
        self.backgroundG = 0
        self.backgroundB = 0
    end
end

return Level