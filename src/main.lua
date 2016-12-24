debug = true

function love.load(arg)
    game = {}
    game.width, game.height, game.flags = love.window.getMode()
    grid = {width = 12}
    bubbleDiameter = 32
    leftBound = bubbleDiameter
    rightBound = leftBound + grid.width*bubbleDiameter

    --Ship stuff
    ship = {}
    ship.image = love.graphics.newImage('images/bubble_spaceship.png')
    ship.start = {x = (rightBound - leftBound)/2, y = game.height-ship.image:getHeight()/2}
end

function love.update(dt)
    --Quit
    if love.keyboard.isDown('escape') then
        love.event.quit(0)
    end


end

function love.draw(dt)
    love.graphics.draw(ship.image, ship.start.x, ship.start.y)
    --Lines
    love.graphics.line(leftBound,0,leftBound,game.height)
    love.graphics.line(rightBound,0,rightBound,game.height)
end
