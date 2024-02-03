message = 0

function increaseMessage(num)
    message = message + num
end

increaseMessage(23)
-- now message equals to 23

function double(val)
    val = val * 2
    return val
end

message = double(message)
-- now message equals to 46

function love.draw()
    -- set font size to 50
    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.print(message) -- 46
end
