function love.load()
    
end

function love.update(dt)
    
end

function love.draw()
    -- setcolor(r,g,b)
    love.graphics.setColor(0, 1, 1)
    love.graphics.rectangle("fill", 200, 400, 200, 100)
   
    love.graphics.setColor(204/255, 12/255, 23/255)
    love.graphics.circle("fill", 100, 100, 100)
end
