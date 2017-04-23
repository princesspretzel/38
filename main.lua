local Triangle = require('triangle')
local Fortune = require('fortune')
local Level = require('level')
local Player = require('player')

local entities = { }
width, height = love.graphics.getDimensions()
shrinkRate = 1
chosen = ''
errorMargin = 20

--id, chosen, colorinfo, vertices
local topTriangle = Triangle('top', false, 150,200,200, 0,0,width,0,width/2,height/2)
local leftTriangle = Triangle('left', false, 127,0,255, 0,0,0,height,width/2,height/2)
local rightTriangle = Triangle('right', false, 255,255,102, 0,height,width,height,width/2,height/2)
local bottomTriangle = Triangle('bottom', false, 255,204,204, width,0,width,height,width/2,height/2)
table.insert(entities, topTriangle)
table.insert(entities, leftTriangle)
table.insert(entities, rightTriangle)
table.insert(entities, bottomTriangle)

--id, text, x,constant,mod,offset, y,constant,mod,offset, colorinfo
local topFortune = Fortune('top', 'lose headstart', width/2 - 50,false,true,-50, 100,true,false,0, 251,51,51)
local leftFortune = Fortune('left', 'dagger in heart', 70,true,false,0, height/2,false,true,0, 0,191,255)
local rightFortune = Fortune('right', 'infected wart', width - 170,false,false,-170, height/2,false,true,0, 230,130,210)
local bottomFortune = Fortune('bottom', 'smelliest fart', width/2-30,false,true,-30, height - 100,false,false,-100, 204,204,255)
table.insert(entities, topFortune)
table.insert(entities, leftFortune)
table.insert(entities, rightFortune)
table.insert(entities, bottomFortune)

level = Level(0, 0, 0)
table.insert(entities, level)

player = Player(400, 400, 1)
table.insert(entities, player)

music = love.audio.newSource('/audio/gamemusic.mp3')
music:setLooping(true)
music:play()

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

-- are a and b touching?
function isTouching(a, b)   
    if (a.x > (b.x + b.w)) or (b.x > (a.x + a.w)) then
        return false
    end  
    if (a.y > (b.y + b.h)) or (b.y > (a.y + a.h)) then
        return false
    end

    return true
end

function love.draw()
    if not (w < 200 or h < 200) then
        for idx, entity in ipairs(entities) do
            entity:draw()
        end
    else
        love.window.setTitle('u r looser')
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.print('you daed', w/2, h/2.5, 1, 2, 2)
        love.graphics.setBackgroundColor(0, 0, 0)
    end
end

function love.update(dt)
    local xTouching = false
    local yTouching = false

    if chosen == '' then
        for idx, entity in ipairs(entities) do
            if entity.text then                
                if player.x >= entity.x-errorMargin and player.x <= entity.x+errorMargin then
                    xTouching = true
                end
                if player.y >= entity.y-errorMargin and player.y <= entity.y+errorMargin then
                    yTouching = true
                end

                if xTouching and yTouching then
                    chosen = entity.id
                    return
                end
            end
        end
    -- else
    --     for idx, entity in ipairs(entities) do
    --         if entity.chosen then
    --             --triangle and fortune IDs match
    --             if entity.id == chosen then
    --                 entity.chosen = true
    --                 print('entity ID: ', entity.id)
    --             end
    --         end
    --     end
    end

    for idx, entity in ipairs(entities) do
        entity:update(dt)
    end
    width, height = love.graphics.getDimensions()
    w = width - shrinkRate
    h = height - shrinkRate
    if not (w < 200 or h < 200) then
        love.resize(w, h)
    end
end

function love.resize(w, h)
    love.window.setMode( w, h, {} )
end