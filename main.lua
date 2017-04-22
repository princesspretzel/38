local entities = {}
local Player = require('player')
local touching = false

table.insert(entities, player)

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