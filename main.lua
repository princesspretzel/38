local entities = {}
local Player = require('player')
local touching = false

local level = Level
local player = Player(400, 400)
local window = Window
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
    love.graphics.setBackgroundColor(255, 0, 0)
    for idx, entity in ipairs(entities) do
        entity:draw()
    end
    width, height = love.graphics.getDimensions()
    if w < 200 or h < 200 then
        print('you lose')
        love.graphics.clear(255,0,255)
    else
        love.resize(w, h)
    end
end

function love.update(dt)
    for idx, entity in ipairs(entities) do
        entity:update(dt)
    end
    width, height = love.graphics.getDimensions()
    w = width - 1
    h = height - 1
    if w < 200 or h < 200 then
        print('you lose')
        -- love.graphics.clear(255,0,255)
    else
        love.resize(w, h)
    end
end

function love.resize(w, h)
    love.window.setMode( w, h, {} )
end