debug = true
state = { game = require("states/game")}

function love.load(arg)
    state:switch("game")
    state.current.load()    
end

function love.update(dt)
    state.current.update(dt)
end

function love.draw(dt)
    state.current.draw(dt)
end

function love.mousepressed(x,y,button,istouch)
    state.current.mousepressed(x,y,button,istouch)
end

function state:switch(name)
    self.current = self[name]
    self.current.load()
end