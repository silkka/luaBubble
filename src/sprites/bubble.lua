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
    return self
end

function bubble:update(dt)
    self.x = self.x + self.velocity.x*dt
    self.y = self.y + self.velocity.y*dt
    
end

return bubble