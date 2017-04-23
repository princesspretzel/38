local levelClass = { }
levelClass.__index = levelClass

function Level(bR, bG, bB)
    local instance = {
        title = 'choose something bad to happen'
    }
    setmetatable(instance, levelClass)
    return instance
end

function levelClass:draw()
    love.window.setTitle(self.title)
end

function levelClass:update(dt)
    w, h = love.graphics.getDimensions()
    if w < 600 or h < 600 then
        if not (chosen == '') then
            self.title = 'excellent decision'
        else
            self.title = 'prepare for the takeover of your small small world'
        end
    end
    if w < 500 or h < 500 then
        if not (chosen == '') then
            self.title = 'indecision or laziness?'
        else
            self.title = 'it\'s coming'
        end
    end    
    if w < 400 or h < 400 then
        if not (chosen == '') then
            self.title = 'it\'s here'
        else
            self.title = 'some choices are made for us'
        end
    end
    if w < 300 or h < 300 then
        self.title = 'it\'s all there is'
    end
end

return Level