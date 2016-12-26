local bubble = {x = 0, y = 0, image = nil}
function bubble:new(args)
    self.x = args.x
    self.y = args.y
    self.image = args.image
    
    return self
end

return bubble