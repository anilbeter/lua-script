-- global variable
message = 0

function getHalf(i)
    -- local variable
    local var = i
    var = var / 2
    return var
end

function love.draw()
    -- set font size to 50
    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.print(message)
end
