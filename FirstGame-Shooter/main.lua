function love.load()
    number = 0
end

function love.update(dt)
    number = number + 1
end

function love.draw()
    -- mode, x, y, width, height
    love.graphics.rectangle("fill", 200, 400, 200, 100)
    -- mode, x, y, radius
    love.graphics.circle("fill", 100, 100, 100)
end
