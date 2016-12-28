local grid = {x = 0, y = 0}
grid.__index = grid

setmetatable(grid, {
  __call = function (cls, ...)
    return cls.new(...)
  end,
})

function grid.new(args)
    local self = setmetatable({}, grid)
    self.x = args.x
    self.y = args.y
    self:make(10,10)
    return self
end

function grid:make( height, width )
    self.grid = {}
    for i = 1, height, 1 do
        self.grid[i] = {
            offset = i%2, 
            y = self.y + (i-1)*bubbleDiameter, 
            x = self.x + (i%2)*bubbleDiameter/2}
        
        for j = 1, (width - self.grid[i].offset), 1 do
            self.grid[i][j] = {
                image = getBubbbleTexture(getRandomColor()),
                x=self.grid[i].x + (j-1)*bubbleDiameter
                }
        end
    end
end

function getRandomColor()
    return bubbleColors[math.random(1,numberOfColors)]
end

function getBubbbleTexture( color )
    return imageAssets[color .. 'Bubble']
end

function grid:draw(dt)
    for i = 1, #self.grid,1 do
        for j = 1, #self.grid[i],1 do
        
            love.graphics.draw(self.grid[i][j].image, self.grid[i][j].x, self.grid[i].y)        
        end
    end
    
end

return grid