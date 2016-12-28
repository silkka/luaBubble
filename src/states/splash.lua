local splash={}

function splash.load( )
    imageAssets.redBubble = love.graphics.newImage('images/redbubble.png')
    imageAssets.redShip = love.graphics.newImage('images/bubble_spaceship.png')
    
    state:switch("game")
end

function splash.update(dt)

end

function splash.draw(dt)

end

function splash.mousepressed(x,y,button,istouch)

end

return splash