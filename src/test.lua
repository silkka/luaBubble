local test={}
test.__index = test

function test.new( x )
    local self = setmetatable({}, test)
    self.value = x
    return self
end

function test.setValue(self,val)
    self.value = val
end

function test.getValue(self)
    return self.value
end

--asd = test.new(1)
--asd2 = test.new(2)
--
--print (asd.value)
--print (asd2.value)
--
--asd:setValue(12)
--asd2:setValue(33)
--
--print (asd.value)
--print (asd2.value)


return test