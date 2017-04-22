local entities = {}
local Level = require('level')
local Player = require('player')

local level = Level(0, 0, 0)
local player = Player(400, 400, 1)
table.insert(entities, level)
table.insert(entities, player)

-- is a inside b?
function isInside(a, b)
    local inside = true
    if a.x <= b.x then
        inside = false
    end
    if (a.x + a.w) >= (b.x + b.w) then
        inside = false
    end
    if a.y <= b.y then
        inside = false
    end
    if (a.y + a.h) >= (b.y + b.h) then
        inside = false
    end
    return inside
end

function love.draw()
    love.window.setTitle('you are your own worst enemy')
    for idx, entity in ipairs(entities) do
        entity:draw()
    end
end

function love.update(dt)
    width, height = love.graphics.getDimensions()
    w = width - 10
    h = height - 10
    if not (w < 200 or h < 200) then
        love.resize(w, h)
    end
    for idx, entity in ipairs(entities) do
        entity:update(dt)
    end
end

function love.resize(w, h)
    love.window.setMode( w, h, {} )
end