local splash={}

function splash.load( )

    --vec1 = vectorModule(1,1)
    --vec2 = vectorModule(2,2)
--
    --print(vec1:add(1,1).x .. ',' .. vec1:add(1,1).y)
    --vec1:addVector(vec2)
    --print(vec1.x .. ',' ..  vec1.y )
    --print(vec2.x .. ',' ..  vec2.y )
    --vec1:negate()
    --print(vec1.x .. ',' ..  vec1.y )
    
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