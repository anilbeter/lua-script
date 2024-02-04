message = 0

testScores = {23, 99, 105}
-- assigning value with .
testScores.subject = "science"

-- tables with for loop

-- i = index, s = value
for i, s in ipairs(testScores) do
    message = message + s
end
-- first iteration -> i = 1, s = 23, message = 23
-- second iteration -> i = 2, s = 99, message = 23 + 99
-- third iteration -> i = 3, s = 105, message = 105 + 23 + 99

function love.draw()
    -- set font size to 50
    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.print(testScores.subject) -- science
end
