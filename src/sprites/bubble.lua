local bubble = {x = 0, y = 0, image = nil}
bubble.__index = bubble

setmetatable(bubble, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function bubble.new(args)
    local self = setmetatable({}, bubble)
    self.x = args.x
    self.y = args.y
    self.image = args.image
    self.velocity = (args.velocity and args.velocity or vectorModule(0,0))
    self.adjustedRightBound = rightBound - bubbleDiameter
    return self
end

function bubble:update(dt)
    self:move(dt)
end

function bubble:move(dt)
    self.y = self.y + self.velocity.y*dt
    local nextX = self.x + self.velocity.x*dt
    if self.adjustedRightBound <= nextX then
        local remainder = nextX - self.adjustedRightBound
        self.x = self.adjustedRightBound - remainder        
        self.velocity.x = -self.velocity.x
    elseif nextX <= leftBound then
        local remainder = leftBound - nextX
        self.x = leftBound + remainder
        self.velocity.x = -self.velocity.x
    else
        self.x = nextX
    end
end

return bubble