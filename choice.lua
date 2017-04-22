local choiceClass = { }
choiceClass.__index = choiceClass

function Choice()
    local instance = {
        level = 0,
        decision = 0,
    }
    setmetatable(instance, choiceClass)
    return instance
end

function choiceClass:draw()
    local width, height = love.graphics.getDimensions()
    love.graphics.print("earth", width/2, height - 100)
    love.graphics.print("air", width/2, 100)
    love.graphics.print("fire", 100, height/2)
    love.graphics.print("water", width - 100, height/2)
end

function choiceClass:update(dt)
--     local x, y = 0, 0

--     x = love.mouse.getX()
--     y = love.mouse.getY()

end

return Choice