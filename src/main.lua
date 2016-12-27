debug = true
vectorModule = require("utils/vector")
state = {current = {}}
imageAssets = {}
function love.load(arg)
    --Add states
    state.game = require("states/game")
    state.splash = require("states/splash")
    state:switch("splash")   
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
