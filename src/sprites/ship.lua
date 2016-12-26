local ship = {x = 0, y = 0, image = nil, bubble = nil}
function ship:new(args)
    self.x = args.x
    self.y = args.y
    self.image = args.image
    self.bubble = args.bubble
    return self
end



function ship:getCenter()
    return {x = self.x + self.image:getWidth()/2,
            y = self.y + self.image:getHeight()/2
            }
end

function ship:shoot()
    local center = self:getCenter()
    self.bubble = bubbleModule:new({
        x = center.x,
        y = center.y,
        image = redBubbleImage
    })
    return self.x
end

return ship