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

    love.graphics.polygon('fill', 0, 0, width, 0, width/2, height/2)
    love.graphics.setColor(127, 0, 255, 255)
    love.graphics.polygon('fill', 0, 0, 0, height, width/2, height/2)
    love.graphics.setColor(255, 255, 102, 255)
    love.graphics.polygon('fill', 0, height, width, height, width/2, height/2)
    love.graphics.setColor(255, 204, 204, 255)
    love.graphics.polygon('fill', width, 0, width, height, width/2, height/2)

    love.graphics.setColor(124,252,0, 255)
    love.graphics.print("enlightenment", width/2 - 50, height - 100, 0, 1, 1)
    love.graphics.setColor(204, 204, 255, 255)
    love.graphics.print("relief", width/2 - 20, 100, 0, 1, 1)
    love.graphics.setColor(251, 51, 51, 255)
    love.graphics.print("love", 100, height/2, 0, 1, 1)
    love.graphics.setColor(0, 191, 255, 255)
    love.graphics.print("achievement", width - 100 - 50, height/2, 0, 1, 1)
end

function choiceClass:update(dt)
--     local x, y = 0, 0

--     x = love.mouse.getX()
--     y = love.mouse.getY()

end

return Choice