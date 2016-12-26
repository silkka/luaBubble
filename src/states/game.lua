local game = {}
function game.load()
    shipModule = require("sprites/ship")
    bubbleModule = require("sprites/bubble")
    game.width, game.height, game.flags = love.window.getMode()
    grid = {width = 12}
    bubbleDiameter = 32
    leftBound = bubbleDiameter
    rightBound = leftBound + grid.width*bubbleDiameter

    --Image loading
    redBubbleImage = love.graphics.newImage('images/redbubble.png')

    --Ship stuff
    ship = shipModule:new({
        x = (rightBound - leftBound)/2,
        y = game.height-40,
        image = love.graphics.newImage('images/bubble_spaceship.png'),
        bubble = nil
    })
    
end

function game.update(dt)
    --Quit
    if love.keyboard.isDown('escape') then
        love.event.quit(0)
    end

    if love.keyboard.isDown('a') then
        ship.x = ship.x - 100*dt
    elseif love.keyboard.isDown('d') then
        ship.x = ship.x + 100*dt
    end



end

function game.draw(dt)
    love.graphics.draw(ship.image, ship.x, ship.y)
    if ship.bubble ~= nil then
        love.graphics.draw(ship.bubble.image, ship.bubble.x, ship.bubble.y)
    end
    --Lines
    love.graphics.line(leftBound,0,leftBound,game.height)
    love.graphics.line(rightBound,0,rightBound,game.height)
end

function game.mousepressed(x,y,button,istouch)
    if button == 1 then
        ship:shoot()
    elseif button == 2 then
        state:switch("game")
    end
end


return game