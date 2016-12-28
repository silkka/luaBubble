local ship = {x = 0, y = 0, image = nil, bubble = nil}
ship.__index = ship

setmetatable(ship, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function ship.new(args)
    local self = setmetatable({}, ship)
    self.x = args.x
    self.y = args.y
    self.image = args.image
    return self
end



function ship:getCenter()
    return vectorModule(self.x + self.image:getWidth()/2,self.y + self.image:getHeight()/2)
end

function ship:shoot(mouse)
    local center = self:getCenter()
    --Get the vector from the middle of the ship to the mouse coordinates
    local velocity = center:copy():negate():addVector(mouse)
    self.bubble = bubbleModule({
        x = center.x - bubbleDiameter/2,
        y = center.y - bubbleDiameter/2,
        image = redBubbleImage,
        velocity = velocity:setScale(shootingSpeed)
    })
end

function ship:update(dt)
    if love.keyboard.isDown('a') then
        self.x = self.x - 100*dt
    elseif love.keyboard.isDown('d') then
        self.x = self.x + 100*dt
    end

    if(self.bubble ~= nil) then
        self.bubble:update(dt)
    end
    
end

function ship:draw(dt)
    love.graphics.draw(self.image, self.x, self.y)
    if self.bubble ~= nil then
        
        love.graphics.draw(self.bubble.image, self.bubble.x, self.bubble.y)
        --print(self.bubble.x .. ',' .. self.bubble.y)
    end
end

return ship