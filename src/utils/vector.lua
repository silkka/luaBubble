local vector = {}
vector.__index = vector

setmetatable(vector, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function vector.new(x,y)

    local self = setmetatable({}, vector)
    self.x = x and x or 0
    self.y = y and y or 0

    return self
end

function vector:add(x,y)
    self.x = self.x + x
    self.y = self.y + y

    return self
end

function vector:addVector( vector )
    self.x = self.x + vector.x 
    self.y = self.y + vector.y

    return self
end

function vector:negate()
    self.x = -self.x
    self.y = -self.y

    return self
end

function vector:copy()
    return vector(self.x, self.y)
end

return vector