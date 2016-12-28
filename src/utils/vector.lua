local vector = {}
vector.__index = vector

setmetatable(vector, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
  __mul = function (scalar, table)
        tbl = vector.new(scalar*table.x,scalar*table.y)
        return tbl
  end,
})

function vector.new(x,y)

    local self = setmetatable({}, vector)
    self.x = x and x or 0
    self.y = y and y or 0

    return self
end

--function vector.__mul(scalar, table)
--    tbl = vector.new(scalar*table.x,scalar*table.y)
--    return tbl
--end

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

function vector:length()
    return math.sqrt(math.pow(self.x,2) + math.pow(self.y,2))
end

function vector:normalize()
    local len = self:length()
    self.x = self.x / len
    self.y = self.y / len
    return self
end

function vector:setScale( scale )  
    self:normalize()
    self.x = self.x * scale
    self.y = self.y * scale
    return self
end

return vector