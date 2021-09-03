function love.load()
    Object = require("lib.classic")
    require "player"
    require "bullet"
    require "enemy"
    player = Player()
    enemy = Enemy()
    ListOfBullets = {}
    Points = 0
    love.graphics.setBackgroundColor(0, 100 / 255, 0)
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)
    for i, v in ipairs(ListOfBullets) do
        v:update(dt)
        v:checkCollision(enemy)
        if v.dead then
            table.remove(ListOfBullets, i)
        end
    end
end

function love.draw()
    player:draw()
    enemy:draw()
    for _, v in ipairs(ListOfBullets) do
        v:draw()
    end
    love.graphics.print("Points: " .. Points)
end

function love.keypressed(key)
    player:keyPressed(key)
end
