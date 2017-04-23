local Fortune = require('fortune')
local Level = require('level')
local Player = require('player')
local Triangle = require('triangle')

local entities = { }
width, height = love.graphics.getDimensions()
shrinkRate = 1
chosen = ''
ended = false
errorMargin = 10

--id, chosen, colorinfo, vertices
local topTriangle = Triangle('top', false, 150,200,200, 0,0,width,0,width/2,height/2)
local leftTriangle = Triangle('left', false, 127,10,255, 0,height,0,0,width/2,height/2)
local rightTriangle = Triangle('right', false, 255,204,204, width,0,width,height,width/2,height/2)
local bottomTriangle = Triangle('bottom', false, 255,255,102, width,height,0,height,width/2,height/2)
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

i = '/images/skellyt.png'
img = love.graphics.newImage(i)
local imgWidth, imgHeight = img:getDimensions( )
player = Player(width/2, height/2, img, imgWidth, imgHeight)
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

function setEndGame()
    love.window.setTitle('u r looser')
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print('you daed', w/2, h/2.5, 1, 2, 2)
    love.graphics.setBackgroundColor(0, 0, 0)
end

function love.load()
    music = love.audio.newSource('/audio/gamemusic.mp3')
    music:setLooping(true)
    music:play()
end

function love.draw()
    if not (w < 200 or h < 200) and not ended then
        for idx, entity in ipairs(entities) do
            entity:draw()
        end
    else
        setEndGame()
    end
end

function love.update(dt)
    for idx, entity in ipairs(entities) do
        entity:update(dt)
        if chosen == '' then
            -- yucky way to determine if entity is a Fortune
            if entity.text then
                local touch = isTouching(player, entity)
                if touch then
                    -- move player away after the choice is made
                    player.x = width/2
                    player.y = height/2
                    chosen = entity.id
                    return
                end
            end
        else
            -- yucky way to determine if entity is a Fortune
            if (entity.x3 and entity.y3) then
                if entity.id == chosen then
                    entity.chosen = true
                end
            end
            if player then
                local i = player:chooseImage(chosen)
                local img = love.graphics.newImage(i)
                local iWidth, iHeight = img:getDimensions( )
                player.image = img
                player.w = iWidth
                player.h = iHeight
            end
            if entity.text and (entity.id == chosen) then
                local touch = isTouching(player, entity)
                if touch then
                    ended = true
                    return
                end
            end
        end
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