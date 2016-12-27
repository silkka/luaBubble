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
    redBubbleImage = imageAssets["redBubble"]

    --Ship stuff
    ship = shipModule:new({
        x = (rightBound - leftBound)/2,
        y = game.height-40,
        image = imageAssets["redShip"],
        bubble = nil
    })
    
end

function game.update(dt)
    --Quit
    if love.keyboard.isDown('escape') then
        love.event.quit(0)
    end

    ship:update(dt)



end

function game.draw(dt)
    ship:draw(dt)
    --Lines
    love.graphics.line(leftBound,0,leftBound,game.height)
    love.graphics.line(rightBound,0,rightBound,game.height)
end

function game.mousepressed(x,y,button,istouch)
    if button == 1 then
        ship:shoot({x = x, y = y})
    elseif button == 2 then
        state:switch("game")
    end
end


return game